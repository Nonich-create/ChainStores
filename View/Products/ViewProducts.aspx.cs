using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.UI.WebControls;
 

namespace ChainStores.View.Products
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private IProductRepository _productRepository;
        public ViewProducts()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _productRepository = new ProductRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewProducts.DataSource = _productRepository.GetProducts().ToList();
            gridViewProducts.DataBind();
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Products/AddProduct");

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewProducts.DataSource = _productRepository.SearchProducts(textSearch.Text).ToList();
                gridViewProducts.DataBind();
            }
        }

        protected void gridViewProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        =>_eventGrid.gridViewHeader(sender, e);

        protected void gridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _productRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/Products/ViewProducts");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateProduct.aspx?Id={Id}");
            }
        }
    }
}