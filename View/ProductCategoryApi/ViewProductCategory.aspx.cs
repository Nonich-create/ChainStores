using System;
using System.Web.Configuration;

namespace ChainStores.View.ProductCategoryApi
{
    public partial class ViewProductCategory : System.Web.UI.Page
    {
        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }


        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ProductCategoryApi/AddProductCategory");
        

    }
}