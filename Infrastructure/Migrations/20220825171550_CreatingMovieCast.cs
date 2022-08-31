using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    public partial class CreatingMovieCast : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Casts_CastId",
                table: "MoviesGenre");

            migrationBuilder.DropIndex(
                name: "IX_MoviesGenre_CastId",
                table: "MoviesGenre");

            migrationBuilder.DropColumn(
                name: "CastId",
                table: "MoviesGenre");

            migrationBuilder.CreateTable(
                name: "MoviesCast",
                columns: table => new
                {
                    CastId = table.Column<int>(type: "int", nullable: false),
                    MovieId = table.Column<int>(type: "int", nullable: false),
                    Character = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MoviesCast", x => new { x.MovieId, x.CastId, x.Character });
                    table.ForeignKey(
                        name: "FK_MoviesCast_Casts_CastId",
                        column: x => x.CastId,
                        principalTable: "Casts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MoviesCast_Movies_MovieId",
                        column: x => x.MovieId,
                        principalTable: "Movies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MoviesCast_CastId",
                table: "MoviesCast",
                column: "CastId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MoviesCast");

            migrationBuilder.AddColumn<int>(
                name: "CastId",
                table: "MoviesGenre",
                type: "int",
                nullable: true);

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
    }
}
