using System;
using ApplicationCore.Entities;
using ApplicationCore.Models;

namespace ApplicationCore.Contracts.Services
{
    public interface IUserService
    {
        // Purchase
        Task<bool> PurchaseMovie(PurchaseRequestModel purchaseRequest);
        Task<bool> IsMoviePurchased(int movieId, int userId);
        Task<List<MovieCardModel>> GetAllPurchasesForUser(int id);
        Task<PurchaseDetailsModel> GetPurchasesDetails(int userId, int movieId);

        //Favorite
        Task<bool> AddFavorite(FavoriteRequestModel favoriteRequest);
        Task<bool> RemoveFavorite(FavoriteRequestModel favoriteRequest);
        Task<bool> FavoriteExists(int id, int movieId);
        Task<List<MovieCardModel>> GetAllFavoritesForUser(int id);

        //Review
        Task<bool> AddMovieReview(ReviewRequestModel reviewRequest);
        Task<List<ReviewDetailsModel>> GetAllReviewsByUser(int userId);
        Task<bool> ReviewExists(int userId, int movieId);
        Task<bool> UpdateMovieReview(ReviewRequestModel reviewRequest);
        Task<bool> DeleteMovieReview(int userId, int movieId);
        Task<ReviewDetailsModel> GetReviewDetails(int userId, int movieId);
    }
}

