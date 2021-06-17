using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class change_configuration_user2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserUseCases_Users_IdUser",
                table: "UserUseCases");

            migrationBuilder.AddForeignKey(
                name: "FK_UserUseCases_Users_IdUser",
                table: "UserUseCases",
                column: "IdUser",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserUseCases_Users_IdUser",
                table: "UserUseCases");

            migrationBuilder.AddForeignKey(
                name: "FK_UserUseCases_Users_IdUser",
                table: "UserUseCases",
                column: "IdUser",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
