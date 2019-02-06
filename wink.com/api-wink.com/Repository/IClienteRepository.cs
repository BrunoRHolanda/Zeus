using api_wink.com.Models;

namespace api_wink.com.Repository
{
    public interface IClienteRepository : IRepository<Cliente>
    {
        Cliente GetByLogin(string login);
    }
}
