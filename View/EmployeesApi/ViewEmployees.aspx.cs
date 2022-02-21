using System;

namespace ChainStores.View.EmployeesApi
{
    public partial class ViewEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }
   
        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Employees/AddEmployees");
        
    }
}