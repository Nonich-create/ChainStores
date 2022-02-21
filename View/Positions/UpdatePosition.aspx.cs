using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Threading.Tasks;

namespace ChainStores.View.Positions
{
    public partial class UpdatePosition : System.Web.UI.Page
    {
        private dbContext _db;
        private IPositionRepository _positionRepository;

        public UpdatePosition()
        {
            _db = new dbContext();
            _positionRepository = new PositionRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);

                if (!String.IsNullOrEmpty(textPosition.Text) && Convert.ToInt32(textSalary.Text) > 0
                    && !String.IsNullOrEmpty(textPosition.Text))
                {
                    Position position = new Position()
                    {
                        Id = Id,
                        JobDescriptions = textJobDescriptions.Text,
                        Title = textPosition.Text,
                        CodePosition = textCodePosition.Text,
                        Salary = Convert.ToInt32(textSalary.Text),
                        Info = textInfo.Text,
                    };

                        _positionRepository.UpdateAsync(position);
                        Response.Redirect("~/View/Positions/ViewPositions");
                    
                    
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Positions/ViewPositions");

        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty = _positionRepository.Find(Id);
                textCodePosition.Text = entitty.CodePosition;
                textPosition.Text = entitty.Title;
                textJobDescriptions.Text = entitty.JobDescriptions;
                textSalary.Text = entitty.Salary.ToString();
                textInfo.Text = entitty.Info;
            }
        }
    }
}