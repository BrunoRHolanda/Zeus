using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace api_wink.com.Repository
{
    public interface IRepository<T>
    {
        T GetById(int id);
        T[] GetAll();
        IQueryable<T> Query(Expression<Func<T, bool>> filter);
        T Save(T entity);
        T Delete(T entity);
    }
}
