using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class CartOrder
    {
        public List<view_cartItem> vc { get; set; }
        public List<tb_artist> at { get; set; }
    }
}