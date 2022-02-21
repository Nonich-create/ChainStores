using ChainStores.DATA.Models;
using System.Collections.Generic;

namespace ChainStores.DATA.Logic
{
    public interface ICommoаdityUnitRepository : IRepository<CommoаdityUnit>
    {
        IEnumerable<string> GetCommoаdityUnit();
    }
}
