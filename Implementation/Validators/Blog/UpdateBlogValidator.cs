using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators.Blog
{
    public class UpdateBlogValidator : AbstractValidator<UpdateBlogDto>
    {
        private readonly BlogContext _context;

        public UpdateBlogValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Title).NotEmpty()
                                 .WithMessage("Title can't be empty.")
                                 .MinimumLength(3)
                                 .WithMessage("Title must conain more than 3 letters.");

            RuleFor(x => x.Content).NotEmpty()
                                   .WithMessage("Content can't be empty.")
                                   .MinimumLength(5)
                                   .WithMessage("Content must contain more than 5 letters.");

            RuleFor(x => x.IdPicture).Must(PictureExists)
                                     .WithMessage(z => $"Picture with an Id of {z.Id} doesn't exists.");

            RuleForEach(x => x.BlogCategories).ChildRules(categories =>
            {
                categories.RuleFor(x => x).Must(CategoryExists)
                                          .WithMessage("Category with an Id of {PropertyValue} doesn't exists.");
            });

            RuleFor(x => x.BlogCategories).Must(x => x.Select(y => y).Distinct().Count() == x.Count())
                                          .WithMessage("Duplicate categories are not allowed.");
        }

        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(x => x.Id == id);
        }

        private bool PictureExists(int id)
        {
            return _context.Pictures.Any(x => x.Id == id);
        }
    }
}
