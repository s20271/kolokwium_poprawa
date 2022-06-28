using kolokwium.Models;
using kolokwium.Models.DTOs;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kolokwium.Services
{
    public class DbService : IDbService
    {
        private readonly s20271Context _dbService;

        public DbService(s20271Context dbService)
        {
            _dbService = dbService;
        }

        public async Task<bool> DoeasTeamExist(int id)
        {
           // var team = await _dbService.Teams.Where(e => e.TeamId == id).FirstOrDefault();
          //  if (team is null) return false;
            return true;
        }

        public async Task<IEnumerable<SomeInfoOfTeam>> GetTeam(int id)
        {
            return await _dbService.Teams
                .Where(e => e.TeamId == id)
                .Include(e => e.Memberships)
                .Include(e => e.Organization)
                .Select(e => new SomeInfoOfTeam 
                { 
                    TeamName = e.TeamName,
                    TeamDescription = e.TeamDescription,
                    Organization = e.Organization,
                    Members = e.Memberships.Select(e=> new SomeInfoOfMember { MemberName = e.Member.MemberName, MemberSurname = e.Member.MemberSurname})
                }).ToListAsync();
        }
    }
}
