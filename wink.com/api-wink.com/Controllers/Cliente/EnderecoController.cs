using api_wink.com.Models;
using api_wink.com.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_wink.com.Controllers.Cliente
{
    [RoutePrefix("api/client/profiles/enderecos")]
    [Authorize(Roles = "Cliente")]
    public class EnderecoController : ApiController
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
         * Auto Injeta uma instância para o repositório de enderecos
         * 
         * @param IEnderecoRepository enderecoRepository
         * 
         */
        public EnderecoController(Utils.Helpers.IRepository repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        [Route("me")]
        public IEnumerable<Endereco> GetAllUsuarioEndereco()
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            Usuario client = Repository.Usuario.GetClienteByEmail(email);

            return Repository.Endereco.GetAllEnderecoByClient(client);
        }

        [HttpPost]
        [Route("add")]
        public Endereco store(Endereco endereco)
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            Usuario client = Repository.Usuario.GetClienteByEmail(email);

            endereco.Usuario = client;

            Repository.Endereco.Save(endereco);

            return endereco;
        }
    }
}
