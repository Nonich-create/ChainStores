using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChainStores.View.Employees
{
    public partial class UpdateEmployees : System.Web.UI.Page
    {
        private dbContext _db;
        private IEmployeeRepository _employeeRepository;
        private IPositionRepository _positionRepository;
        private IShopRepository _shopRepository;

        public UpdateEmployees()
        {
            _db = new dbContext();
            _employeeRepository = new EmployeeRepository(_db);
            _positionRepository = new PositionRepository(_db);
            _shopRepository = new ShopRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<string> GetPositions()
            => _positionRepository.GetPositions();

        public IEnumerable<string> GetShops()
            => _shopRepository.GetShops();

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
       
                var positionId = _db.Positions.First(c => c.Title == dropDownPositions.SelectedValue).Id;
                var shopId = _db.Shops.First(c => c.Title == dropDownShop.SelectedValue).Id;
                if (String.IsNullOrEmpty(textLastName.Text))
                {
                  
                   ModelState.AddModelError("Last name", "The last name must be specified server.site");
                }
                else
                {
                    if (!String.IsNullOrEmpty(textLastName.Text) && Convert.ToInt32(textAge.Text) > 14
                        && !String.IsNullOrEmpty(textFirstName.Text) && !String.IsNullOrEmpty(textPhoneNumber.Text)
                        && !String.IsNullOrEmpty(textInsurancePolicy.Text))
                    {
                        Employee employeeNew = new Employee()
                        {
                            Id = Id,
                            LastName = textLastName.Text,
                            FirstName = textFirstName.Text,
                            MiddleName = textMiddleName.Text,
                            Age = Convert.ToInt32(textAge.Text),
                            Info = textInfo.Text,
                            DateEmployment = Convert.ToDateTime(textAppointment.Text),
                            PhoneNumber = textPhoneNumber.Text,
                            PositionId = positionId,
                            ShopId = shopId,
                            InsurancePolicy = textInsurancePolicy.Text

                        };
                        _employeeRepository.UpdateAsync(employeeNew);
                        Response.Redirect("~/View/Employees/ViewEmployees");
                    }
                }
            }
            catch
            {
            
            }
        }
 
        protected void ButtonBack_Click(object sender, EventArgs e)
            => Response.Redirect("~/View/Employees/ViewEmployees");
      
        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty = _employeeRepository.Find(Id);
                textLastName.Text = entitty.LastName;
                textFirstName.Text = entitty.FirstName;
                textMiddleName.Text = entitty.MiddleName;
                textAge.Text = entitty.Age.ToString();
                string date = entitty.DateEmployment.ToString("s").Substring(0, 10);
                textAppointment.Text = date;
                textInfo.Text = entitty.Info;
                textPhoneNumber.Text = entitty.PhoneNumber;
                textInsurancePolicy.Text = entitty.InsurancePolicy;
                dropDownPositions.SelectedValue = entitty.Position.Title;
                dropDownShop.SelectedValue = entitty.Shop.Title;
            }
        }
    }
}