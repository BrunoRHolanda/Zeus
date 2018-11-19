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
         * Instância para o repositório de enderecos
         * 
         */
        private readonly IEnderecoRepository enderecoRepository;

        private readonly IUsuarioRepository usuarioRepository;

        /**
         * Auto Injeta uma instância para o repositório de enderecos
         * 
         * @param IEnderecoRepository enderecoRepository
         * 
         */
        public EnderecoController(IEnderecoRepository enderecoRepository, IUsuarioRepository usuarioRepository)
        {
            this.enderecoRepository = enderecoRepository;

            this.usuarioRepository = usuarioRepository;
        }

        [HttpGet]
        [Route("me")]
        public IEnumerable<Endereco> GetAllUsuarioEndereco()
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            Usuario client = this.usuarioRepository.GetClienteByEmail(email);

            return this.enderecoRepository.GetAllEnderecoByClient(client);
        }

        [HttpPost]
        [Route("add")]
        public Endereco store(Endereco endereco)
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            Usuario client = this.usuarioRepository.GetClienteByEmail(email);

            endereco.Usuario = client;

            this.enderecoRepository.Save(endereco);

            return endereco;
        }
    }
}
