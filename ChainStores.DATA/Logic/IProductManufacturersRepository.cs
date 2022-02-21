﻿using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IProductManufacturersRepository : IRepository<ProductManufacturer>
    {
        IEnumerable<string> GetProductManufacturer();
        IQueryable<ProductManufacturer> SearchProductManufacturers(string stringSearch);
    }
}
