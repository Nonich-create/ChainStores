using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChainStores.View.Products
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        private IProductRepository _productRepository;
        private IProductCategoryRepository _productCategoryRepository;
        private IProductManufacturersRepository _productManufacturersRepository;
        private dbContext _db;

        public UpdateProduct()
        {
            _db = new dbContext();
            _productRepository = new ProductRepository(_db);
            _productCategoryRepository = new ProductCategoryRepository(_db);
            _productManufacturersRepository = new ProductManufacturersRepository(_db);
        }

        public IEnumerable<string> GetCategories()
        => _productCategoryRepository.GetProductCategory();

        public IEnumerable<string> GetManufacturers()
        => _productManufacturersRepository.GetProductManufacturer();

        public IEnumerable<string> GetCommoаdityUnits()
        {
            var _db = new dbContext();
            var commoаdityUnits = _db.CommoаdityUnits.Select(g => g.Title).Distinct().OrderBy(c => c);
            return commoаdityUnits;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty =  _productRepository.Find(Id);
                textArticle.Text = entitty.Article;
                TextTitle.Text = entitty.Title;
                textDateManufacture.Text = entitty.DateManufacture.ToString("s").Substring(0, 10);
                DateTime DateManufacture = (DateTime)entitty.ExpirationDate;
                if (!String.IsNullOrEmpty(DateManufacture.ToString()))
                {
                    textExpirationDate.Text = DateManufacture.ToString("s").Substring(0, 10);
                }
                textPrice.Text = entitty.UnitPrice.ToString();
                textProductComposition.Text = entitty.ProductComposition;
                textDescription.Text = entitty.Description;
                textСertificate.Text = entitty.Сertificate;
                dropDownCategories.SelectedValue = entitty.ProductCategory.Title;
                dropDownCommoаdityUnit.SelectedValue = entitty.CommoаdityUnit.Title;
                dropDownManufacturers.SelectedValue = entitty.ProductManufacturer.Title;

            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var categoryId = _db.ProductCategories.First(c => c.Title == dropDownCategories.SelectedValue).Id;
                var manufacturerId = _db.ProductManufacturers.First(c => c.Title == dropDownManufacturers.SelectedValue).Id;
                var commoаdityUnitId = _db.CommoаdityUnits.First(c => c.Title == dropDownCommoаdityUnit.SelectedValue).Id;
                Guid Id = new Guid(Request.QueryString["Id"]);
                if (!String.IsNullOrEmpty(TextTitle.Text) && Convert.ToDouble(textPrice.Text) > 0
                         && !String.IsNullOrEmpty(textArticle.Text) && !String.IsNullOrEmpty(textDateManufacture.Text)
                         && !String.IsNullOrEmpty(textExpirationDate.Text))
                {
                    Product product = new Product()
                    {
                        Id = Id,
                        Title = TextTitle.Text,
                        UnitPrice = Convert.ToDouble(textPrice.Text),
                        ProductCategoryId = categoryId,
                        ProductManufacturerId = manufacturerId,
                        CommoаdityUnitId = commoаdityUnitId,
                        Description = textDescription.Text,
                        DateManufacture = Convert.ToDateTime(textDateManufacture.Text),
                        ExpirationDate = Convert.ToDateTime(textExpirationDate.Text),
                        Article = textArticle.Text,
                        Сertificate = textСertificate.Text,
                        ProductComposition = textProductComposition.Text,
                    };
                        _productRepository.UpdateAsync(product);
                        Response.Redirect("~/View/Products/ViewProducts");
                }
            }
            catch
            {
                
            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Products/ViewProducts");
    }
}