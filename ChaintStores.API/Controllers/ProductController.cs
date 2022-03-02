using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChaintStores.API.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [MyCorsPolicy]
    public class ProductController : ApiController
    {
        private dbContext _db;
        private IProductRepository _productRepository;
        ProductController()
        {
            _db = new dbContext();
            _productRepository = new ProductRepository(_db);
        }

        [HttpGet, Route("GetProductAll"), ActionName("GetProductAll")]
        public IEnumerable<Product> GetAll()
        {
            return _productRepository.GetProducts();
        }

        [HttpGet, ActionName("Get")]
        public Product Get(Guid id)
        {
            return _productRepository.GetProduct(id);
        }

        [HttpGet, ActionName("SearchProducts")]
        public IQueryable<Product> SearchEmployees(string stringSearch)
        {
            return _productRepository.SearchProducts(stringSearch);
        }

        [HttpGet, Route("AddProduct"), ActionName("AddProduct")]
        public void Add(string title, string unitPrice, string productCategory, string productManufacturer
            , string commoаdityUnit, string description, string dateManufacture, string expirationDate,
            string article, string certificate, string productComposition)
        {
 
                var categoryId = _db.ProductCategories.First(c => c.Title == productCategory).Id;
                var manufacturerId = _db.ProductManufacturers.First(c => c.Title == productManufacturer).Id;
                var commoаdityUnitId = _db.CommoаdityUnits.First(c => c.Title == commoаdityUnit).Id;

                Product product = new Product()
                {
                    Title = title,
                    UnitPrice = Convert.ToDouble(unitPrice),
                    ProductCategoryId = categoryId,
                    ProductManufacturerId = manufacturerId,
                    CommoаdityUnitId = commoаdityUnitId,
                    Description = description,
                    DateManufacture = Convert.ToDateTime(dateManufacture),
                    ExpirationDate = Convert.ToDateTime(expirationDate),
                    Article = article,
                    Сertificate = certificate,
                    ProductComposition = productComposition,
                };
                _productRepository.Add(product);
           
        }

        [HttpGet, Route("UpdateProduct"), ActionName("UpdateProduct")]
        public void Update(string title, string unitPrice, string productCategory, string productManufacturer
            , string commoаdityUnit, string description, string dateManufacture, string expirationDate,
            string article, string certificate, string productComposition, string id)
        {
            if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(title)  && !string.IsNullOrEmpty(unitPrice))
            {
                Product product = new Product()
                {
                    Id = new Guid(id),
                    Title = title,
                    UnitPrice = Convert.ToDouble(unitPrice.Replace('.', ',')),
                    ProductCategoryId = new Guid(productCategory),
                    ProductManufacturerId = new Guid(productManufacturer),
                    CommoаdityUnitId = new Guid(commoаdityUnit),
                    Description = description,
                    DateManufacture = Convert.ToDateTime(dateManufacture),
                    ExpirationDate = Convert.ToDateTime(expirationDate),
                    Article = article,
                    Сertificate = certificate,
                    ProductComposition = productComposition,
                };
                _productRepository.Update(product);
            }     
        }

        [HttpGet, Route("DeleteProduct"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _productRepository.Delete(id);
        }
    }
}