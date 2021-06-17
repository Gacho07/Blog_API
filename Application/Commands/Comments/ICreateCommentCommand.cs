using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Comments
{
    public interface ICreateCommentCommand : ICommand<InsertCommentDto>
    {
    }
}
