using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class Local
    {
        public List<tb_album> album { get; set; }
        public tb_local local { get; set; }
    }
}