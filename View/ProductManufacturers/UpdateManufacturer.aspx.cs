using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Threading.Tasks;

namespace ChainStores.View.ProductManufacturers
{
    public partial class UpdateManufacturer : System.Web.UI.Page
    {
        private IProductManufacturersRepository _productManufacturersRepository;
        private dbContext _db;

        public UpdateManufacturer()
        {
            _db = new dbContext();
            _productManufacturersRepository = new ProductManufacturersRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                if (!String.IsNullOrEmpty(textTitle.Text)
                    && !String.IsNullOrEmpty(textCountry.Text))
                {
                    ProductManufacturer productManufacturer = new ProductManufacturer()
                    {
                        Id = Id,
                        Title = textTitle.Text,
                        Address = textAddress.Text,
                        Country = textCountry.Text,
                        Info = textInfo.Text
                    };
                        _productManufacturersRepository.UpdateAsync(productManufacturer);
                        Response.Redirect("~/View/ProductManufacturers/ViewProductManufacturers");
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ProductManufacturers/ViewProductManufacturers");

        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty = _productManufacturersRepository.Find(Id);
                textTitle.Text = entitty.Title;
                textCountry.Text = entitty.Country;
                textInfo.Text = entitty.Info;
                textAddress.Text = entitty.Address;
            }
        }
    }
}