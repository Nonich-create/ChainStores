using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Linq;

namespace ChainStores.View.ProductCategory
{
    public partial class AddProductCategory : System.Web.UI.Page
    {
        private IProductCategoryRepository _productCategoryRepository;
        private dbContext _db;

        public AddProductCategory()
        {
            _db = new dbContext();
            _productCategoryRepository = new ProductCategoryRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/ProductCategory/ViewProductCategory");
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrEmpty(textCode.Text) && !String.IsNullOrEmpty(TextTitle.Text))
                {
                    ChainStores.DATA.Models.ProductCategory productCategory = new ChainStores.DATA.Models.ProductCategory()
                    {
                        Title = TextTitle.Text,
                        Code = textCode.Text,
                        Info = textInfo.Text
                    };

                    if (!_db.ProductCategories.Any(a => a.Title == productCategory.Title || a.Code == productCategory.Code))
                    {
                        _productCategoryRepository.AddAsync(productCategory);
                        Response.Redirect("~/View/ProductCategory/ViewProductCategory");
                    }
                }
            }
            catch
            {

            }
        }
    }
}