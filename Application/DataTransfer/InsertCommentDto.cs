using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class InsertCommentDto
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int IdBlog { get; set; }
        public int? IdParent { get; set; }
        public int IdUser { get; set; }
    }
}
