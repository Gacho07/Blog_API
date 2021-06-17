using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Category : BaseEntity
    {
        public string Name { get; set; }
        public virtual ICollection<BlogCategory> CategoryBlogs { get; set; } = new HashSet<BlogCategory>();
    }
}
