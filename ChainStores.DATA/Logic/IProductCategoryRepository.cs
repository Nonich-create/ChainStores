using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IProductCategoryRepository : IRepository<ProductCategory>
    {
        IEnumerable<string> GetProductCategory();
        IQueryable<ProductCategory> SearchProductCategories(string stringSearch);
    }
}
