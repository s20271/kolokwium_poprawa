using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kolokwium.Models.DTOs
{
    public class SomeInfoOfTeam
    {
        public string TeamName { get; set; }
        public string TeamDescription { get; set; }

        public Organization Organization { get; set; }

        public IEnumerable<SomeInfoOfMember> Members { get; set; }

    }
}
