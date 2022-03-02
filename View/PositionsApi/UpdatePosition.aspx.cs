using System;
using System.Web.Configuration;

namespace ChainStores.View.PositionsApi
{
    public partial class UpdatePosition : System.Web.UI.Page
    {

        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/PositionsApi/ViewPositions");
    }
}