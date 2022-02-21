using System;

namespace ChainStores.View.SuppliersApi
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/SuppliersApi/ViewSuppliers");
        
    }
}