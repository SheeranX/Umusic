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
    
    public partial class tb_user
    {
        public tb_user()
        {
            this.tb_advice = new HashSet<tb_advice>();
            this.tb_cart = new HashSet<tb_cart>();
            this.tb_collection = new HashSet<tb_collection>();
            this.tb_order = new HashSet<tb_order>();
            this.tb_userDetails = new HashSet<tb_userDetails>();
        }
    
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public System.DateTime createDate { get; set; }
    
        public virtual ICollection<tb_advice> tb_advice { get; set; }
        public virtual ICollection<tb_cart> tb_cart { get; set; }
        public virtual ICollection<tb_collection> tb_collection { get; set; }
        public virtual ICollection<tb_order> tb_order { get; set; }
        public virtual ICollection<tb_userDetails> tb_userDetails { get; set; }
    }
}