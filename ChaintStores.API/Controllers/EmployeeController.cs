using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [EnableCors(origins: "https://localhost:44346", headers: "*", methods: "*")]
    public class EmployeeController : ApiController
    {
        private dbContext _db;
        private IEmployeeRepository _employeeRepository;
        EmployeeController()
        {
            _db = new dbContext();
            _employeeRepository = new EmployeeRepository(_db);
        }

        [HttpGet, Route("GetEmployeeAll"), ActionName("GetEmployeeAll")]
        public IEnumerable<Employee> GetAll()
        {
            return _employeeRepository.GetEmployees();
        }

        [HttpGet, ActionName("Get")]
        public async Task<Employee> GetAsync(Guid id)
        {
            return await _employeeRepository.FindAsync(id);
        }

        [HttpGet, ActionName("SearchEmployees")]
        public IQueryable<Employee> SearchEmployees(string stringSearch)
        {
            return _employeeRepository.SearchEmployees(stringSearch);
        }

        [HttpGet, Route("AddEmployee"), ActionName("AddEmployee")]
        public async Task AddAsync(string firstName, string lastName, string middleName, int age
            ,string info, string appointment, string phoneNumber, string ssn, 
            string position, string shop)
        {
            if (!string.IsNullOrEmpty(lastName) && !string.IsNullOrEmpty(firstName))
            {
                var positionId = _db.Positions.First(c => c.Title == position).Id;
                var shopId = _db.Shops.First(c => c.Title == shop).Id;
                Employee employee = new Employee()
                {
                    FirstName = firstName,
                    LastName = lastName,
                    MiddleName = middleName,
                    Age = Convert.ToInt32(age),
                    Info = info,
                    DateEmployment = Convert.ToDateTime(appointment),
                    PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                    PositionId = positionId,
                    ShopId = shopId,
                    InsurancePolicy = ssn
                };
                await _employeeRepository.AddAsync(employee);
            }
        }

        [HttpGet, Route("UpdateEmployee"), ActionName("UpdateAEmployee")]
        public async Task UpdateAsync(string firstName, string lastName, string middleName, int age
            , string info, string appointment, string phoneNumber, string ssn,
            string position, string shop, string id)
        {
            if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(lastName) && !string.IsNullOrEmpty(firstName))
            {
                Employee employee = new Employee()
                {
                    Id = new Guid(id),
                    FirstName = firstName,
                    LastName = lastName,
                    MiddleName = middleName,
                    Age = Convert.ToInt32(age),
                    Info = info,
                    DateEmployment = Convert.ToDateTime(appointment),
                    PhoneNumber = '+' + phoneNumber.Remove(0, 1),
                    PositionId = new Guid(position),
                    ShopId = new Guid(shop),
                    InsurancePolicy = ssn
                };
                await _employeeRepository.UpdateAsync(employee);
            }
        }

        [HttpDelete, Route("DeleteEmployee"), ActionName("Delete")]
        public void  Delete(Guid id)
        {
             _employeeRepository.Delete(id);
        }
    }
}