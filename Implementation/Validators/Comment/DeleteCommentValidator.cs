using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators.Comment
{
    public class DeleteCommentValidator : AbstractValidator<int>
    {
        public DeleteCommentValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
