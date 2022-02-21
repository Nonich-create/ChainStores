using System;

namespace ChainStores.View.ShopsApi
{
    public partial class AddShop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ShopsApi/ViewShops");
        
    }
}