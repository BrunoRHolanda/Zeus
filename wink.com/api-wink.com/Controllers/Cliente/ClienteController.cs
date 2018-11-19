using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using api_wink.com.Repository;
using api_wink.com.Models;

namespace api_wink.com.Controllers
{
    /**
     * Mantem os dados do usuário
     * 
     */
     [RoutePrefix("api/client")]
    public class ClienteController : ApiController
    {

        /**
         * Instância para o repositório de usuários
         * 
         */
        private readonly IUsuarioRepository usuarioRepository;

        /**
         * Auto Injeta uma instância para o repositório de usuários
         * 
         * @param IUsuarioRepository usuarioRepository
         * 
         */
        public ClienteController(IUsuarioRepository usuarioRepository)
        {
            this.usuarioRepository = usuarioRepository;
        }

        [Authorize(Roles = "Cliente")]
        [HttpGet]
        [Route("profiles/me")]
        public Usuario MyProfile()
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            return this.usuarioRepository.GetClienteByEmail(email);
        }

        // POST: api/client/profiles/add
        [HttpPost]
        [Route("profiles/add")]
        public Usuario AddProfile(Usuario novo)
        {
            if (novo.role == Role.Administrador)
            {
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            }

            this.usuarioRepository.Save(novo);

            return novo;
        }

        // PUT: api/client/profiles/update/5
        [Authorize(Roles = "Cliente")]
        [HttpPut]
        [Route("profiles/update")]
        public Usuario UpdateProfile(Usuario usuario)
        {
            if (usuario.role != Role.Cliente)
            {
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            }

            this.usuarioRepository.Save(usuario);

            return usuario;
        }

        // DELETE: api/client/usuario/5
        [Authorize(Roles = "Cliente")]
        [HttpDelete]
        [Route("profiles/delete")]
        public Usuario Delete(int id)
        {
            string email = ControllerContext.RequestContext.Principal.Identity.Name;

            Usuario u = this.usuarioRepository.GetClienteByEmail(email);

            this.usuarioRepository.Delete(u);

            return u;
        }
    }
}
