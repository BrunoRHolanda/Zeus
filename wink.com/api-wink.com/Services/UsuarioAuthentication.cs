using System.Linq;


using api_wink.com.Repository;
using api_wink.com.Models;
using System.Web.Http;
using System.Net;
using System.Net.Http;

namespace api_wink.com.Services
{
    public class UsuarioAuthentication
    {
        public static Cliente Login(string login, string senha)
        {
            IClienteRepository clienteRepository = 
                new ClienteRepository(new Utils.Helpers.Database());

            Cliente cliente =
                clienteRepository.Query(c => c.Login.Equals(login) &&
                    c.Senha.Equals(senha)).FirstOrDefault();

            return cliente;
        }
    }
}