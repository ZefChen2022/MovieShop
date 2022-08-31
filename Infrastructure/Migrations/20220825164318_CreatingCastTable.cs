using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    public partial class CreatingCastTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CastId",
                table: "MoviesGenre",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Casts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    ProfilePath = table.Column<string>(type: "nvarchar(2084)", maxLength: 2084, nullable: false),
                    TmdbUrl = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Casts", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MoviesGenre_CastId",
                table: "MoviesGenre",
                column: "CastId");

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenre_Casts_CastId",
                table: "MoviesGenre",
                column: "CastId",
                principalTable: "Casts",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Casts_CastId",
                table: "MoviesGenre");

            migrationBuilder.DropTable(
                name: "Casts");

            migrationBuilder.DropIndex(
                name: "IX_MoviesGenre_CastId",
                table: "MoviesGenre");

            migrationBuilder.DropColumn(
                name: "CastId",
                table: "MoviesGenre");
        }
    }
}
