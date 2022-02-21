using System;

namespace ChainStores.View.EmployeesApi
{
    public partial class UpdateEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonBack_Click(object sender, EventArgs e)
            => Response.Redirect("~/View/EmployeesApi/ViewEmployees");
    }
}