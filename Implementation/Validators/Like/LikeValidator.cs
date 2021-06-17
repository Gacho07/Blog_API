﻿using Application.DataTransfer;
using Domain;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators.Like
{
    public class LikeValidator : AbstractValidator<LikeDto>
    {
        public LikeValidator()
        {
            RuleFor(x => x.IdBlog).NotEmpty();
            RuleFor(x => x.IdUser).NotEmpty();
            RuleFor(x => x.Status).NotEmpty()
                                  .Must(y => Enum.IsDefined(typeof(LikeStatus), y))
                                  .WithMessage("Status can only be 'Like' or 'Dislike'");
        }
    }
}
