using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class CartItem
    {
        public  string albumname { get; set; }
        public string artistname { get; set; }
        public int leftnum { get; set; }
        public int quantity { get; set; }
        public string imgurl { get; set; }
        public string genrename { get; set; }
        public double price { get; set; }

    }
}