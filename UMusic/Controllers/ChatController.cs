using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UMusic.Models;

namespace UMusic.Controllers
{
    public class ChatController : Controller
    {
        //
        // GET: /Chat/
        UMusicEntities musicDB = new UMusicEntities();
        public ActionResult Index()
        {

            return View();
        }
        /// <summary>
        /// 聊天机器人
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        public string ChatContent(string msg) {
            if (msg.Contains("好"))
                return "你好";

            else if (msg.Contains("买"))
            {
                return "登录之后才能购买";
            }
            else if (msg.Contains("歌手"))
                return "站内歌手可通过导航栏或搜索栏获取";
            else if (msg.Contains("专辑"))
                return "推荐专辑《1989》";
            else if (msg.Contains("地区"))
            {
                return "包括欧美，韩国，华语，日本四个地区";
            }
            else if(msg.Contains("流派")){
                return "有摇滚，流行，乡村，纯音四种类型";
            }
            else
                return "你在说啥？";
        }

    }
}
