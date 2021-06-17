﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class CommentDto
    {
        public int Id { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Username { get; set; }
        public int? IdParent { get; set; }
    }
}
