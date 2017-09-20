using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class ArtistDetails
    {
        public List<tb_album> albumModel { get; set; }
        public List<tb_artist> artistModel { get; set; }
        public tb_artist artistSingle { get; set; }
    }
}