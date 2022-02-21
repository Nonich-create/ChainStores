using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChainStores.View.ProductManufacturers
{
    public partial class AddProductManufacturer : System.Web.UI.Page
    {

        private IProductManufacturersRepository _productManufacturersRepository;
        private dbContext _db;

        public AddProductManufacturer()
        {
            _db = new dbContext();
            _productManufacturersRepository = new ProductManufacturersRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ProductManufacturers/ViewProductManufacturers");
        

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrEmpty(textAddress.Text) && !String.IsNullOrEmpty(textTitle.Text)
                    && !String.IsNullOrEmpty(textCountry.Text))
                {
                    var _db = new dbContext();
                    ProductManufacturer productManufacturer = new ProductManufacturer()
                    {
                        Title = textTitle.Text,
                        Address = textAddress.Text,
                        Info = textInfo.Text,
                        Country = textCountry.Text
                    };

                    if (!_db.ProductManufacturers.Any(a => a.Title == productManufacturer.Title))
                    {
                        _productManufacturersRepository.AddAsync(productManufacturer);
                        Response.Redirect("~/View/ProductManufacturers/ViewProductManufacturers");
                    }
                }
            }
            catch
            {

            }
          
        }
    }
}