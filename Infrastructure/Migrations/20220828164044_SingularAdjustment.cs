using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    public partial class SingularAdjustment : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCast_Cast_CastId",
                table: "MoviesCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCast_Movie_MovieId",
                table: "MoviesCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Genre_GenreId",
                table: "MoviesGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Movie_MovieId",
                table: "MoviesGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesGenre",
                table: "MoviesGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesCast",
                table: "MoviesCast");

            migrationBuilder.RenameTable(
                name: "MoviesGenre",
                newName: "MovieGenre");

            migrationBuilder.RenameTable(
                name: "MoviesCast",
                newName: "MovieCast");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesGenre_GenreId",
                table: "MovieGenre",
                newName: "IX_MovieGenre_GenreId");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesCast_CastId",
                table: "MovieCast",
                newName: "IX_MovieCast_CastId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_MovieGenre",
                table: "MovieGenre",
                columns: new[] { "MovieId", "GenreId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_MovieCast",
                table: "MovieCast",
                columns: new[] { "MovieId", "CastId", "Character" });

            migrationBuilder.AddForeignKey(
                name: "FK_MovieCast_Cast_CastId",
                table: "MovieCast",
                column: "CastId",
                principalTable: "Cast",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MovieCast_Movie_MovieId",
                table: "MovieCast",
                column: "MovieId",
                principalTable: "Movie",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MovieGenre_Genre_GenreId",
                table: "MovieGenre",
                column: "GenreId",
                principalTable: "Genre",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MovieGenre_Movie_MovieId",
                table: "MovieGenre",
                column: "MovieId",
                principalTable: "Movie",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MovieCast_Cast_CastId",
                table: "MovieCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MovieCast_Movie_MovieId",
                table: "MovieCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MovieGenre_Genre_GenreId",
                table: "MovieGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_MovieGenre_Movie_MovieId",
                table: "MovieGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MovieGenre",
                table: "MovieGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MovieCast",
                table: "MovieCast");

            migrationBuilder.RenameTable(
                name: "MovieGenre",
                newName: "MoviesGenre");

            migrationBuilder.RenameTable(
                name: "MovieCast",
                newName: "MoviesCast");

            migrationBuilder.RenameIndex(
                name: "IX_MovieGenre_GenreId",
                table: "MoviesGenre",
                newName: "IX_MoviesGenre_GenreId");

            migrationBuilder.RenameIndex(
                name: "IX_MovieCast_CastId",
                table: "MoviesCast",
                newName: "IX_MoviesCast_CastId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_MoviesGenre",
                table: "MoviesGenre",
                columns: new[] { "MovieId", "GenreId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_MoviesCast",
                table: "MoviesCast",
                columns: new[] { "MovieId", "CastId", "Character" });

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesCast_Cast_CastId",
                table: "MoviesCast",
                column: "CastId",
                principalTable: "Cast",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesCast_Movie_MovieId",
                table: "MoviesCast",
                column: "MovieId",
                principalTable: "Movie",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenre_Genre_GenreId",
                table: "MoviesGenre",
                column: "GenreId",
                principalTable: "Genre",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenre_Movie_MovieId",
                table: "MoviesGenre",
                column: "MovieId",
                principalTable: "Movie",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
