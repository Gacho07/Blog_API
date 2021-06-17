using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Blog : BaseEntity
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public int IdUser { get; set; }
        public int IdPicture { get; set; }
        public virtual User User { get; set; }
        public virtual Picture Picture { get; set; }

        public virtual ICollection<BlogCategory> BlogCategories { get; set; } = new HashSet<BlogCategory>();
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Like> Likes { get; set; } = new HashSet<Like>();
    }
}
