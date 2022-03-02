using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChaintStores.API.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;


namespace ChaintStores.API.Controllers
{
    [MyCorsPolicy]
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
        public void Add(string title, string address, string info, string category, string mcc,
            string formTradeService, string phoneNumber, string productRange, int retailSpace,
            string webSite)
        {
            Shop shop = new Shop()
            {
                Title = title,
                Adress = address,
                Info = info,
                Category = category,
                MCC = mcc,
                FormTradeService = formTradeService,
                PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                ProductRange = productRange,
                RetailSpace = retailSpace,
                WebSite = webSite

            };
            _shopRepository.Add(shop);

        }

        [HttpGet, Route("UpdateShop"), ActionName("UpdateShop")]
        public void Update(string title, string address, string info, string category, string mcc,
            string formTradeService, string phoneNumber, string productRange, int retailSpace,
            string webSite, string Id)
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
                    PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                    ProductRange = productRange,
                    RetailSpace = retailSpace,
                    WebSite = webSite
                };
                _shopRepository.Update(shop);
        }


        [HttpGet, Route("DeleteShop"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _shopRepository.Delete(id);
        }
    }
}


