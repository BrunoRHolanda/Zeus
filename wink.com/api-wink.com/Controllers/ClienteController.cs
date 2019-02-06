using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json.Linq;

using api_wink.com.Models;
using api_wink.com.Utils.Helpers;


namespace api_wink.com.Controllers
{
    [RoutePrefix("api/cliente")]
    public class ClienteController : ApiController
    {
        /**
         * Instância para o repositório de usuários
         * 
         */
        private readonly Utils.Helpers.IRepository _repository;

        private Utils.Helpers.IRepository Repository
        {
            get { return this._repository; }
        }

        /**
         * Auto Injeta uma instância para o repositório de usuários
         * 
         * @param IUsuarioRepository usuarioRepository
         * 
         */
        public ClienteController(Utils.Helpers.IRepository repository)
        {
            this._repository = repository;
        }

        // GET: api/cliente/todos
        [Route("todos")]
        [HttpGet]
        public IEnumerable<Cliente> GetAll()
        {
            return Repository.Cliente.GetAll();
        }

        // POST: api/cliente/add
        [HttpPost]
        [Route("add")]
        public Cliente Add(JObject request)
        {
            ClienteFactory clienteFactory = new ClienteFactory();

            Cliente novo = clienteFactory.Create(request);

            novo.ValidarCliente();

            novo = Repository.Cliente.Save(novo);

            return novo;
        }

        // GET: api/cliente/perfil
        [Authorize]
        [HttpGet]
        [Route("perfil")]
        public Cliente Perfil()
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            return Repository.Cliente.GetByLogin(login);
        }
    }
}
