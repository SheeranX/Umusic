//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UMusic.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_orderDetails
    {
        public int orderDeatilsId { get; set; }
        public int orderId { get; set; }
        public int albumId { get; set; }
        public int quantity { get; set; }
        public double unitprice { get; set; }
    
        public virtual tb_album tb_album { get; set; }
        public virtual tb_order tb_order { get; set; }
    }
}
