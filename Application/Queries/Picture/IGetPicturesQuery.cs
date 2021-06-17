using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Picture
{
    public interface IGetPicturesQuery : IQuery<PagedResponse<GetPictureDto>, PictureSearch>
    {
    }
}
