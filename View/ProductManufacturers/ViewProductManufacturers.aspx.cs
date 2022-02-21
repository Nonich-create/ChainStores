using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ChainStores.View.ProductManufacturers
{
    public partial class ViewProductManufacturers : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private IProductManufacturersRepository _productManufacturersRepository;
        public ViewProductManufacturers( )
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _productManufacturersRepository = new ProductManufacturersRepository(_db);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewProductManufacturers.DataSource = _productManufacturersRepository.GetAll().ToList();
            gridViewProductManufacturers.DataBind();
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ProductManufacturers/AddProductManufacturer");
        

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewProductManufacturers.DataSource
                    = _productManufacturersRepository.SearchProductManufacturers(textSearch.Text).ToList();
                gridViewProductManufacturers.DataBind();
            }
        }

        protected void gridViewProductManufacturers_RowDataBound(object sender, GridViewRowEventArgs e)
        =>_eventGrid.gridViewHeader(sender, e);

        protected void gridViewProductManufacturers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _productManufacturersRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/ProductManufacturers/ViewProductManufacturers");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateManufacturer.aspx?Id={Id}");
            }
        }
    }
}