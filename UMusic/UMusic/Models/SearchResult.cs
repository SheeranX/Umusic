using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UMusic.Models
{
    public class SearchResult
    {
        public List<tb_album> album { get; set; }
        public List<tb_artist> artist { get; set; }
    }
}