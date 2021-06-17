using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Picture : BaseEntity
    {
        public string ImagePath { get; set; }
        public virtual ICollection<Blog> Blogs { get; set; } = new HashSet<Blog>();
    }
}
