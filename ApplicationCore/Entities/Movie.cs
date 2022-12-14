using System;
using System.ComponentModel.DataAnnotations;

namespace ApplicationCore.Entities
   
{
    public class Movie
    {
        public int Id { get; set; }

        [MaxLength(256)]
        public string Title { get; set; } = null!;

        public string Overview { get; set; } = null!;

        [MaxLength(512)]
        public string Tagline { get; set; } = null!;
        public decimal? Budget { get; set; }
        public decimal? Revenue { get; set; }

        [MaxLength(2084)]
        public string ImdbUrl { get; set; } = null!;

        [MaxLength(2084)]
        public string TmdbUrl { get; set; } = null!;

        [MaxLength(2084)]
        public string PosterUrl { get; set; } = null!;

        [MaxLength(2084)]
        public string BackdropUrl { get; set; } = null!;

        [MaxLength(64)]
        public string OriginalLanguage { get; set; } = null!;
        public DateTime? ReleaseDate { get; set; }
        public int? RunTime { get; set; }
        public decimal? Price { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string? UpdatedBy { get; set; }
        public string? CreatedBy { get; set; }
        public decimal? Rating { get; set; }

        //Navigation
        public ICollection<MovieGenre> GenresOfMovie { get; set; }
        public ICollection<Trailer> Trailers { get; set; }
        public ICollection<MovieCast> CastsOfMovie { get; set; }
        public ICollection<Review> ReviewsOfMovie { get; set; }
        public ICollection<Purchase> PurchasesOfMovie { get; set; }
        public ICollection<Favorite> UsersLoveMovie { get; set; }
    }
}

