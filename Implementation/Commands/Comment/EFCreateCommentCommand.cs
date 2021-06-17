﻿using Application;
using Application.Commands.Comments;
using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Implementation.Validators.Comment;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Comment
{
    public class EFCreateCommentCommand : ICreateCommentCommand
    {
        private readonly BlogContext _context;
        private readonly CreateCommentValidator _validator;
        private readonly IApplicationActor _actor;

        public EFCreateCommentCommand(BlogContext context, CreateCommentValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => (int)UseCaseEnum.EFCreateCommentCommand;

        public string Name => UseCaseEnum.EFCreateCommentCommand.ToString();

        public void Execute(InsertCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            request.IdUser = _actor.Id;

            var comment = new Domain.Comment
            {
                 CommentText = request.Text,
                 IdBlog = request.IdBlog,
                 IdParent = request.IdParent,
                 IdUser = request.IdUser, 
                 
            };

            _context.Comments.Add(comment);
            _context.SaveChanges();
        }
    }
}
