using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [EnableCors(origins: "https://localhost:44346", headers: "*", methods: "*")]
    public class ManufacturerController : ApiController
    {
        private dbContext _db;
        private IProductManufacturersRepository _productManufacturersRepository;
        ManufacturerController()
        {
            _db = new dbContext();
            _productManufacturersRepository = new ProductManufacturersRepository(_db);
        }

        [HttpGet, Route("GetManufacturerAll"), ActionName("GetManufacturerAll")]
        public IEnumerable<ProductManufacturer> GetAll()
        {
            return _productManufacturersRepository.GetAll();
        }

        [HttpGet, ActionName("Get")]
        public async Task<ProductManufacturer> GetAsync(Guid id)
        {
            return await _productManufacturersRepository.FindAsync(id);
        }

        [HttpGet, Route("GetManufacturers"), ActionName("GetManufacturers")]
        public IEnumerable<string> GetManufacturers()
        {
            return _productManufacturersRepository.GetProductManufacturer();
        }

        [HttpGet, ActionName("SearchManufacturers")]
        public IQueryable<ProductManufacturer> SearchManufacturers(string stringSearch)
        {
            return _productManufacturersRepository.SearchProductManufacturers(stringSearch);
        }

        [HttpGet, Route("AddManufacturer"), ActionName("AddManufacturer")]
        public async Task AddAsync(string title, string address, string info, string country)
        {
            if (!string.IsNullOrEmpty(title))
            {
                ProductManufacturer manufacturer = new ProductManufacturer()
                {
                    Title = title,
                    Address = address,
                    Info = info,
                    Country = country
                };
                await _productManufacturersRepository.AddAsync(manufacturer);
            }
        }

        [HttpGet, Route("UpdateManufacturer"), ActionName("UpdateManufacturer")]
        public async Task UpdateAsync(string title, string address, string info, string country, string Id)
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(title))
            {
                ProductManufacturer manufacturer = new ProductManufacturer()
                {
                    Id = new Guid(Id),
                    Title = title,
                    Address = address,
                    Info = info,
                    Country = country
                };

                await _productManufacturersRepository.UpdateAsync(manufacturer);
            }
        }

        [HttpDelete, Route("DeleteManufacturer"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _productManufacturersRepository.Delete(id);
        }
    }
}