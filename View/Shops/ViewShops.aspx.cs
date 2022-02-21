using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ChainStores.View.Shops
{
    public partial class ViewShops : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private IShopRepository _shopRepository;
        public ViewShops()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _shopRepository = new ShopRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewShops.DataSource = _shopRepository.GetAll()
                .OrderBy(s => s.Title).ThenBy(s => s.RetailSpace).ToList();
            gridViewShops.DataBind();
        }
 
        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Shops/AddShop");

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewShops.DataSource = _shopRepository.SearchShops(textSearch.Text).ToList();
                gridViewShops.DataBind();
            }
        }
        
        protected void gridViewShops_RowDataBound(object sender, GridViewRowEventArgs e)
        => _eventGrid.gridViewHeader(sender, e);

        protected void gridViewShops_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _shopRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/Shops/ViewShops");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateShop.aspx?Id={Id}");
            }
        }
    }
}