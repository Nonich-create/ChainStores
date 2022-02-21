using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Logic
{
    public class ShopRepository : Repository<Shop>, IShopRepository
    {
        private readonly dbContext _db;

        public ShopRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IEnumerable<string> GetShops()
        {
            var shops = _db.Shops.Select(g => g.Title).Distinct().OrderBy(c => c);
            return shops;
        }

        public IQueryable<Shop> SearchShops(string stringSearch)
        {
            IQueryable<Shop> query;
            if (double.TryParse(stringSearch, out var parsedNumber) == true && stringSearch.Length < 4)
            {
                double number = Convert.ToDouble(stringSearch);
                query = _db.Shops.Where(s => s.RetailSpace >= number)
                      .OrderBy(s => s.Title).ThenBy(s => s.RetailSpace);
            }
            else
            {
                query = _db.Shops.Where(s => s.Title.Contains(stringSearch)
              || s.Adress.Contains(stringSearch)
              || s.Category.Contains(stringSearch)
              || s.FormTradeService.Contains(stringSearch)
              || s.Info.Contains(stringSearch)
              || s.MCC.Contains(stringSearch)
              || s.ProductRange.Contains(stringSearch)
              || s.PhoneNumber.Contains(stringSearch)
              || s.WebSite.Contains(stringSearch))
                    .OrderBy(s => s.Title).ThenBy(s => s.RetailSpace);
            }
            return query;
        }
    }
}