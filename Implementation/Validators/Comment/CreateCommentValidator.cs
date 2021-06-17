using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators.Comment
{
    public class CreateCommentValidator : AbstractValidator<InsertCommentDto>
    {
        private readonly BlogContext _context;

        public CreateCommentValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Text).NotEmpty()
                                .WithMessage("Text is required.");

            RuleFor(x => x.IdBlog).NotEmpty()
                                  .WithMessage("Blog is required.")
                                  .Must(BlogExists)
                                  .WithMessage(z => $"Blog with Id {z.Id} doesn't exists.");

            RuleFor(x => x.IdParent).Must(idComment => context.Comments.Any(y => y.Id == idComment))
                                    .When(request => request.IdParent != null)
                                    .WithMessage("Parent comment doesn't exists in system.");

        }

        private bool BlogExists(int id)
        {
            return _context.Blogs.Any(x => x.Id == id);
        }
    }
}
