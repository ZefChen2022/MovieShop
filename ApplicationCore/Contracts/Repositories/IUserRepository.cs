using System;
using System.Threading.Tasks;
using ApplicationCore.Entities;

namespace ApplicationCore.Contracts.Repositories
{
    public interface IUserRepository
    {
        Task<User> GetUserByEmail(string email);
        Task<User> AddUser(User user);
        Task<User> GetUserById(int userId);

        Task<User> GetUserPurchases(int userId);
        Task<User> GetUserFavorites(int userId);
        Task<User> GetUserReviews(int userId);
    }
}

