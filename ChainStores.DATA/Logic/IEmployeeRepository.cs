﻿using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IEmployeeRepository : IRepository<Employee>
    {
        IQueryable<Employee> GetEmployees();
        IQueryable<Employee> SearchEmployees(string stringSearch);
    }
}
