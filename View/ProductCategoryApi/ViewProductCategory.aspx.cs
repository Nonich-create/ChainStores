using System;

namespace ChainStores.View.ProductCategoryApi
{
    public partial class ViewProductCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

 
        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ProductCategory/AddProductCategory");
        

    }
}