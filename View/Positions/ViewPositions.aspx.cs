using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.Events;
using System;
using System.Linq;

using System.Web.UI.WebControls;

namespace ChainStores.View.Positions
{
    public partial class ViewPositions : System.Web.UI.Page
    {
        private dbContext _db;
        private IEventGrid _eventGrid;
        private IPositionRepository _positionRepository;
        public ViewPositions()
        {
            _eventGrid = new EventGrid();
            _db = new dbContext();
            _positionRepository = new PositionRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewPositions.DataSource = _positionRepository.GetAll()
                .OrderBy(p => p.Title).ThenBy(p => p.Salary).ToList();
            gridViewPositions.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Positions/AddPosition");
        

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textSearch.Text))
            {
                gridViewPositions.DataSource = _positionRepository.SearchPositions(textSearch.Text).ToList();
                gridViewPositions.DataBind();
            }
        }

        protected void gridViewPositions_RowDataBound(object sender, GridViewRowEventArgs e)
        => _eventGrid.gridViewHeader(sender, e);

        protected void gridViewPositions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid Id = new Guid(e.CommandArgument.ToString());
            if (e.CommandName == "Delete")
            {
                if (Id != Guid.Empty)
                {
                    _positionRepository.DeleteAsync(Id);
                    Response.Redirect("~/View/Positions/ViewPositions");
                }
            }
            else
            if (e.CommandName == "Update")
            {
                Response.Redirect($"UpdatePosition.aspx?Id={Id}");
            }
        }
    }
}