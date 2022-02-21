using System;


namespace ChainStores.View.ProductsApi
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ProductsApi/ViewProducts");
        
    }
}