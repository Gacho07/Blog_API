using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Blog
{
    public interface IGetBlogQuery : IQuery<GetBlogDto, int>
    {
    }
}
