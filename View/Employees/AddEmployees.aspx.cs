using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ChainStores.View.Employees
{
    public partial class AddEmployees : System.Web.UI.Page
    {
        private dbContext _db;
        private IPositionRepository _positionRepository;
        private IShopRepository _shopRepository;
        private IEmployeeRepository _employeeRepository;

        public AddEmployees()
        {
            _db = new dbContext();
            _positionRepository = new PositionRepository(_db);
            _shopRepository = new ShopRepository(_db);
            _employeeRepository = new EmployeeRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var positionId = _db.Positions.First(c => c.Title == dropDownPositions.SelectedValue).Id;
                var shopId = _db.Shops.First(c => c.Title == dropDownShop.SelectedValue).Id;
                if (!String.IsNullOrEmpty(textLastName.Text) && Convert.ToInt32(textAge.Text) > 14
                    && !String.IsNullOrEmpty(textFirstName.Text) && !String.IsNullOrEmpty(textPhoneNumber.Text)
                    && !String.IsNullOrEmpty(textInsurancePolicy.Text))
                {
                    Employee employee = new Employee()
                    {
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
                    _employeeRepository.AddAsync(employee);
                    Response.Redirect("~/View/Employees/ViewEmployees");
                }
            }
            catch
            {

            }
        }
        
        public IEnumerable<string> GetPositions()
        => _positionRepository.GetPositions();

        public IEnumerable<string> GetShops()
        => _shopRepository.GetShops();

        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Employees/ViewEmployees");

 

     
         
    }
}