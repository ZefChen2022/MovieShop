using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    public partial class PluralAdjustment : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCast_Casts_CastId",
                table: "MoviesCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCast_Movies_MovieId",
                table: "MoviesCast");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Genres_GenreId",
                table: "MoviesGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenre_Movies_MovieId",
                table: "MoviesGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesGenre",
                table: "MoviesGenre");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesCast",
                table: "MoviesCast");

            migrationBuilder.RenameTable(
                name: "MoviesGenre",
                newName: "MoviesGenres");

            migrationBuilder.RenameTable(
                name: "MoviesCast",
                newName: "MoviesCasts");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesGenre_GenreId",
                table: "MoviesGenres",
                newName: "IX_MoviesGenres_GenreId");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesCast_CastId",
                table: "MoviesCasts",
                newName: "IX_MoviesCasts_CastId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_MoviesGenres",
                table: "MoviesGenres",
                columns: new[] { "MovieId", "GenreId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_MoviesCasts",
                table: "MoviesCasts",
                columns: new[] { "MovieId", "CastId", "Character" });

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesCasts_Casts_CastId",
                table: "MoviesCasts",
                column: "CastId",
                principalTable: "Casts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesCasts_Movies_MovieId",
                table: "MoviesCasts",
                column: "MovieId",
                principalTable: "Movies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenres_Genres_GenreId",
                table: "MoviesGenres",
                column: "GenreId",
                principalTable: "Genres",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenres_Movies_MovieId",
                table: "MoviesGenres",
                column: "MovieId",
                principalTable: "Movies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCasts_Casts_CastId",
                table: "MoviesCasts");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesCasts_Movies_MovieId",
                table: "MoviesCasts");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenres_Genres_GenreId",
                table: "MoviesGenres");

            migrationBuilder.DropForeignKey(
                name: "FK_MoviesGenres_Movies_MovieId",
                table: "MoviesGenres");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesGenres",
                table: "MoviesGenres");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MoviesCasts",
                table: "MoviesCasts");

            migrationBuilder.RenameTable(
                name: "MoviesGenres",
                newName: "MoviesGenre");

            migrationBuilder.RenameTable(
                name: "MoviesCasts",
                newName: "MoviesCast");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesGenres_GenreId",
                table: "MoviesGenre",
                newName: "IX_MoviesGenre_GenreId");

            migrationBuilder.RenameIndex(
                name: "IX_MoviesCasts_CastId",
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
                name: "FK_MoviesCast_Casts_CastId",
                table: "MoviesCast",
                column: "CastId",
                principalTable: "Casts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesCast_Movies_MovieId",
                table: "MoviesCast",
                column: "MovieId",
                principalTable: "Movies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenre_Genres_GenreId",
                table: "MoviesGenre",
                column: "GenreId",
                principalTable: "Genres",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MoviesGenre_Movies_MovieId",
                table: "MoviesGenre",
                column: "MovieId",
                principalTable: "Movies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
