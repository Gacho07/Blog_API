using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Picture;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Picture
{
    public class EFGetPicturesQuery : IGetPicturesQuery
    {
        private readonly BlogContext _context;

        public EFGetPicturesQuery(BlogContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EFGetPicturesQuery;

        public string Name => UseCaseEnum.EFGetPicturesQuery.ToString();

        public PagedResponse<GetPictureDto> Execute(PictureSearch search)
        {
            var pictures = _context.Pictures.AsQueryable();

            if (!string.IsNullOrEmpty(search.Src) || !string.IsNullOrWhiteSpace(search.Src))
            {
                pictures = pictures.Where(x => x.ImagePath.ToLower().Contains(search.Src.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var picture = new PagedResponse<GetPictureDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = pictures.Count(),
                Items = pictures.Skip(skipCount).Take(search.PerPage).Select(x => new GetPictureDto
                {
                    Id = x.Id,
                    ImagePath = x.ImagePath
                }).ToList()
            };

            return picture;
        }

    }
}
