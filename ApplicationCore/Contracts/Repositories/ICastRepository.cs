using System;
using System.Threading.Tasks;
using ApplicationCore.Entities;

namespace ApplicationCore.Contracts.Repositories
{
    public interface ICastRepository
    {
        public Task<Cast> GetById(int castId);
    }
}

