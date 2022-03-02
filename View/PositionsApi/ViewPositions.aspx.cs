using System;
using System.Web.Configuration;

namespace ChainStores.View.PositionsApi
{
    public partial class ViewPositions : System.Web.UI.Page
    {

        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }
        
    }
}  