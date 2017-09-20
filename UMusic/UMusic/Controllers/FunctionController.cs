using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using UMusic.Models;

namespace UMusic.Controllers
{
    public class FunctionController : Controller
    {
        //
        // GET: /Function/
        UMusicEntities musicDB = new UMusicEntities();
        public ActionResult Regist()
        {
            return View();
        }
       
        public ActionResult Login(string backUrl) {
            Session["url"] = backUrl;
            ViewBag.warning = "hidden";
            return View();
        }
        /// <summary>
        /// 登录方法
        /// </summary>
        /// <param name="login_username"></param>
        /// <param name="login_password"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(string login_username,string login_password)
        {
           // string url = Request.RawUrl;
            int count = (from user in musicDB.tb_user
                         where (user.UserName == login_username && user.password == login_password )||
                         (user.phone==login_username&&user.password==login_password)||
                         (user.email==login_username&&user.password==login_password)
                         select user
                             ).Count();
            if (count > 0){
                Session["username"] = (from u in musicDB.tb_user
                                           where u.UserName==login_username||u.phone==login_username||u.email==login_username
                                           select u.UserName).Single();
                string username = Session["username"].ToString();
                //regist a shop car when uer login in
                int userid = (from u in musicDB.tb_user
                                  where u.UserName==username
                                  select u.UserId).Single();
                int countuser = (from c in musicDB.tb_cart
                                    where c.userId==userid
                                    select c.cartId).Count();
                if (countuser > 0){
                    if(Session["url"]==null||Session["url"]=="")
                        return RedirectToAction("Index", "Home");
                    return Redirect(Session["url"].ToString());
                }
                    // return RedirectToAction("Index", "Home");
                    
                else
                {
                    tb_cart cart = new tb_cart();
                    cart.userId = (from u in musicDB.tb_user
                                   where u.UserName == username
                                   select u.UserId).Single();
                    musicDB.tb_cart.Add(cart);
                    musicDB.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
              
            }
               
            else {
                ViewBag.warning="";
                return View();
            }
                
        }
       

        /// <summary>
        /// Ajax 登录验证账号
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string AajxVal(string str) {
            string info;
            int count = (from user in musicDB.tb_user
                     where user.UserName == str || user.email == str || user.phone == str
                     select user
                         ).Count();
            if (count > 0)
            {
                info = "exist";
                return info;
            }
            else
            {
                info = "none";
                return info;
            }
            
        }
        /// <summary>
        /// Ajax 登录验证密码
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string AjaxForLogin(string str) {
            string info;
            int count = (from username in musicDB.tb_user
                         where username.UserName == str||username.phone==str||username.email==str
                         select username.UserName).Count();
            if (count > 0)
            {
                info = "true";
                return info;
            }
            else
            {
                info = "fasle";
                return info;
            }
        }
        /// <summary>
        /// 注册新用户
        /// </summary>
        /// <param name="username"></param>
        /// <param name="email"></param>
        /// <param name="phone"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult RegisterUser(string username,string email,string phone,string password) {
            tb_user user = new tb_user();
            user.UserName = username;
            user.email = email;
            user.phone = phone;
            user.password = password;
            user.createDate = System.DateTime.Now;
            musicDB.tb_user.Add(user);
            musicDB.SaveChanges();
            //user details 
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();
            tb_userDetails userdetails = new tb_userDetails();
            userdetails.nickname = "";
            userdetails.gender="male";
            userdetails.location="china";
            userdetails.birthday=System.DateTime.Now;
            userdetails.userId = userid;

            SetInfo(username);
            return View(user); 
        }

        /// <summary>
        /// 用户收藏
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string AjaxCollection(string id) {
            int albumid = int.Parse(id);
            string username = Session["username"].ToString();
            tb_collection collect = new tb_collection();
            int count = (from c in musicDB.tb_collection
                         where c.tb_user.UserName == username&& c.tb_album.albumId == albumid
                         select c).Count();
            if (count > 0){
                return "false";
            }  
            else {
                collect.userid = (from u in musicDB.tb_user
                                  where u.UserName == username
                                  select u.UserId).Single();
                collect.albumId = albumid;
                musicDB.tb_collection.Add(collect);
                musicDB.SaveChanges();
                return "true";
            }
          
        }
        /// <summary>
        /// 找回密码视图
        /// </summary>
        /// <returns></returns>
        public ActionResult foundPwd() {
            return View();
        }
        /// <summary>
        /// 找回密码
        /// </summary>
        /// <param name="username"></param>
        /// <param name="email"></param>
        /// <param name="phone"></param>
        /// <returns></returns>
        public string fpwd(string username,string email,string phone) {
            int count = (from u in musicDB.tb_user
                         where u.UserName == username && u.email == email && u.phone == phone
                         select u).Count();
            if (count > 0)
            {
                string pwd = (from u in musicDB.tb_user
                              where u.UserName == username
                              select u.password).Single();
                return pwd;
            }
            else
            {
                return "填写信息有误";
            }
            
        }
        /// <summary>
        /// 联系页
        /// </summary>
        /// <returns></returns>
        public ActionResult Contact() {
            return View();
        }
        /// <summary>
        /// 联系内容
        /// </summary>
        /// <param name="username"></param>
        /// <param name="comment"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Contact(string username, string comment)
        {
            tb_advice ad = new tb_advice();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();
            ad.userId = userid;
            ad.content = comment;
            ad.createDate = DateTime.Parse(DateTime.Now.ToShortDateString());
            musicDB.tb_advice.Add(ad);
            musicDB.SaveChanges();
            return Content("<script>alert('提交成功')</script>");
        }
        /// <summary>
        /// 联系验证
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>

        [HttpPost]
        public string valContact(string username) {
            int count = musicDB.tb_user.Where(u => u.UserName == username).Count();
            if (count > 0)
                return "true";
            else
                return "false";
        }
        /// <summary>
        /// 注册默认信息
        /// </summary>
        /// <param name="username"></param>
        public void SetInfo(string username) {
            tb_userDetails ud = new tb_userDetails();
            int userid = (from u in musicDB.tb_user
                          where u.UserName == username
                          select u.UserId).Single();
            ud.userId = userid;
            ud.nickname = "小明";
            ud.birthday = DateTime.Parse(DateTime.Now.ToShortDateString());
            ud.gender = "male";
            ud.location = "中国";
            musicDB.tb_userDetails.Add(ud);
            musicDB.SaveChanges();
        }
    }
}
