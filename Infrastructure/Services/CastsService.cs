using System;
using ApplicationCore.Contracts.Repositories;
using ApplicationCore.Contracts.Services;
using ApplicationCore.Models;
using Infrastructure.Repositories;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class CastService : ICastService
    {
        private readonly ICastRepository _castRepository;

        public CastService(ICastRepository castRepository)
        {
            _castRepository = castRepository;
        }

        public async Task<CastDetailsModel> GetCastDetails(int castId)
        {
            var castDetails = await _castRepository.GetById(castId);

            var castDetailsModel = new CastDetailsModel
            {
                Id = castDetails.Id,
                Gender = castDetails.Gender,
                Name = castDetails.Name,
                ProfilePath = castDetails.ProfilePath
             };

            foreach (var movie in castDetails.MoviesOfCast)
            {
                castDetailsModel.Movies.Add(new MovieDetailsModel
                {
                    Id = movie.Movie.Id,
                    Title = movie.Movie.Title,
                    PosterUrl = movie.Movie.PosterUrl
                });
            }

            foreach (var character in castDetails.MoviesOfCast)
            {
                castDetailsModel.tCasts.Add(new MovieCastModel
                {
                    Character = character.Character
                });
            }

            return castDetailsModel;
            

           
        }

        
    }
}

