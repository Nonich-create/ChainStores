using System;
using System.Web.Configuration;

namespace ChainStores.View.SuppliersApi
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/SuppliersApi/ViewSuppliers");
        
    }
}