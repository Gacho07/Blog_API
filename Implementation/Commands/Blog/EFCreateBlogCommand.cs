using Application;
using Application.Commands.Blog;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validators.Blog;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.Blog
{
    public class EFCreateBlogCommand : ICreateBlogCommand
    {
        private readonly BlogContext _context;
        private readonly IApplicationActor _actor;
        private readonly CreateBlogValidator _validator;

        public EFCreateBlogCommand(CreateBlogValidator validator, IApplicationActor actor, BlogContext context)
        {
            _validator = validator;
            _actor = actor;
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EFCreateBlogCommand;

        public string Name => UseCaseEnum.EFCreateBlogCommand.ToString();

        public void Execute(InsertBlogDto request)
        {
            _validator.ValidateAndThrow(request);

            var blog = new Domain.Blog
            {
                Title = request.Title,
                Content = request.Content,
                IdPicture = request.IdPicture,
                IdUser = _actor.Id
            };

            // json
            foreach (var category in request.BlogCategories)
            {
                blog.BlogCategories.Add(new BlogCategory
                {
                    IdCategory = category.IdCategory 
                });
            }

            _context.Blogs.Add(blog);
            _context.SaveChanges();
        }
    }
}
