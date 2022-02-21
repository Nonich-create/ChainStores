using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IPositionRepository : IRepository<Position>
    {
        IEnumerable<string> GetPositions();
        IQueryable<Position> SearchPositions(string stringSearch);
    }
}
