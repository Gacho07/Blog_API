using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators.Picture
{
    public class DeletePictureValidator : AbstractValidator<DeletePictureDto>
    {
        private readonly BlogContext _context;

        public DeletePictureValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Id).Must(PictureExists)
                              .WithMessage(z => $"Blog with IdPicture {z.Id} exists in system.");
        }

        private bool PictureExists(int id)
        {
            return !_context.Blogs.Any(x => x.IdPicture == id);
        }
    }
}
