using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class LikeBlogDto
    {
        public int Id { get; set; }
        public LikeStatus Status { get; set; }
        public string Username { get; set; }
    }
}
