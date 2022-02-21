using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Logic
{
    public class ProductCategoryRepository : Repository<ProductCategory>, IProductCategoryRepository
    {
        private readonly dbContext _db;

        public ProductCategoryRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IEnumerable<string> GetProductCategory()
        {
            var shops = _db.ProductCategories.Select(g => g.Title).Distinct().OrderBy(c => c);
            return shops;
        }

        public IQueryable<ProductCategory> SearchProductCategories(string stringSearch)
        {
            IQueryable<Models.ProductCategory> query = _db.ProductCategories.Where(p => p.Title.Contains(stringSearch)
            || p.Code.Contains(stringSearch) || p.Info.Contains(stringSearch));
            return query;
        }
    }
}