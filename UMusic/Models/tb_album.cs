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
    using System.ComponentModel.DataAnnotations;
    
    public partial class tb_album
    {
        public tb_album()
        {
            this.tb_cartDetails = new HashSet<tb_cartDetails>();
            this.tb_collection = new HashSet<tb_collection>();
            this.tb_orderDetails = new HashSet<tb_orderDetails>();
            this.tb_singleSong = new HashSet<tb_singleSong>();
        }
    
        public int albumId { get; set; }
        public string albumName { get; set; }
        public int genreId { get; set; }
        public int artistId { get; set; }
        public int locationId { get; set; }
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public System.DateTime addDate { get; set; }
        public double price { get; set; }
        public string imagesUrl { get; set; }
        public string status { get; set; }
        public int leftNum { get; set; }
        public string description { get; set; }
          [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public Nullable<System.DateTime> releaseDate { get; set; }
    
        public virtual tb_artist tb_artist { get; set; }
        public virtual ICollection<tb_cartDetails> tb_cartDetails { get; set; }
        public virtual ICollection<tb_collection> tb_collection { get; set; }
        public virtual tb_genre tb_genre { get; set; }
        public virtual tb_local tb_local { get; set; }
        public virtual ICollection<tb_orderDetails> tb_orderDetails { get; set; }
        public virtual ICollection<tb_singleSong> tb_singleSong { get; set; }
    }
}
