using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class PictureConfiguration : IEntityTypeConfiguration<Picture>
    {
        public void Configure(EntityTypeBuilder<Picture> builder)
        {
            builder.Property(x => x.ImagePath).IsRequired();

            builder.HasMany(x => x.Blogs)
                   .WithOne(y => y.Picture)
                   .HasForeignKey(x => x.IdPicture)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
