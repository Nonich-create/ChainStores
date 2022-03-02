using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ChainStores.View.SuppliersApi
{
    public partial class ViewSuppliers : System.Web.UI.Page
    {

        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/SuppliersApi/AddSupplier");

    }
}
 