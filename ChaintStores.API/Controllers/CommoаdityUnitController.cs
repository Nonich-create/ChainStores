using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [EnableCors(origins: "https://localhost:44346", headers: "*", methods: "*")]
    public class CommoаdityUnitController : ApiController
    {
        private dbContext _db;
        private ICommoаdityUnitRepository _commoаdityUnitRepository;
        CommoаdityUnitController()
        {
            _db = new dbContext();
            _commoаdityUnitRepository = new CommoаdityUnitRepository(_db);
        }

        [HttpGet, Route("GetCommoаdityUnitAll"), ActionName("GetCommoаdityUnitAll")]
        public IEnumerable<CommoаdityUnit> GetAll()
        {
            return _commoаdityUnitRepository.GetAll();
        }

        [HttpGet, Route("GetCommoаdityUnit"), ActionName("GetCommoаdityUnit")]
        public IEnumerable<string> GetCommoаdityUnit()
        {
            return _commoаdityUnitRepository.GetCommoаdityUnit();
        }

    }
}