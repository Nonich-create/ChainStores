using System;
using System.Web.Configuration;

namespace ChainStores.View.EmployeesApi
{
    public partial class UpdateEmployees : System.Web.UI.Page
    {
        public string WebApi;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebApi = WebConfigurationManager.AppSettings["WebAPI"];
        }
        protected void ButtonBack_Click(object sender, EventArgs e)
            => Response.Redirect("~/View/EmployeesApi/ViewEmployees");
    }
}