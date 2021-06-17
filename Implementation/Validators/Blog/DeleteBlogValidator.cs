using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators.Blog
{
    public class DeleteBlogValidator : AbstractValidator<int>
    {
        public DeleteBlogValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
