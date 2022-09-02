using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ApplicationCore.Contracts.Services;
using Microsoft.AspNetCore.Mvc;

namespace MovieShopMVC.Controllers
{
    public class MoviesController : Controller
    {

        private readonly IMovieService _movieService;

        public MoviesController(IMovieService movieService)
        {
            _movieService = movieService;
        }


        [HttpGet]
        public async Task<IActionResult> Details(int id)
        {
            var movieDetails = await _movieService.GetMovieDetails(id);
            return View(movieDetails);
        }

        //MoviesByGenre(int id, int pageSize = 30, int pageNumber = 1) method
        //in the MoviesController that will return PaginatedResultSet to the View.
        //public static async Task<PaginatedList<T>> CreateAsync(IQueryable<T> source, int pageIndex, int pageSize)
        //{
        //    var count = await source.CountAsync();
        //    var items = await source.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToListAsync();
        //    return new PaginatedList<T>(items, count, pageIndex, pageSize);
        //}

        //    public async Task<IActionResult> MoviesByGenre(int id, int pageSize = 30, int pageNumber = 1)
        //    {
        //        var PaginatedResultSet = 
        //    }
        //}

        public async Task<ActionResult> GenreMovies(int Id, int pageSize = 30, int page = 1)
        {
            var pagedMovies = await _movieService.GetMoviesByPagination(Id, pageSize, page);
            return View(pagedMovies);
        }
    }
}