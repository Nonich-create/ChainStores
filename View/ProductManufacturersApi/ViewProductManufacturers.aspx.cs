using System;

namespace ChainStores.View.ProductManufacturersApi
{
    public partial class ViewProductManufacturers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ProductManufacturersApi/AddProductManufacturer");
    }
}