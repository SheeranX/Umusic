using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class UserCenterModel
    {
        public tb_userDetails udetails { get; set; }
        public tb_user user { get; set; }
       // public List<tb_order> allOrder { get; set; }
        public List<view_UserCenterOrder> waitPayOrder { get; set; }
        public List<tb_order> waitSendOrder { get; set; }
        public List<tb_order> sendOrder { get; set; }
        public List<tb_cart> cart { get; set; }
        public List<view_cartItem> cartItem { get; set; }
        public List<tb_album> album { get; set; }
    //    public List<tb_collection> collection { get; set; }
        public List<view_collection> collect { get; set; }

        public List<view_UserCenterOrder> vcenter { get; set; }

    }
}