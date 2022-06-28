using kolokwium.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kolokwium.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeamController : ControllerBase
    {
        private readonly IDbService _dbService;
        public TeamController(IDbService dbService)
        {
            _dbService = dbService;
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> GetTeam(int id)
        {
            var team = await _dbService.GetTeam(id);
            return Ok(team);
        }
    }

}
