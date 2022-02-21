using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Logic
{
    public class SupplierRepository : Repository<Supplier>, ISupplierRepository
    {
        private readonly dbContext _db;

        public SupplierRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IQueryable<Supplier> SearchSuppliers(string stringSearch)
        {
            IQueryable<Supplier> query = _db.Suppliers.Where(s => s.Title.Contains(stringSearch)
              || s.Adress.Contains(stringSearch)
              || s.Category.Contains(stringSearch)
              || s.ContactPerson.Contains(stringSearch)
              || s.Info.Contains(stringSearch)
              || s.Email.Contains(stringSearch)
              || s.Country.Contains(stringSearch)
              || s.PaymentAccount.Contains(stringSearch)
              || s.PhoneNumber.Contains(stringSearch)
              || s.Info.Contains(stringSearch))
               .OrderBy(s => s.Title).ThenBy(s => s.Country).ThenBy(s => s.ContactPerson);
            return query;
        }
    }
}