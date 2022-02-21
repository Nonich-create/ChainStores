using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChainStores.Events;
using System;
using System.Linq;
using System.Web.UI.WebControls;


namespace ChainStores.View.ViewProductCategory
{
    public partial class ViewProductCategory : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private DATA.Logic.IProductCategoryRepository _productCategoryRepository;
        public ViewProductCategory()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _productCategoryRepository = new DATA.Logic.ProductCategoryRepository(_db);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewProductCategoty.DataSource = _productCategoryRepository.GetAll().ToList();
            gridViewProductCategoty.DataBind();
        }

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewProductCategoty.DataSource =
                    _productCategoryRepository.SearchProductCategories(textSearch.Text).ToList();
                gridViewProductCategoty.DataBind();
            }

        }
   
 
 
        protected void ButtonOpenAdd_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/ProductCategory/AddProductCategory");
        

        protected void gridViewProductCategoty_RowDataBound(object sender, GridViewRowEventArgs e)
        =>_eventGrid.gridViewHeader(sender, e);

        protected void gridViewProductCategoty_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _productCategoryRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/ProductCategory/ViewProductCategory");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdateCategory.aspx?Id={Id}");
            }
        }
    }
}