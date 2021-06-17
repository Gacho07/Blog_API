using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Comments
{
    public interface IUpdatePersonalCommentCommand : ICommand<InsertCommentDto>
    {
    }
}
