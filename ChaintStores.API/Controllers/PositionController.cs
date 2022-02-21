using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API.Controllers
{
    [EnableCors(origins: "https://localhost:44346", headers: "*", methods: "*")]
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

        [HttpGet, Route("AddPosition"), ActionName("AddPosition")]
        public void Add(string title, string jobDescriptions, string info, string code, double salary)
        {
            if (!string.IsNullOrEmpty(title))
            {
                Position position = new Position()
                {
                    Title = title,
                    JobDescriptions = jobDescriptions,
                    Info = info,
                    CodePosition = code,
                    Salary = salary
                };
                _positionRepository.AddAsync(position);
            }
        }

        [HttpGet, Route("UpdatePosition"), ActionName("UpdatePosition")]
        public void Update(string title, string jobDescriptions, string info, string code, double salary,string Id)
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(title))
            {
                Position position = new Position()
                {
                    Id = new Guid(Id),
                    Title = title,
                    JobDescriptions = jobDescriptions,
                    Info = info,
                    CodePosition = code,
                    Salary = salary
                };
                _positionRepository.UpdateAsync(position);
            }
         }
        
        [HttpDelete, Route("DeletePosition"), ActionName("Delete")]
        public void Delete(Guid id)
         {
             _positionRepository.DeleteAsync(id);
         }
    }
}   