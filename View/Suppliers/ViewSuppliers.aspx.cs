using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ChainStores.View.Suppliers
{
    public partial class ViewSuppliers : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private ISupplierRepository _supplierRepository;

        public ViewSuppliers()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _supplierRepository = new SupplierRepository(_db);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewSuppliers.DataSource = _supplierRepository.GetAll()
                .OrderBy(s => s.Title).ThenBy(s => s.Country).ThenBy(s => s.ContactPerson).ToList();
            gridViewSuppliers.DataBind();
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Suppliers/AddSupplier");
        

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewSuppliers.DataSource = _supplierRepository.SearchSuppliers(textSearch.Text).ToList();
                gridViewSuppliers.DataBind();
            }
        }

        protected void gridViewSuppliers_RowDataBound(object sender, GridViewRowEventArgs e)
        => _eventGrid.gridViewHeader(sender, e);

        protected void gridViewSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _supplierRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/Suppliers/ViewSuppliers");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateSupplier.aspx?Id={Id}");
            }
        }
    }
}
 