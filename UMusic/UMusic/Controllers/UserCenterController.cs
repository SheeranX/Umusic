using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UMusic.Models;

namespace UMusic.Controllers
{
    public class UserCenterController : Controller
    {
        //
        // GET: /UserCenter/
        UMusicEntities musicDB = new UMusicEntities();
      
        public ActionResult Index()
        {
            if (Session["username"] == null)
                return RedirectToAction("Login", "Function");
            string username = Session["username"].ToString();
            //  string username = "edsheeran";
            //int userid = (from u in musicDB.tb_user
            //              where u.UserName == username
            //              select u.UserId).Single();

            //int cartid = (from c in musicDB.tb_cart
            //              where c.userId == userid
            //              select c.cartId).Single();


            //ViewData["userid"] = userid;
            //var userCenter = new UserCenterModel();
            //userCenter.user = musicDB.tb_user.Where(u => u.UserName == username).Single();
            //// var details = musicDB.tb_userDetails.Where(u => u.userId == userid).Single();
            ////    if(details==null)
            //userCenter.udetails = musicDB.tb_userDetails.Where(u => u.userId == userid).Single();

            //ViewBag.gender = userCenter.udetails.gender;
            //ViewBag.nickname = userCenter.udetails.nickname;

            //userCenter.cartItem = musicDB.view_cartItem.Where(vc => vc.cartid == cartid).ToList();
            //userCenter.collect = musicDB.view_collection.Where(c => c.userid == userid).ToList();
            //userCenter.vcenter = musicDB.view_UserCenterOrder.Where(o => o.userid == userid).ToList();
            //userCenter.waitPayOrder = (from vw in musicDB.view_UserCenterOrder
            //                           where vw.userid == userid && vw.OrderStatus == "未付款"
            //                           select vw
            //                               ).ToList();

            return Redirect("/UserCenter/Index.aspx");
        }

        /// <summary>
        /// 移除收藏
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string CoRemove(string id) {
            string username = Session["username"].ToString();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();
            int Id = int.Parse(id);
            var Collection = (from c in musicDB.tb_collection
                                  where c.userid==userid && c.albumId==Id
                                  select c).Single();
            musicDB.tb_collection.Remove(Collection);
            musicDB.SaveChanges();
          
            return "true";
        }
        /// <summary>
        /// 修改信息
        /// </summary>
        /// <param name="nickname"></param>
        /// <returns></returns>
        public string changeInfo(string nickname) {
            string username = Session["username"].ToString();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();

            var details = musicDB.tb_userDetails.Where(d => d.userId == userid).Single();
            details.nickname = nickname;
            musicDB.SaveChanges();//无法更改-----
            ViewBag.nickname = nickname;
            return details.nickname;
        }
        /// <summary>
        /// 订单移除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string orderRemove(string id) {
            string username = Session["username"].ToString();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();
            int Id = int.Parse(id);

            var orderdetails = musicDB.tb_orderDetails.Where(o => o.orderId == Id).ToList();
            foreach(tb_orderDetails od in orderdetails){
                musicDB.tb_orderDetails.Remove(od);
            }
            musicDB.SaveChanges();
            var order = musicDB.tb_order.Where(o => o.orderId == Id).Single();
            musicDB.tb_order.Remove(order);
            musicDB.SaveChanges();
            return "true";

        }
      

    }
}
