using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IShopRepository : IRepository<Shop>
    {
        IEnumerable<string> GetShops();
        IQueryable<Shop> SearchShops(string stringSearch);
    }
}
