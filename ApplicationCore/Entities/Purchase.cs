using System;

namespace ApplicationCore.Entities
{
    public class Purchase
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int UserId { get; set; }

        public DateTime PurchaseDateTime { get; set; }
        public System.Guid PurchaseNumber { get; set; }
        public decimal TotalPrice { get; set; }

        // navigation properties
        public Movie Movie { get; set; }
        public User User { get; set; }
    }
}

