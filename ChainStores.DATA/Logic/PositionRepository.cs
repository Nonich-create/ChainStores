using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ChainStores.DATA.Logic
{
    public class PositionRepository : Repository<Position>, IPositionRepository
    {
        private readonly dbContext _db;

        public PositionRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IEnumerable<string> GetPositions()
        {
            var positions = _db.Positions.Select(g => g.Title).Distinct().OrderBy(c => c);
            return positions;
        }

        public IQueryable<Position> SearchPositions(string stringSearch)
        {
            IQueryable<Position> query;
            if (Double.TryParse(stringSearch, out var parsedNumber) == true)
            {
                double number = Convert.ToDouble(stringSearch);
                query = _db.Positions.Where(p => p.Salary >= number)
                    .OrderBy(p => p.Title).ThenBy(p => p.Salary);
            }
            else
            {
                query = _db.Positions.Where(p => p.Title.Contains(stringSearch) 
                || p.JobDescriptions.Contains(stringSearch) ||
                p.CodePosition.Contains(stringSearch)) 
                    .OrderBy(p => p.Title).ThenBy(p => p.Salary);
                return query;
            }
            return query;
        }
    }
}