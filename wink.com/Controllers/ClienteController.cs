using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using wink.com.Repository;
using wink.com.Models;

namespace wink.com.Controllers
{
    public class ClienteController : ApiController
    {
        readonly IClienteRepository _clienteRepository;

        public ClienteController() { }

        public ClienteController(IClienteRepository clienteRepository)
        {
            this._clienteRepository = clienteRepository;
        }

        // GET api/cliente
        public IEnumerable<Cliente> Get()
        {
            return this._clienteRepository.GetAll();
        }

        // GET api/cliente/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/cliente
        public void Post([FromBody]string value)
        {
        }

        // PUT api/cliente/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/cliente/5
        public void Delete(int id)
        {
        }
    }
}
