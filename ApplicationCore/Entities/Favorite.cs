using System;
namespace ApplicationCore.Entities
{
    public class Favorite
    {
        public int MovieId { get; set; }
        public int UserId { get; set; }

        //navigation properties
        public Movie Movie { get; set; }
        public User User { get; set; } 
    }
}

