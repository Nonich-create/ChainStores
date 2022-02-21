using System;

namespace ChainStores.View.ProductManufacturersApi
{
    public partial class UpdateManufacturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ProductManufacturersApi/ViewProductManufacturers");
    }
}