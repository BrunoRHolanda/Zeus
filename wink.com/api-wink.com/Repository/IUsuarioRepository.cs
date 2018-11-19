using System;
using System.Linq.Expressions;
using System.Collections.Generic;

using api_wink.com.Models;


namespace api_wink.com.Repository
{
    public interface IUsuarioRepository : IRepository<Usuario>, IDisposable
    {
        bool Any(Expression<Func<Usuario, bool>> filter);

        Usuario GetClienteByEmail(string email);

        Usuario GetAdministradorById(int id);

        IEnumerable<Usuario> GetAdministradores();

        Usuario GetAdmin(int id);
    }
}
