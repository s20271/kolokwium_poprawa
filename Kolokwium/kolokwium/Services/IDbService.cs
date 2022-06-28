using kolokwium.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kolokwium.Services
{
    public interface IDbService
    {
        Task<IEnumerable<SomeInfoOfTeam>> GetTeam(int id);
        Task<bool> DoeasTeamExist(int id);
    }
}
