using ChainStores.DATA.Models;
using System.Collections.Generic;
using System.Linq;


namespace ChainStores.DATA.Logic
{
    public class CommoаdityUnitRepository : Repository<CommoаdityUnit>, ICommoаdityUnitRepository
    {
        private readonly dbContext _db;

        public CommoаdityUnitRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IEnumerable<string> GetCommoаdityUnit()
        {
            var positions = _db.CommoаdityUnits.Select(g => g.Title).Distinct().OrderBy(c => c);
            return positions;
        }
    }
}
