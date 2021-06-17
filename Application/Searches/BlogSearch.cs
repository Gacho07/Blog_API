using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class BlogSearch : PagedSearch
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public int? IdCategory { get; set; }
    }
}
