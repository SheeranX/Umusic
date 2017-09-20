using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class ListModel
    {
        public List<tb_album> albumModel { get; set; }
        public List<tb_artist> artistModel { get; set; }

        public tb_album album { get; set; }
        public List<tb_album> artistAl { get; set; }
        public tb_artist artist { get; set; }
    }
}