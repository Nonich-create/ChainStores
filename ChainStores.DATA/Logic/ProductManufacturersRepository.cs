using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Logic
{
    public class ProductManufacturersRepository : Repository<ProductManufacturer>, IProductManufacturersRepository
    {
        private readonly dbContext _db;

        public ProductManufacturersRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IEnumerable<string> GetProductManufacturer()
        {
            var shops = _db.ProductManufacturers.Select(g => g.Title).Distinct().OrderBy(c => c);
            return shops;
        }

        public IQueryable<ProductManufacturer> SearchProductManufacturers(string stringSearch)
        {
            IQueryable<ProductManufacturer> query = _db.ProductManufacturers.Where(p => p.Title.Contains(stringSearch)
            || p.Country.Contains(stringSearch) || p.Info.Contains(stringSearch) || p.Address.Contains(stringSearch));
            return query;
        }
    }
}