using api_wink.com.Models;
using api_wink.com.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_wink.com.Controllers.Admin
{

    /**
     * Mantem os dados do administrador
     * 
     */
    [Authorize(Roles = "Administrador")]
    [RoutePrefix("api/admin")]
    public class AdministradorController : ApiController
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
        public AdministradorController(Utils.Helpers.IRepository repository)
        {
            this._repository = repository;
        }

        // GET: api/admin/profiles/admins/all
        [Route("profiles/admins/all")]
        [HttpGet]
        public IEnumerable<Usuario> GetAllAdminsProfiles()
        {
            return Repository.Usuario.GetAdministradores();
        }

        // GET: api/admin/profiles/admins/5
        [Route("profiles/admins/{id}")]
        [HttpGet]
        public Usuario GetAdminProfile(int id)
        {
            Usuario administrador = Repository.Usuario.GetAdmin(id);

            if (administrador == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return administrador;
        }

        // POST: api/admin/profiles/add
        [HttpPost]
        [Route("profiles/add")]
        public Usuario AddAdminProfile(Usuario novo)
        {

            if (novo.role == Role.Cliente)
            {
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            }

            Repository.Usuario.Save(novo);

            return novo;
        }
    }
}
