using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;
using ApplicationCore.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace MovieShopAPI.Middlewares
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class MovieShopExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<MovieShopExceptionMiddleware> _logger;

        public MovieShopExceptionMiddleware(RequestDelegate next, ILogger<MovieShopExceptionMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                //read info from the HttpContext object and maybe log it somewhere
                _logger.LogInformation("Inside the Middleware");
                await _next(httpContext);

            }
            catch (Exception ex)
            {
                // First catch the exception
                // check the exception type, message
                // check stacktrace, where the exception happened
                // when the exception happened
                // for which URL and which Http method (controller, action method)
                // for which user if user is logged in

                var exceptionDetails = new ErrorModel
                {
                    Message = ex.Message,
                    // StackTrace = ex.StackTrace,
                    ExceptionDateTime = DateTime.UtcNow,
                    ExceptionType = ex.GetType().ToString(),
                    Path = httpContext.Request.Path,
                    HttpRequestType = httpContext.Request.Method,
                    User = httpContext.User.Identity.IsAuthenticated ? httpContext.User.Identity.Name : null
                };
                // save all this information somewhere, text file, json file or database
                // System.IO to create text file(not use this one)
                // asp.net core has built-in logging mechanism, (ILogger) which can be used by any 3rd party log provide
                // *SeriLog* and NLog
                // Send email to Dev Team when exceptions happen
                _logger.LogError("Exception happened, log this to text or Json files using Serilog");

                //return http status code 500
                httpContext.Response.ContentType = "application/json";
                httpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                var result = JsonSerializer.Serialize<ErrorModel>(exceptionDetails);
                await httpContext.Response.WriteAsync(result);

                // httpContext.Response.Redirect("/home/error")
            }



        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class MovieShopExceptionMiddlewareExtensions
    {
        public static IApplicationBuilder UseMovieShopExceptionMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<MovieShopExceptionMiddleware>();
        }
    }
}

