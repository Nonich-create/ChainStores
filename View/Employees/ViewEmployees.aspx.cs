using System;
using System.Linq;
using System.Web.UI.WebControls;
using ChainStores.Events;
using ChainStores.DATA;
using ChainStores.DATA.Logic;

namespace ChainStores.View.Employees
{
    public partial class ViewEmployees : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private IEmployeeRepository _employeeRepository;
        public ViewEmployees()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _employeeRepository = new EmployeeRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewEmployees.DataSource = _employeeRepository.GetEmployees().ToList();
            gridViewEmployees.DataBind();
        }

   
        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Employees/AddEmployees");
        

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewEmployees.DataSource = _employeeRepository.SearchEmployees(textSearch.Text).ToList();
                gridViewEmployees.DataBind();
            }
    
        }

        protected void gridViewEmployees_RowDataBound(object sender, GridViewRowEventArgs e)
        => _eventGrid.gridViewHeader(sender, e);

        protected void gridViewEmployees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _employeeRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/Employees/ViewEmployees");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateEmployees.aspx?Id={Id}");
            } 
        }
 

    }
}