using System;
using ApplicationCore.Contracts.Repositories;
using ApplicationCore.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserRepository: IUserRepository
    {
        private readonly MovieShopDbContext _dbContext;
        public UserRepository(MovieShopDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<User> AddUser(User user)
        {
            _dbContext.Users.Add(user);
            await _dbContext.SaveChangesAsync();
            return user;
        }

        public async Task<User> GetUserByEmail(string email)
        {
            var user = await _dbContext.Users.
                FirstOrDefaultAsync(u => u.Email == email);
            return user;
        }

        public async Task<User> GetUserById(int userId)
        {
            var user = await _dbContext.Users.Include(u => u.RoleOfUser).
                FirstOrDefaultAsync(u => u.Id == userId);
            return user;
        }

        public async Task<User> GetUserPurchases(int userId)
        {
            var purchases = await _dbContext.Users.Include(u => u.PurchaseOfUser).
                ThenInclude(p => p.Movie).FirstOrDefaultAsync(u => u.Id == userId);
            return purchases;
        }

        public async Task<User> GetUserFavorites(int userId)
        {
            var favorites = await _dbContext.Users.Include(u => u.FavoriteMovie).
                ThenInclude(f => f.Movie).FirstOrDefaultAsync(u => u.Id == userId);
            return favorites;
        }

        public async Task<User> GetUserReviews(int userId)
        {
            var reviews = await _dbContext.Users.Include(u => u.ReviewsFromUser).
                ThenInclude(r => r.Movie).FirstOrDefaultAsync(u => u.Id == userId);
            return reviews;
        }
    }
}

