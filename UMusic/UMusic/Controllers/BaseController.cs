using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UMusic.Controllers
{
    public class BaseController : Controller
    {
        //
        // GET: /Base/

        //要过滤的控制器可以继承此BaseController   

        /// <summary>  
        /// 在控制器执行方法之前执行     
        /// </summary>  
        /// <param name="filterContext"></param>  
        protected override void OnActionExecuted(ActionExecutedContext filterContext)//protected 只能被子类访问  
        {
            base.OnActionExecuted(filterContext);
            if (Session["username"] == null)
            {
                //filterContext.Result = Redirect("/Function/Login");//  没有返回值， 所以不是return   是filterContexr.Result    
                filterContext.Result = Content("false");
            }
        }  

    }
}
