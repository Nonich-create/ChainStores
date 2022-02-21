using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChainStores.DATA.Logic
{
    public interface IRepository<T> where T : class
    {
         void Update(T entity);
         void Delete(Guid id);
         T Find(Guid Id);
         void Add(T entity);
         IQueryable<T> GetAll();

        Task UpdateAsync(T entity);
        Task AddAsync(T entity);
        Task <T> FindAsync(Guid Id);
        Task DeleteAsync(Guid id);
    }
}
