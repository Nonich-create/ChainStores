using System;


namespace ChainStores.View.ProductCategoryApi
{
    public partial class AddProductCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/ProductCategoryApi/ViewProductCategory");
        }

    }
}