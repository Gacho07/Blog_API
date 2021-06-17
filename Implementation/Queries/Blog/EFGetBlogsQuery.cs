using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Blog;
using Application.Searches;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Blog
{
    public class EFGetBlogsQuery : IGetBlogsQuery
    {
        private readonly BlogContext _context;

        public EFGetBlogsQuery(BlogContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EFGetBlogsQuery;

        public string Name => UseCaseEnum.EFGetBlogsQuery.ToString();

        public PagedResponse<GetBlogDto> Execute(BlogSearch search)
        {
            var blogs = _context.Blogs.Include(x => x.Comments).Include(x => x.Likes).Include(x => x.BlogCategories).ThenInclude(x => x.Category).AsQueryable();


            if (!string.IsNullOrEmpty(search.Title) || !string.IsNullOrWhiteSpace(search.Title))
            {
                blogs = blogs.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Content) || !string.IsNullOrWhiteSpace(search.Content))
            {
                blogs = blogs.Where(x => x.Content.ToLower().Contains(search.Content.ToLower()));
            }

            if (search.DateFrom != null && search.DateFrom > search.DateTo)
            {
                blogs = blogs.Where(x => x.CreatedAt >= search.DateFrom);
            }

            if (search.DateTo != null && search.DateTo > search.DateFrom)
            {
                blogs = blogs.Where(x => x.CreatedAt <= search.DateTo);
            }

            if (search.IdCategory.HasValue)
            {
                blogs = blogs.Where(x => x.BlogCategories.Any(x => x.IdCategory == search.IdCategory.Value));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<GetBlogDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = blogs.Count(),

                Items = blogs.Skip(skipCount).Take(search.PerPage).Select(x => new GetBlogDto
                {
                    Id = x.Id,
                    Title = x.Title,
                    Content = x.Content,
                    DateCreated = x.CreatedAt,
                    Username = x.User.Username,
                    IdPicture = x.IdPicture,
                    PictureName = x.Picture.ImagePath,

                    Categories = x.BlogCategories.Select(y => new CategoryDto
                    {
                        Id = y.Category.Id,
                        Name = y.Category.Name
                    }).ToList(),

                    Comments = x.Comments.Select(z => new SingleCommentDto
                    {
                        Id = z.Id,
                        Text = z.CommentText,
                        CreatedAt = z.CreatedAt,
                        Username = z.User.Username,
                        Children = z.ChildrenComments.Select(c => new SingleCommentDto
                        {
                            Id = c.Id,
                            IdParent = c.IdParent.Value,
                            Text = c.CommentText,
                            CreatedAt = c.CreatedAt,
                            Username = c.User.Username
                        })

                    }).ToList(),

                    Likes = x.Likes.Select(w => new LikeBlogDto
                    {
                        Id = w.Id,
                        Status = w.Status,
                        Username = w.User.Username
                    }).ToList()
                }).ToList()
            };

            return response;
        }
    }
}
