using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ApplicationCore.Contracts.Services;
using ApplicationCore.Entities;
using ApplicationCore.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MovieShopAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        // GET Details
        [HttpGet]
        [Route("details")]
        public async Task<IActionResult> GetUserDetails(int id)
        {
            var userDetails = await _userService.GetUserDetails(id);
            if (userDetails != null)
            {
                return Ok(userDetails);
            }
            return NotFound(new { errorMessage = "No user found" });
        }

        // POST Purchase Movie
        [HttpPost]
        [Route("purchase-movie")]
        public async Task<IActionResult> BuyMovie([FromBody] PurchaseRequestModel purchaseRequest)
        {
            await _userService.PurchaseMovie(purchaseRequest);
            return Ok(purchaseRequest);
        }

        // POST Favorite
        [HttpPost]
        [Route("favorite")]
        public async Task<IActionResult> AddFavorite([FromBody] FavoriteRequestModel favoriteRequest)
        {
            await _userService.AddFavorite(favoriteRequest);
            return Ok(favoriteRequest);
        }

        // POST un-Favorite
        [HttpPost]
        [Route("un-favorite")]
        public async Task<IActionResult> RemoveFavorite([FromBody] FavoriteRequestModel favoriteRequest)
        {
            await _userService.RemoveFavorite(favoriteRequest);
            return Ok(favoriteRequest);
        }

        // GET Check-movie-favorite
        [HttpGet]
        [Route("check-movie-favorite")]
        public async Task<IActionResult> FavoriteExists(int userId, int movieId)
        {
            var favoriteExists = await _userService.FavoriteExists(userId, movieId);
            return Ok(new { favoriteExists = favoriteExists });
        }

        // POST Add-review
        [HttpPost]
        [Route("add-review")]
        public async Task<IActionResult> AddReview([FromBody] ReviewRequestModel reviewRequest)
        {
            await _userService.AddMovieReview(reviewRequest);
            return Ok(reviewRequest);
        }

        // PUT Edit-review
        [HttpPut]
        [Route("edit-review")]
        public async Task<IActionResult> EditReview([FromBody] ReviewRequestModel reviewRequest)
        {
            await _userService.UpdateMovieReview(reviewRequest);
            return Ok(reviewRequest);
        }

        // DELETE Delete-review/movieId
        [HttpDelete]
        [Route("check-movie-favorite/{movieId:int}")]
        public async Task<IActionResult> DeleteReview(int userId, int movieId)
        {
            await _userService.DeleteMovieReview(userId, movieId);
            return Ok();
        }

        // GET Purchases
        [HttpGet]
        [Route("purchases")]
        public async Task<IActionResult> GetMoviesPurchased(int userId)
        {
            var purchases = await _userService.GetAllPurchasesForUser(userId);
            if (purchases == null || !purchases.Any())
            {
                return NotFound(new { errorMessage = "No purchase found." });
            }
            return Ok(purchases);
        }

        // GET Purchase-details/movieId
        [HttpGet]
        [Route("purchase-dedails/{movieId:int}")]
        public async Task<IActionResult> GetPurchaseDetails(int userId, int movieId)
        {
            var purchaseDetails = await _userService.GetPurchasesDetails(userId, movieId);
            if (purchaseDetails != null)
            {
                return Ok(purchaseDetails);
            }
            return NotFound(new { errorMessage = "No purchase found." });
        }

        // GET Check-movie-purchased/movieId
        [HttpGet]
        [Route("check-movie-purchased/{movieId:int}")]
        public async Task<IActionResult> PurchaseExists(int userId, int movieId)
        {
            var purchaseExists = await _userService.IsMoviePurchased(movieId, userId);
            return Ok(new { purchaseExists = purchaseExists });
        }

        // GET Favorites
        [HttpGet]
        [Route("favorites")]
        public async Task<IActionResult> GetMoviesFavorites(int userId)
        {
            var favorites = await _userService.GetAllFavoritesForUser(userId);
            if (favorites == null || !favorites.Any())
            {
                return NotFound(new { errorMessage = "No favorite found." });
            }
            return Ok(favorites);
        }

        // GET Movie-reviews
        [HttpGet]
        [Route("movie-reviews")]
        public async Task<IActionResult> GetReviews(int userId)
        {
            var reviews = await _userService.GetAllReviewsByUser(userId);
            if (reviews == null || !reviews.Any())
            {
                return NotFound(new { errorMessage = "No review found." });
            }
            return Ok(reviews);
        }
    }
}
