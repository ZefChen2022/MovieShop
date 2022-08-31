using System;
namespace ApplicationCore.Entities
{
    public class UserRole
    {
        public int RoleId { get; set; }
        public int UserId { get; set; }

        //navigation properties
        public Movie Roles { get; set; }
        public User User { get; set; }
    }
}

