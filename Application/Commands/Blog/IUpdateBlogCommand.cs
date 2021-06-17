using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Blog
{
    public interface IUpdateBlogCommand : ICommand<UpdateBlogDto>
    {
    }
}
