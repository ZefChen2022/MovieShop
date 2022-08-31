﻿using ApplicationCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationCore.Contracts.Repositories
{
    public interface IMovieRepository
    {
        Task<Movie> GetById(int movieId);
        Task<List<Movie>> GetTop30GrossingMovies();
    }
}

