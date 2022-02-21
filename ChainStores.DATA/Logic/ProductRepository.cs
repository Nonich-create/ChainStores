using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Linq.Expressions;

namespace ChainStores.DATA.Logic
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {
        private readonly dbContext _db;

        public ProductRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IQueryable<Product> GetProducts()
        {
            var query = _db.Products
                .Include(p => p.ProductCategory)
                .Include(p => p.ProductManufacturer)
                .Include(p => p.CommoаdityUnit)
                .OrderBy(p => p.Title)
                .ThenBy(p => p.UnitPrice);
            return query;
        }

        public Product GetProduct(Guid Id)
        {
            Product query = _db.Set<Product>()
                .AsNoTracking().First(p => p.Id == Id);
            return query;
        }

        public IQueryable<Product> SearchProducts(string stringSearch)
        {
        IQueryable<Product> query;

            if (double.TryParse(stringSearch, out var parsedNumber) == true)
            {
                double number = Convert.ToDouble(stringSearch);
                query = _db.Products
                    .Include(p => p.ProductCategory)
                    .Include(p => p.ProductManufacturer)
                    .Include(p => p.CommoаdityUnit)
                    .Where(p => p.UnitPrice >= number)
                    .OrderBy(p => p.UnitPrice).ThenBy(p => p.Title);
            }
            else
            {
                query = _db.Products
                    .Include(p => p.ProductCategory)
                    .Include(p => p.ProductManufacturer)
                    .Include(p => p.CommoаdityUnit)
                    .Where(p => p.Title.Contains(stringSearch)
              || p.ProductManufacturer.Title.Contains(stringSearch)
              || p.ProductCategory.Title.Contains(stringSearch)
              || p.ProductComposition.Contains(stringSearch)
              || p.ProductCategory.Code.Contains(stringSearch)
              || p.Article.Contains(stringSearch)
              || p.Сertificate.Contains(stringSearch))
                    .OrderBy(p => p.UnitPrice).ThenBy(p => p.Title);
            }
            return query;

        }
    }
}