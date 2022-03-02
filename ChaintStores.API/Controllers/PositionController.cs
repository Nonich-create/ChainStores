using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using ChaintStores.API.App_Start;
using ChaintStores.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{

    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PositionController : ApiController
    {
        private dbContext _db;
        private IPositionRepository _positionRepository;
        PositionController()
        {
            _db = new dbContext();
            _positionRepository = new PositionRepository(_db);
        }

        [HttpGet, Route("GetPositionAll"), ActionName("GetPositionAll")]
        public IEnumerable<Position> GetAll()
        {
           return  _positionRepository.GetAll().OrderBy(p => p.Title).ThenBy(p => p.Salary); 
        }
       
        [HttpGet,  ActionName("Get")]
        public async Task<Position> GetAsync(Guid id)
        {
           return await _positionRepository.FindAsync(id);
        }
        
        [HttpGet, Route("GetPositions"), ActionName("GetPositions")]
        public IEnumerable<string> GetPositions()
        {
            return _positionRepository.GetPositions();
        }
        
        [HttpGet, ActionName("SearchPositions")]
        public IQueryable<Position> SearchPositions(string stringSearch)
        {
            return _positionRepository.SearchPositions(stringSearch);
        }

        [HttpPost, Route("AddPosition"), ActionName("AddPosition")]
        public void Add([FromBody] PositionView value)
        {
            _positionRepository.Add(value.ToPosition());
        }

        [HttpPut, Route("UpdatePosition"), ActionName("UpdatePosition")]
        public void Update([FromBody] PositionView value)
        {
                _positionRepository.Update(value.ToPosition());
        }
        
        [HttpDelete, Route("DeletePosition"), ActionName("Delete")]
        public void Delete(Guid id)
        {
            _positionRepository.Delete(id);
        }
    }
}   