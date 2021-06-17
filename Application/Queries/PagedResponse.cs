using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public class PagedResponse<T> where T : class
    {
        public int TotalCount { get; set; } // Fixed number of records in database that match its search criteria
        public int ItemsPerPage { get; set; }
        public int CurrentPage { get; set; }
        // We will put the float that we divide with the int / we will round it to a larger number / we return it all to the int
        public int PagesCount => (int)Math.Ceiling((float)TotalCount / ItemsPerPage);
        public IEnumerable<T> Items { get; set; } = new List<T>(); // array returned to user
    }
}
