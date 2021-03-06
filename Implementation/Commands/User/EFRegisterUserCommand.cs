using Application.Commands.Email;
using Application.Commands.User;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validators.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EFRegisterUserCommand : IRegisterUserCommand
    {
        private readonly BlogContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EFRegisterUserCommand(IEmailSender sender, RegisterUserValidator validator, BlogContext context)
        {
            _sender = sender;
            _validator = validator;
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EFRegisterUserCommand;

        public string Name => UseCaseEnum.EFRegisterUserCommand.ToString();

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = new Domain.User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Email = request.Email,
                Password = request.Password
            };

            user.Password = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);

            _context.Users.Add(user);
            _context.SaveChanges();

            var userForUseCases = new List<int> { 5, 7, 10, 17, 19, 24, 25, 26, 27, 28 };
            int id = user.Id;
            foreach (var uucId in userForUseCases)
            {
                user.UserUseCases.Add(new UserUseCase
                {
                    IdUser = id,
                    UseCaseId = uucId
                });
            }

            _context.SaveChanges();


            _sender.Send(new SendEmailDto
            {
                Subject = "Registration",
                Content = "<h2>Successfully Registered</h2>",
                SendTo = request.Email
            });

        }
    }
}
