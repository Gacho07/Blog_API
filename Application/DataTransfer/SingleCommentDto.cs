using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class SingleCommentDto
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int? IdParent { get; set; }
        public string Username { get; set; }
        //public virtual UserDto User { get; set; }
        public DateTime CreatedAt { get; set; }
        public IEnumerable<SingleCommentDto> Children { get; set; } = new List<SingleCommentDto>();
    }
}
