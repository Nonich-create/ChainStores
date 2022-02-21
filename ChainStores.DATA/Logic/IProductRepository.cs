using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IProductRepository : IRepository<Product>
    {
        Product GetProduct(Guid Id);
        IQueryable<Product> GetProducts();
        IQueryable<Product> SearchProducts(string stringSearch);
    }
}
