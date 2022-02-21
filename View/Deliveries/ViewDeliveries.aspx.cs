using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.ModelBinding;
using ChainStores.DATA;

namespace ChainStores.View.Deliveries
{
    public partial class ViewDeliveries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewDeliveries.DataSource = GetDeliveries().ToList();
            gridViewDeliveries.DataBind();
        }
        public IQueryable<Supply> GetDeliveries()
        {
            var _db = new dbContext();
            IQueryable<Supply> query = _db.Deliveries
                .Include(d => d.Shop)
                .Include(d => d.Employee)
                .Include(d => d.Employee.Position)
                .Include(d => d.Supplier)
                .Include(d => d.Product)
                .Include(d => d.Product.ProductCategory)
                .Include(d => d.Product.ProductManufacturer)
                .OrderBy(d => d.Shop.Title).ThenBy(d =>d.ActualDateReceipt).ThenBy(d =>d.ApplicationDate)
                .ThenBy(d =>d.ApplicationDate);
            return query;
        }

        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Deliveries/AddSupply");
        }

        protected void buttonSearch_Click(object sender, EventArgs e)
        {

        }
    }
}