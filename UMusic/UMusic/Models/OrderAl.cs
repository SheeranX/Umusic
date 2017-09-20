using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class OrderAl
    {
    
        public List<tb_artist> liat { get; set; }

        public List<view_OrderItem> item { get; set; }
    }
}