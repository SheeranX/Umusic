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
    
    public partial class tb_userDetails
    {
        public int userDetailsId { get; set; }
        public int userId { get; set; }
        public string gender { get; set; }
        public System.DateTime birthday { get; set; }
        public string nickname { get; set; }
        public string location { get; set; }
    
        public virtual tb_user tb_user { get; set; }
    }
}
