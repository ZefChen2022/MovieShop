using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ApplicationCore.Contracts.Services;
using ApplicationCore.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;

namespace MovieShopMVC.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAccountService _accountService;

        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");

        }
             
        [HttpPost]
        public async Task<IActionResult> Login(UserLoginModel model)
        {
            var userSuccess = await _accountService.ValidateUser(model);

            if (userSuccess != null && userSuccess.Id > 0)
            {
                // after successful authentication
                // create claims userId

                var claims = new List<Claim>
                {
                    new Claim (ClaimTypes.Email, userSuccess.Email),
                    new Claim( ClaimTypes.NameIdentifier, userSuccess.Id.ToString()),
                    new Claim( ClaimTypes.Surname, userSuccess.LastName),
                    new Claim( ClaimTypes.GivenName, userSuccess.FirstName),
                    new Claim( "language", "english")
                };

                // identity object
                var claimsIdentity = new ClaimsIdentity(claims,
                    CookieAuthenticationDefaults.AuthenticationScheme);

                // create cookies with some expiration time
                await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    new ClaimsPrincipal(claimsIdentity));

                return LocalRedirect("~/");
            }
            return View(model);
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(UserRegisterModel model )
        {
            var userId = await _accountService.RegisterUser(model);

            if (userId > 0)
            {
                return RedirectToAction("Login");
            }

            return View();
        }
    }
}