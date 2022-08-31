using System;
using System.Threading.Tasks;

using ApplicationCore.Models;

namespace ApplicationCore.Contracts.Services
{
    public interface ICastService
    {
        //Create GetCastDetails method in ICastService that should be implemented
        //in CastService that will call CastRepository using DI

        Task<CastDetailsModel> GetCastDetails(int castId);
    }
}

