using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class LikeDto
    {
        public int IdUser { get; set; }
        public int IdBlog { get; set; }
        public LikeStatus Status { get; set; }
    }
}
