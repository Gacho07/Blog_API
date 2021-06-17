using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class picutre_added : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Picture",
                table: "Blogs");

            migrationBuilder.AddColumn<int>(
                name: "IdPicture",
                table: "Blogs",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "PictureId",
                table: "Blogs",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Picture",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImagePath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Picture", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Blogs_PictureId",
                table: "Blogs",
                column: "PictureId");

            migrationBuilder.AddForeignKey(
                name: "FK_Blogs_Picture_PictureId",
                table: "Blogs",
                column: "PictureId",
                principalTable: "Picture",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Blogs_Picture_PictureId",
                table: "Blogs");

            migrationBuilder.DropTable(
                name: "Picture");

            migrationBuilder.DropIndex(
                name: "IX_Blogs_PictureId",
                table: "Blogs");

            migrationBuilder.DropColumn(
                name: "IdPicture",
                table: "Blogs");

            migrationBuilder.DropColumn(
                name: "PictureId",
                table: "Blogs");

            migrationBuilder.AddColumn<string>(
                name: "Picture",
                table: "Blogs",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
