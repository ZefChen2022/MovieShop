using System;
using System.ComponentModel.DataAnnotations;

namespace ApplicationCore.Entities
{
    public class MovieCast
    {
        public int CastId { get; set; }
        public int MovieId { get; set; }

        [MaxLength(450)]
        public string Character { get; set; }

        // navigation properties
        public Movie Movie { get; set; }
        public Cast Cast { get; set; }
    }
}

