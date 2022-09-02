using System;
using ApplicationCore.Entities;

namespace ApplicationCore.Contracts.Repositories
{
    public interface IFavoriteRepository
    {
        Task<Favorite> AddFavorite(Favorite favorite);
        Task<Favorite> RemoveFavorite(Favorite favorite);
        Task<Favorite> GetById(int movieId, int userId);
    }
}

