using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class InsertBlogDto
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public int IdPicture { get; set; }
        public IEnumerable<BlogCategoryDto> BlogCategories { get; set; }
    }
}
