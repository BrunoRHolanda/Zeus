using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace wink.com.Repository
{
    public interface IRepository<T> : IDisposable
    {
        T GetById(int id);
        T[] GetAll();
        IQueryable<T> Query(Expression<Func<T, bool>> filter);
        void Save(T entity);
        void Delete(T entity);
    }
}
