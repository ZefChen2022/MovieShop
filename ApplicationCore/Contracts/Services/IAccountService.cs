using System;
using System.Threading.Tasks;
using ApplicationCore.Models;

namespace ApplicationCore.Contracts.Services
{
    public interface IAccountService
    {
        Task<UserLoginSuccessModel> ValidateUser(UserLoginModel model);
        Task<int> RegisterUser(UserRegisterModel model);

        // API added
        Task<bool> EmailExists(string email);
    }
}

