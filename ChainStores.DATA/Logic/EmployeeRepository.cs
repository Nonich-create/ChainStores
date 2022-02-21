using ChainStores.DATA;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ChainStores.DATA.Logic
{
    public class EmployeeRepository : Repository<Employee>, IEmployeeRepository
    {
        private readonly dbContext _db;

        public EmployeeRepository(dbContext db) : base(db)
        {
            _db = db;
        }

        public IQueryable<Employee> GetEmployees()
        {
            IQueryable<Employee> query = _db.Employees.Include(e => e.Shop).Include(e => e.Position)
                .OrderBy(e => e.Shop.Title).ThenBy(e => e.LastName).ThenBy(e => e.FirstName).ThenBy(e => e.Age);
            return query;
        }

        public IQueryable<Employee> SearchEmployees(string stringSearch)
        {
            var _db = new dbContext();
            IQueryable<Employee> query;
            if (int.TryParse(stringSearch, out var parsedNumber) == true && stringSearch.Length <= 2)
            {
                int number = Convert.ToInt32(stringSearch);
                query = _db.Employees.Include(e => e.Shop).Include(e => e.Position)
                    .Where(w => w.Age >= number)
                    .OrderBy(e => e.Shop.Title).ThenBy(e => e.LastName).ThenBy(e => e.FirstName).ThenBy(e => e.Age);
            }
            else
            {
                query = _db.Employees.Include(e => e.Shop).Include(e => e.Position)
                    .Where(w => w.LastName.Contains(stringSearch)
           || w.FirstName.Contains(stringSearch) || w.MiddleName.Contains(stringSearch)
           || w.Shop.Title.Contains(stringSearch) || w.Position.Title.Contains(stringSearch)
           || w.PhoneNumber.Contains(stringSearch) || w.InsurancePolicy.Contains(stringSearch)
           || w.Info.Contains(stringSearch))
                    .OrderBy(e => e.Shop.Title).ThenBy(e => e.LastName).ThenBy(e => e.FirstName).ThenBy(e => e.Age);
                return query;
            }
            return query;
        }

    }
}