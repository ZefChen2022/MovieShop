using System;
using ApplicationCore.Entities;
using System.ComponentModel.DataAnnotations;

namespace ApplicationCore.Models
{
    public class CastModel
    {
        public int Id { get; set; }
        public string? Gender { get; set; }
        public string? Name { get; set; }
        public string? ProfilePath { get; set; }
        public string? Character { get; set; }

        public ICollection<MovieCast>? MoviesOfCast { get; set; }

    }
}

