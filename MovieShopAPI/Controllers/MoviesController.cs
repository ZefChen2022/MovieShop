using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ApplicationCore.Contracts.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MovieShopAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly IMovieService _movieService;

        public MoviesController(IMovieService movieService)
        {
            _movieService = movieService;
        }

        // http:lcoalhost//api/movies/top-grossing
        [HttpGet]
        [Route("top-grossing")]
        public async Task<IActionResult> GetTopGrossingMovie()
        {
            var movies = await _movieService.GetTop30GrossingMovies();
            // return the movies information in JSON Format
            // ASP.NET Core Automatically serializes C# objects to JSON objects
            // System.Text.Json .NET 3
            // older version of .NET to work with JSON Newtonsoft.JSON
            // return data(json format) alongewith it return the HTTP status code

            if (movies == null || !movies.Any())
            {
                return NotFound(new { errorMessages = "No Movie Found" });
            }

            return Ok(movies);
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<IActionResult> GetMovie(int id)
        {
            var movie = await _movieService.GetMovieDetails(id);
            if(movie == null)
            {
                return NotFound(new { errorMessage = $"No Movie Found for {id}" });
            }
            return Ok(movie);
        }
    }
}
