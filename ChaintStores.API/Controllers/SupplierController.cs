using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChaintStores.API.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [MyCorsPolicy]
    public class SupplierController : ApiController
    {
        private dbContext _db;
        private ISupplierRepository _supplierRepository;
        SupplierController()
        {
            _db = new dbContext();
            _supplierRepository = new SupplierRepository(_db);
        }
        [HttpGet, Route("GetAllSupplier"), ActionName("GetAllSupplier")]
        public IEnumerable<Supplier> GetAll()
        {
            return _supplierRepository.GetAll()
                .OrderBy(s => s.Title).ThenBy(s => s.Country).ThenBy(s => s.ContactPerson);
        }

        [HttpGet, ActionName("Get")]
        public async Task<Supplier> GetAsync(Guid id)
        {
            return await _supplierRepository.FindAsync(id);
        }

        [HttpGet, Route("AddSupplier"), ActionName("AddSupplier")]
        public void Add(string title, string adress, string category, string country, string email,
            string phoneNumber, string info, string paymentAccount, string contactPerson)
        {
                Supplier supplier = new Supplier()
                {
                    Title = title,
                    Adress = adress,
                    Category = category,
                    Country = country,
                    Email = email,
                    PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                    Info = info,
                    PaymentAccount = paymentAccount,
                    ContactPerson = contactPerson
                };
                _supplierRepository.Add(supplier);
        }

        [HttpGet, ActionName("SearchSupplier")]
        public IQueryable<Supplier> SearchPositions(string stringSearch)
        {
            return _supplierRepository.SearchSuppliers(stringSearch);
        }
       
       [HttpGet, Route("UpdateSupplier"), ActionName("UpdateSupplier")]
       public void Update(string title, string adress, string category, string country, string email,
       string phoneNumber, string info, string paymentAccount, string contactPerson, string Id)
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(title))
            {
                Supplier supplier = new Supplier()
                {
                    Id = new Guid(Id),
                    Title = title,
                    Adress = adress,
                    Category = category,
                    Country = country,
                    Email = email,
                    PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                    Info = info,
                    PaymentAccount = paymentAccount,
                    ContactPerson = contactPerson
                };
                _supplierRepository.Update(supplier);
            }
        }
        
        [HttpGet, Route("DeleteSupplier"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _supplierRepository.Delete(id);
        }
    }
}