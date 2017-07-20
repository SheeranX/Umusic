﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UMusic.Controllers
{
    public class LogOutController : Controller
    {
        //
        // GET: /LogOut/

        public ActionResult logout()
        {
            Session.Remove("username");
            return RedirectToAction("Index","Home");
        }

    }
}
