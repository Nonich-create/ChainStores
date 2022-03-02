using ChainStores.DATA;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace ChainStores.DATA.Logic
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly dbContext _db;
        private bool disposed = false;

        public Repository(dbContext db)
        {
            _db = db ?? throw new ArgumentNullException(nameof(db));
        }

        public async Task UpdateAsync(T entity)
        {
            _db.Entry<T>(entity).State = EntityState.Modified;
            await _db.SaveChangesAsync();
        }

        public void Update(T entity)
        {
            _db.Entry<T>(entity).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public async Task DeleteAsync(Guid id)
        {
            var entity = await _db.Set<T>().FindAsync(id);
            _db.Set<T>().Remove(entity);
            await _db.SaveChangesAsync();
        }

        public void Delete(Guid id)
        {
            var entity = _db.Set<T>().Find(id);
            _db.Set<T>().Remove(entity);
            _db.SaveChanges();
        }

        public async Task<T> FindAsync(Guid Id)
        {
            var query = await _db.Set<T>().FindAsync(Id);
            return query;
        }

        public T Find(Guid Id)
        {
            var query = _db.Set<T>().Find(Id);
            return query;
        }


        public async Task AddAsync(T entity)
        {
            _db.Set<T>().Add(entity);
            await _db.SaveChangesAsync();
        }

        public void Add(T entity)
        {
            _db.Set<T>().Add(entity);
            _db.SaveChanges();
        }

        public IQueryable<T> GetAll()
        {
            IQueryable<T> query = _db.Set<T>();
            return query;
        }

        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


    }
}
 
 