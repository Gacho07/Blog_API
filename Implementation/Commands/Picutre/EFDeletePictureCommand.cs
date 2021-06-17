using Application.Commands.Picture;
using Application.DataTransfer;
using Application.Exceptions;
using EFDataAccess;
using FluentValidation;
using Implementation.Validators.Picture;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.Picutre
{
    public class EFDeletePictureCommand : IDeletePictureCommand
    {
        private readonly BlogContext _context;
        private readonly DeletePictureValidator _validator;

        public EFDeletePictureCommand(DeletePictureValidator validator, BlogContext context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EFDeletePictureCommand;

        public string Name => UseCaseEnum.EFDeletePictureCommand.ToString();

        public void Execute(DeletePictureDto request)
        {
            _validator.ValidateAndThrow(request);

            var picture = _context.Pictures.Find(request.Id);

            if (picture == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Picture));
            }

            if (picture.IsDeleted == true)
            {
                throw new AlreadyDeletedException(request.Id, typeof(Domain.Picture));
            }

            picture.DeletedAt = DateTime.Now;
            picture.IsDeleted = true;
            picture.IsActive = false;

            _context.SaveChanges();
        }
    }
}
