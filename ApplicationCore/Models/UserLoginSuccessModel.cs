using System;
using System.Threading.Tasks;

namespace ApplicationCore.Models
{
    public class UserLoginSuccessModel
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
    }
}

