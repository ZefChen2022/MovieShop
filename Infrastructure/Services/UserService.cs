using System;
using ApplicationCore.Contracts.Repositories;
using ApplicationCore.Contracts.Services;
using ApplicationCore.Entities;
using ApplicationCore.Models;

namespace Infrastructure.Services
{
    public class UserService: IUserService
    {
        private readonly IMovieRepository _movieRepository;
        private readonly IUserRepository _userRepository;
        private readonly IPurchaseRepository _purchaseRepository;
        private readonly IFavoriteRepository _favoriteRepository;
        private readonly IReviewRepository _reviewRepository;
        public UserService(IMovieRepository movieRepository, IPurchaseRepository purchaseRepository, IUserRepository userRepository, IFavoriteRepository favoriteRepository, IReviewRepository reviewRepository)
        {
            _movieRepository = movieRepository;
            _userRepository = userRepository;
            _purchaseRepository = purchaseRepository;
            _favoriteRepository = favoriteRepository;
            _reviewRepository = reviewRepository;
        }

        // Purchase
        public async Task<bool> PurchaseMovie(PurchaseRequestModel purchaseRequest)
        {
            var movie = await _movieRepository.GetById(purchaseRequest.MovieId);
            Purchase aPurchase = new Purchase
            {
                UserId = purchaseRequest.UserId,
                MovieId = purchaseRequest.MovieId,
                TotalPrice = movie.Price.GetValueOrDefault(),
                PurchaseNumber = purchaseRequest.PurchaseNumber,
                PurchaseDateTime = purchaseRequest.PurchaseDateTime
            };
            var savedPurchase = await _purchaseRepository.AddPurchase(aPurchase);
            if (savedPurchase.PurchaseNumber == Guid.Empty)
            {
                return false;
            }
            return true;
        }

        public async Task<bool> IsMoviePurchased(int movieId, int userId)
        {
            var purchase = await _purchaseRepository.GetById(movieId, userId);
            if(purchase == null)
            {
                return false;
            }
            return true;
        }

        public async Task<List<MovieCardModel>> GetAllPurchasesForUser(int id)
        {
            var movieCards = new List<MovieCardModel>();
            var userPurchases = await _userRepository.GetUserPurchases(id);
            foreach (var p in userPurchases.PurchaseOfUser)
            {
                movieCards.Add(new MovieCardModel
                {
                    Id = p.MovieId,
                    Title = p.Movie.Title,
                    PosterUrl = p.Movie.PosterUrl });
            }
            return movieCards;

        }

        public async Task<PurchaseDetailsModel> GetPurchasesDetails(int userId, int movieId)
        {
            var purchase = await _purchaseRepository.GetById(movieId, userId);
            var purchaseDetails = new PurchaseDetailsModel
            {
                MovieId = purchase.MovieId,
                PosterUrl = purchase.Movie.PosterUrl,
                PurchaseDatetTime = purchase.PurchaseDateTime,
                PurchaseNumber = purchase.PurchaseNumber,
                Title = purchase.Movie.Title,
                TotalPrice = purchase.TotalPrice,
                UserId = purchase.UserId
            };
            return purchaseDetails;
        }
        //Favorite
        public async Task<bool> AddFavorite(FavoriteRequestModel favoriteRequest)
        {
            Favorite aFavorite = new Favorite
            {
                MovieId = favoriteRequest.MovieId,
                UserId = favoriteRequest.UserId
            };
            await _favoriteRepository.AddFavorite(aFavorite);
            return true;
        }

        public async Task<bool> RemoveFavorite(FavoriteRequestModel favoriteRequest)
        {
            var favorite = await _favoriteRepository.GetById(favoriteRequest.MovieId, favoriteRequest.UserId);
            await _favoriteRepository.RemoveFavorite(favorite);
            return true;
        }

        public async Task<bool> FavoriteExists(int userId, int movieId)
        {
            var favorite = await _favoriteRepository.GetById(movieId, userId);
            if (favorite != null)
            {
                return true;
            }
            return false;
        }

        public async Task<List<MovieCardModel>> GetAllFavoritesForUser(int userId)
        {
            var movieCards = new List<MovieCardModel>();
            var userFavorites = await _userRepository.GetUserFavorites(userId);
            foreach (var f in userFavorites.FavoriteMovie)
            {
                movieCards.Add(new MovieCardModel
                {
                    Id = f.MovieId,
                    Title = f.Movie.Title,
                    PosterUrl = f.Movie.PosterUrl });
            }
            return movieCards;
        }

        //Review
        public async Task<bool> AddMovieReview(ReviewRequestModel reviewRequest)
        {
            Review aReview = new Review
            {
                MovieId = reviewRequest.MovieId,
                UserId = reviewRequest.UserId,
                Rating = reviewRequest.Rating,
                ReviewText = reviewRequest.ReviewText,
                CreatedDate = reviewRequest.CreatedDate
            };
            await _reviewRepository.AddReview(aReview);
            return true;
        }

        public async Task<List<ReviewDetailsModel>> GetAllReviewsByUser(int userId)
        {
            var reviews = await _userRepository.GetUserReviews(userId);
            var reviewCards = new List<ReviewDetailsModel>();
            reviewCards.AddRange(reviews.ReviewsFromUser.Select(r => new ReviewDetailsModel
            {
                UserId = r.UserId,
                MovieId = r.MovieId,
                MovieTitle = r.Movie.Title,
                Rating = r.Rating,
                ReviewText = r.ReviewText,
                CreatedDate = r.CreatedDate
            }));
            return reviewCards;
        }

        public async Task<bool> ReviewExists(int userId, int movieId)
        {
            var review = await _reviewRepository.GetById(movieId, userId);
            if (review != null)
            {
                return true;
            }
            return false;
        }

        public async Task<bool> UpdateMovieReview(ReviewRequestModel editRequest)
        {
            Review newReview = new Review
            {
                MovieId = editRequest.MovieId,
                UserId = editRequest.UserId,
                Rating = editRequest.Rating,
                ReviewText = editRequest.ReviewText,
                CreatedDate = editRequest.CreatedDate
            };
            await _reviewRepository.EditReview(newReview);
            return true;
        }

        public async Task<bool> DeleteMovieReview(int userId, int movieId)
        {
            var review = await _reviewRepository.GetById(movieId, userId);
            await _reviewRepository.RemoveReview(review);
            return true;
        }

        public async Task<ReviewDetailsModel> GetReviewDetails(int userId, int movieId)
        {
            var review = await _reviewRepository.GetById(movieId, userId);
            var reviewDetails = new ReviewDetailsModel
            {
                UserId = userId,
                MovieId = movieId,
                MovieTitle = review.Movie.Title,
                Rating = review.Rating,
                ReviewText = review.ReviewText,
                CreatedDate = review.CreatedDate
            };
            return reviewDetails;
        }
    }

}

