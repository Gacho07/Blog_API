using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Blog
{
    public interface IGetBlogsQuery : IQuery<PagedResponse<GetBlogDto>, BlogSearch>
    {
    }
}
