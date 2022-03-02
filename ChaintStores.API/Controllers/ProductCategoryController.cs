using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChaintStores.API.App_Start;
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
    [MyCorsPolicy]
    public class ProductCategoryController : ApiController
    {
        private dbContext _db;  
        private IProductCategoryRepository _productCategoryRepository;
        ProductCategoryController()
        {
            _db = new dbContext();
            _productCategoryRepository = new ProductCategoryRepository(_db);
        }

        [HttpGet, Route("GetProductCategoryAll"), ActionName("GetProductCategoryAll")]
        public IEnumerable<ProductCategory> GetAll()
        {
            return _productCategoryRepository.GetAll();
        }

        [HttpGet, ActionName("Get")]
        public async Task<ProductCategory> GetAsync(Guid id)
        {
              return await _productCategoryRepository.FindAsync(id);
        }

        [HttpGet, Route("GetProductCategories"), ActionName("GetProductCategories")]
        public IEnumerable<string> GetProductCategories()
        {
            return _productCategoryRepository.GetProductCategory();
        }

        [HttpGet, ActionName("SearchProductCategories")]
        public IQueryable<ProductCategory> SearchProductCategories(string stringSearch)
        {
            return _productCategoryRepository.SearchProductCategories(stringSearch);
        }

        [HttpGet, Route("AddProductCategory"), ActionName("AddProductCategory")]
        public void Add(string title, string code, string info)
        {
                ProductCategory productCategory = new ProductCategory()
                {
                    Title = title,
                    Code = code,
                    Info = info,
                };
                 _productCategoryRepository.Add(productCategory);
        }

        [HttpGet, Route("UpdateProductCategory"), ActionName("UpdateProductCategory")]
        public void Update(string title, string code, string info, string Id)
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(code))
            {
                ProductCategory productCategory = new ProductCategory()
                {
                    Id = new Guid(Id),
                    Title = title,
                    Code = code,
                    Info = info,
                };

                 _productCategoryRepository.Update(productCategory);
            }
        }

        [HttpGet, Route("DeleteProductCategory"), ActionName("Delete")]
        public void Delete(Guid id)
        {
             _productCategoryRepository.Delete(id);
        }
    }
}