﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UpdateBlogDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int IdPicture { get; set; }

        public int IdUser { get; set; }

        public ICollection<int> BlogCategories { get; set; } = new List<int>();
    }
}
