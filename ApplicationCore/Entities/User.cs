using System;
using System.ComponentModel.DataAnnotations;

namespace ApplicationCore.Entities
{
    public class User
    {
        public int Id { get; set; }

        public DateTime DateOfBirth { get; set; }

        [MaxLength(256)]
        public string Email { get; set; } = null!;

        [MaxLength(128)]
        public string FirstName { get; set; } = null!;

        [MaxLength(128)]
        public string LastName { get; set; } = null!;

        [MaxLength(1024)]
        public string HashedPassword { get; set; } = null!;

        [MaxLength(16)]
        public string? PhoneNumber { get; set; }

        public string? TwoFactorEnabled { get; set; }

        public DateTime? LockoutEndDate { get; set; }

        public DateTime? LastLoginDateTime { get; set; }

        public string? ProfilePictureUrl { get; set; }

        public string? AccessFailedCount { get; set; }

        [MaxLength(1024)]
        public string Salt { get; set; } = null!;

        [MaxLength(2)]
        public int IsLocked { get; set; }

        //navigation properties
        public ICollection<Review> ReviewsFromUser { get; set; }
        public ICollection<Purchase> PurchaseOfUser { get; set; }
        public Favorite FavoriteMovie { get; set; }
        public UserRole RoleOfUser { get; set; }
    }
}

