using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Linq;

namespace ChainStores.View.Positions
{
    public partial class AddPosition : System.Web.UI.Page
    {
        private IPositionRepository _positionRepository;
        private dbContext _db;

        public AddPosition()
        {
            _db = new dbContext();
            _positionRepository = new PositionRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
        
             try
             {
                 if (!String.IsNullOrEmpty(textPosition.Text) && Convert.ToDouble(textSalary.Text) > 0)
                 {
                     var _db = new dbContext();
                     Position position = new Position()
                     {
                         Title = textPosition.Text,
                         Salary = Convert.ToDouble(textSalary.Text),
                         CodePosition = textCodePosition.Text,
                         Info = textInfo.Text,
                         JobDescriptions = textJobDescriptions.Text    
                     };
                     if (!_db.Positions.Any(a => a.Title == position.Title || a.CodePosition == position.CodePosition))
                     {
                        _positionRepository.AddAsync(position);
                        Response.Redirect("~/View/Positions/ViewPositions");
                     }
                 }
             }
             catch
             {
             
             }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Positions/ViewPositions");
        }
    }
}