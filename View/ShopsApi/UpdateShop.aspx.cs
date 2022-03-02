using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Web.Configuration;

namespace ChainStores.View.ShopsApi
{
    public partial class UpdateShop : System.Web.UI.Page
    {
        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ShopsApi/ViewShops");
    }
}