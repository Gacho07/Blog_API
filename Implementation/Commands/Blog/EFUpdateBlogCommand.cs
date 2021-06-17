using Application.Commands.Blog;
using Application.DataTransfer;
using Application.Exceptions;
using EFDataAccess;
using FluentValidation;
using Implementation.Validators.Blog;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.Blog
{
    public class EFUpdateBlogCommand : IUpdateBlogCommand
    {
        private readonly BlogContext _context;
        private readonly UpdateBlogValidator _validator;

        public EFUpdateBlogCommand(BlogContext context, UpdateBlogValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCaseEnum.EFUpdateBlogCommand;

        public string Name => UseCaseEnum.EFUpdateBlogCommand.ToString();

        public void Execute(UpdateBlogDto request)
        {
            _validator.ValidateAndThrow(request);

            var blog = _context.Blogs.Include(x => x.BlogCategories).FirstOrDefault(x => x.Id == request.Id);

            if (blog == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Blog));
            }

            blog.Title = request.Title;
            blog.Content = request.Content;
            blog.IdPicture = request.IdPicture;
            blog.ModifiedAt = DateTime.Now;

            var categoryDelete = blog.BlogCategories.Where(x => !request.BlogCategories.Contains(x.IdCategory));
            foreach (var cat in categoryDelete)
            {
                cat.IsActive = false;
                cat.IsDeleted = true;
                cat.DeletedAt = DateTime.Now;
            }

            var categoryIds = blog.BlogCategories.Select(x => x.IdCategory);
            var categoryInsert = request.BlogCategories.Where(x => !categoryIds.Contains(x));
            // lista int
            foreach (var idCat in categoryInsert)
            {
                blog.BlogCategories.Add(new Domain.BlogCategory
                {
                    IdCategory = idCat
                });
            }

            _context.SaveChanges();
        }
    }
}
