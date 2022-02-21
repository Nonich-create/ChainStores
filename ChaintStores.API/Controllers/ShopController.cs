using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [EnableCors(origins: "https://localhost:44346", headers: "*", methods: "*")]
    public class ShopController : ApiController
    {
        private dbContext _db;
        private IShopRepository _shopRepository;
        ShopController()
        {
            _db = new dbContext();
            _shopRepository = new ShopRepository(_db);
        }

        [HttpGet, Route("GetShopAll"), ActionName("GetShopAll")]
        public IEnumerable<Shop> GetAll()
        {
            return _shopRepository.GetAll()
                .OrderBy(s => s.Title).ThenBy(s => s.RetailSpace).ToList(); 
        }

        [HttpGet, ActionName("Get")]
        public async Task<Shop> GetAsync(Guid id)
        {
            return await _shopRepository.FindAsync(id);
        }

        [HttpGet, Route("GetShops"), ActionName("GetShops")]
        public IEnumerable<string> GetPositions()
        {
            return _shopRepository.GetShops();
        }

        [HttpGet, ActionName("SearchShops")]
        public IQueryable<Shop> SearchShops(string stringSearch)
        {
            return _shopRepository.SearchShops(stringSearch);
        }

        [HttpGet, Route("AddShop"), ActionName("AddShop")]
        public async Task AddAsync(string title, string adress, string info, string category, string mcc,
            string formTradeService, string phoneNumber, string productRange,
            int retailSpace, string webSite)
        {
            if (!string.IsNullOrEmpty(title))
            {
                Shop shop = new Shop()
                {
                    Title = title,
                    Adress = adress,
                    Info = info,
                    Category = category,
                    MCC = mcc,
                    FormTradeService = formTradeService,
                    PhoneNumber = phoneNumber,
                    ProductRange = productRange,
                    RetailSpace = retailSpace,
                    WebSite = webSite

                };
                await _shopRepository.AddAsync(shop);
            }
        }

        [HttpGet, Route("UpdateShop"), ActionName("UpdateShop")]
        public async Task UpdateAsync(string title, string address, string info, string category, string mcc,
            string formTradeService, string phoneNumber, string productRange, int retailSpace,
            string webSite, string Id)
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(title))
            {
                Shop shop = new Shop()
                {
                    Id = new Guid(Id),
                    Title = title,
                    Adress = address,
                    Info = info,
                    Category = category,
                    MCC = mcc,
                    FormTradeService = formTradeService,
                    PhoneNumber = phoneNumber,
                    ProductRange = productRange,
                    RetailSpace = retailSpace,
                    WebSite = webSite
                };

                await _shopRepository.UpdateAsync(shop);
            }
        }

        [HttpDelete, Route("DeleteShop"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _shopRepository.Delete(id);
        }
    }
}