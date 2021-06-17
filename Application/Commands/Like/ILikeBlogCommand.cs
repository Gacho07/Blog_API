using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Like
{
    public interface ILikeBlogCommand : ICommand<LikeDto>
    {
    }
}
