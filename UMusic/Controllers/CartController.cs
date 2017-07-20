using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using UMusic.Models;

namespace UMusic.Controllers
{
    public class CartController : Controller
    {
        //
        // GET: /Cart/
        UMusicEntities musicDB = new UMusicEntities();
        /// <summary>
        /// 购物车
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Cart(string id)
        {
            if (Session["username"] == null) {
               // Session["url"] = "/Cart/Cart";
                return RedirectToAction("Login", "Function");
            }
               
            string username = Session["username"].ToString();
            int cartid =0;
            SqlParameter uname = new SqlParameter("@username", username);
            var cart = musicDB.Database.SqlQuery<tb_cart>(//get the cart id
                "exec proc_userid @username", uname
                ).Single();

            cartid=cart.cartId;
            int count = musicDB.tb_cartDetails.Where(t=>t.cartId==cartid).Count();

            if (count == 0)
            {
                var cartempty = musicDB.view_cartItem.Where(ct=>ct.cartid==cartid).ToList();
                return View(cartempty);
            }
            if (id != null)//删除购物车商品
            {
                int albumid = int.Parse(id);
                var album = (from cd in musicDB.tb_cartDetails
                             where cd.cartId == cartid && cd.albumId == albumid//
                             select cd).Single();
                var albumstorage = musicDB.tb_album.Where(a => a.albumId == albumid).Single();
                int quantity = album.quantity;
                albumstorage.leftNum += quantity;//购物车内商品删除，恢复库存
                musicDB.tb_cartDetails.Remove(album);
                musicDB.SaveChanges();
                return Content("true");
            }
            var cartItem = musicDB.view_cartItem.Where(vc=>vc.cartid==cartid).ToList();//根据购物车ID 找购物信息
            double sum=0;
            foreach (view_cartItem v in cartItem) {
                sum += v.quantity * v.price;//计算总价
            }
            ViewBag.cartTotal = sum;
            return View(cartItem);
        }
        /// <summary>
        /// 购物车订单
        /// </summary>
        /// <returns></returns>
        public ActionResult cartOrder()
        {
            string username = Session["username"].ToString();
            var ItemAt = new CartOrder();
            SqlParameter user = new SqlParameter("@username",username);
            var cart = musicDB.Database.SqlQuery<tb_cart>(
                    "exec proc_userid @username",user
                ).Single();
            int cartID = cart.cartId;//根据username 找购物车ID
            ViewData["cartid"] = cartID;
            ItemAt.vc = musicDB.view_cartItem.Where(vc => vc.cartid == cartID).ToList();
            ItemAt.at = (from at in musicDB.tb_artist
                         select at).OrderByDescending(x => x.artistId).Skip(4).Take(4).ToList();
            //显示订单信息到前台
            double sum = 0;
            foreach (view_cartItem v in ItemAt.vc)
            {
                sum += v.quantity * v.price;//计算总价
            }
            ViewData["total"] = sum;
            return View(ItemAt);
        }

        /// <summary>
        /// 添加购物车
        /// </summary>
        /// <param name="albumId"></param>
        /// <param name="quantity"></param>
        /// <returns></returns>
        [HttpPost]
        public string CartAdd(string albumId,string quantity)
        {
            int Id = int.Parse(albumId);
            int num = int.Parse(quantity);
            int cartid=0;
            string username = Session["username"].ToString();
            tb_cartDetails cartDetail = new tb_cartDetails();
            int storage = (from al in musicDB.tb_album
                           where al.albumId == Id
                           select al.leftNum).Single();
            if (num >storage||num==storage)
                return "库存不足，无法完成添加";
            SqlParameter uname = new SqlParameter("@username", username);
            var cart = musicDB.Database.SqlQuery<tb_cart>(
                "exec proc_userid @username", uname
                ).Single();

            cartid = cart.cartId;
    
            int count = musicDB.tb_cartDetails.Where(cd=>cd.cartId==cartid).Count();
           
            if (count == 0)
            {
                try
                {
                    cartDetail.cartId = cartid;
                    cartDetail.albumId = Id;
                    cartDetail.quantity = num;

                    musicDB.tb_cartDetails.Add(cartDetail);
                    musicDB.SaveChanges();
                }
                catch(Exception e) {
                    throw e;
                }
            }
            
            else 
            {
                
                int c = (from cd in musicDB.tb_cartDetails
                             where cd.cartId==cartid&&cd.albumId==Id
                             select cd).Count();
                if (c > 0)
                {
                    try
                    {
                        var album = (from cd in musicDB.tb_cartDetails
                                     where cd.cartId == cartid && cd.albumId == Id
                                     select cd).Single();
                        album.quantity += num;
                        musicDB.SaveChanges();
                    }
                    catch (Exception e){
                        throw e;
                    }
                   
                }
                else
                {
                    try
                    {
                        cartDetail.cartId = cartid;
                        cartDetail.albumId = Id;
                        cartDetail.quantity = num;

                        musicDB.tb_cartDetails.Add(cartDetail);
                        musicDB.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }

                }
            }

            return "商品添加成功";
           
        }
        /// <summary>
        /// 更新购物车
        /// </summary>
        /// <param name="albumId"></param>
        /// <param name="quantity"></param>
        /// <returns></returns>
        [HttpPost]
        public string UpdateCart(string albumId, string quantity) {
            int id = int.Parse(albumId);
            int num = int.Parse(quantity);
            string username = Session["username"].ToString();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();

            int cartid = (from c in musicDB.tb_cart
                          where c.userId == userid
                          select c.cartId).Single();
            int cartnum = (from cd in musicDB.tb_cartDetails
                           where cd.cartId == cartid && cd.albumId == id
                           select cd.quantity).Single();
            double total = 0;
            var album = musicDB.tb_album.Where(al=>al.albumId==id).Single();
            if (num > album.leftNum)
                return "false";
            else {
                if (num > cartnum)
                {
                    album.leftNum = album.leftNum - (num - cartnum);
                    var cart = musicDB.tb_cartDetails.Where(c => c.albumId == id).Single();
                    cart.quantity = num;
                    musicDB.SaveChanges();//判断购物车对应商品数量与输入值的大小关系，据此更新库存
                }
                else if (num < cartnum)
                {
                    album.leftNum = album.leftNum + (cartnum - num);
                    var cart = musicDB.tb_cartDetails.Where(c => c.albumId == id).Single();
                    cart.quantity = num;
                    musicDB.SaveChanges();
                }
                else {
                    var cart = musicDB.tb_cartDetails.Where(c => c.albumId == id).Single();
                    cart.quantity = num;
                    musicDB.SaveChanges();
                }
                //calculate the total
                 //total = album.price * cart.quantity;
                var viewCart = musicDB.view_cartItem.Where(vc=>vc.cartid==cartid).ToList();
                foreach (view_cartItem v in viewCart)
                {
                    total += v.quantity * v.price;
                }
               
            }
            return total.ToString();
        }
        /// <summary>
        /// 付款页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Pay(int id) {
            //show the order id
            ViewBag.orderid = id;
            //deal with the cart order
            return View();
        }
        /// <summary>
        /// 付款
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="paypassword"></param>
        /// <returns></returns>
        [HttpPost]
        public string Pay(string orderID, string paypassword)
        {
            int orderid = int.Parse(orderID);
            string username = Session["username"].ToString();
            string pwd = (from u in musicDB.tb_user
                         where u.UserName == username
                         select u.password).Single();
            if (pwd.Equals(paypassword))
            {
                //pay success meanwhile update the status of order
                var order = musicDB.tb_order.Where(o => o.orderId == orderid).Single();
                order.orderStatus = "已付款";
                musicDB.SaveChanges();
                return "true";
            }
               
            else
                return "false";
        }
        /// <summary>
        /// 订单页
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Order(string id)
        {
            int orderid = int.Parse(id);
            var odetails = new OrderAl();

            odetails.item = musicDB.view_OrderItem.Where(o => o.OrderID == orderid).ToList();
            odetails.liat = (from at in musicDB.tb_artist
                                 select at).OrderBy(a=>a.localId).Skip(10).Take(4).ToList();
            double sum = 0;
            foreach (view_OrderItem i in odetails.item) { 
            sum += i.quantity * i.unitprice;
            }
            ViewBag.total = sum;

            ViewBag.id = orderid;
            return View(odetails);
        }
        /// <summary>
        /// 订单回调
        /// </summary>
        /// <param name="albumid"></param>
        /// <param name="quantity"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Order(string albumid, string quantity, string username)
        {
           
            int id = int.Parse(albumid);
            int num = int.Parse(quantity);
              //check the storage 
            int storage = (from a in musicDB.tb_album
                           where a.albumId == id
                           select a.leftNum).Single();
            if (num > storage)
                return Content("false");
              //订单创建并返回订单号  
                    int orderid = createOrder(username);
                    createDetails(orderid, id, num);
                    return Content(orderid.ToString());
                
        }
        /// <summary>
        ///创建订单
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public int  createOrder(string username){
            tb_order order = new tb_order();
            order.orderdate = System.DateTime.Now;
            order.orderStatus = "未付款";
            order.createDate = System.DateTime.Now;
            order.userid = (from u in musicDB.tb_user
                            where u.UserName == username
                            select u.UserId).Single();
            order.total = 1;
            musicDB.tb_order.Add(order);
            musicDB.SaveChanges();
            return order.orderId;
        }
       /// <summary>
       /// 丰富订单详情
       /// </summary>
       /// <param name="orderid"></param>
       /// <param name="albumid"></param>
       /// <param name="num"></param>
       /// <returns></returns>
        public bool createDetails(int orderid,int albumid,int num) {
            //insert order details
            tb_orderDetails orderDetails = new tb_orderDetails();
            orderDetails.orderId = orderid;
            orderDetails.albumId = albumid;
            orderDetails.unitprice = (from a in musicDB.tb_album
                                      where a.albumId == albumid
                                      select a.price).Single();
            ////how to deliver the number of album?
            orderDetails.quantity = num;
            musicDB.tb_orderDetails.Add(orderDetails);
            //change the storage 
            var album = musicDB.tb_album.Where(a => a.albumId == albumid).Single();
            album.leftNum -= num;
            musicDB.SaveChanges();
            return true;
        }
        /// <summary>
        /// 解析JSON字符串生成对象实体
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="json">json字符串(eg.{"ID":"112","Name":"石子儿"})</param>
        /// <returns>对象实体</returns>
        //public static T DeserializeJsonToObject<T>(string json) where T : class
        //{
        //    JsonSerializer serializer = new JsonSerializer();
        //    StringReader sr = new StringReader(json);
        //    object o = serializer.Deserialize(new JsonTextReader(sr), typeof(T));
        //    T t = o as T;
        //    return t;
        //}
        //insert into music 
        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string AjaxDel(int id) {
            
            return "true";
        }
        /// <summary>
        /// 插入购物车
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public int CartId(string username) {
            tb_cart cart = new tb_cart();
            SqlParameter uname = new SqlParameter("@username", username);
            int id = (from u in musicDB.tb_user
                      where u.UserName == username
                      select u.UserId).Single();
            
            return id;
        }
        /// <summary>
        /// 购物车订单回调
        /// </summary>
        /// <param name="cid"></param>
        /// <returns></returns>
        [HttpPost]
        public int CreateCartOrderID(string cid) {
            int id = int.Parse(cid);
            var citem = musicDB.view_cartItem.Where(vc => vc.cartid == id).ToList();
            string username = Session["username"].ToString();
            int oid = createOrder(username);
            tb_orderDetails od = new tb_orderDetails();
            foreach (view_cartItem cview in citem)
            {
                od.albumId = cview.albumid;
                od.quantity = cview.quantity;
                od.unitprice = cview.price;
                od.orderId = oid;
                musicDB.tb_orderDetails.Add(od);
                musicDB.SaveChanges();
            }//将购物车中的商品信息写入订单。
          

            var cartderails = musicDB.tb_cartDetails.Where(cd => cd.cartId == id).ToList();
            foreach (tb_cartDetails cd in cartderails)
            {//生成订单后删除购物车信息
                musicDB.tb_cartDetails.Remove(cd);
            }

            musicDB.SaveChanges();

            return oid;
        }
       
        
     
    }
}
