﻿using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(70);

            builder.HasMany(x => x.CategoryBlogs)
                   .WithOne(y => y.Category)
                   .HasForeignKey(x => x.IdCategory)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
