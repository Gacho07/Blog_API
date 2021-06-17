﻿using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.CommentText).IsRequired();

            builder.HasMany(x => x.ChildrenComments)
                   .WithOne(x => x.ParentComment)
                   .HasForeignKey(x => x.IdParent)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
