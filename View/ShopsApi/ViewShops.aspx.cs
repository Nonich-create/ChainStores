using System;
using System.Web.Configuration;

namespace ChainStores.View.ShopsApi
{
    public partial class ViewShops : System.Web.UI.Page
    {
        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }
    }
}