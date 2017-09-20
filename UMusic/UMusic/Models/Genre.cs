using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class Genre
    {
        public List<tb_album> album {get;set;}
        public tb_genre genre { get; set; }

    }
}