using System;

using api_wink.com.Models;
using System.Collections.Generic;

namespace api_wink.com.Repository
{
    public interface IEnderecoRepository : IRepository<Endereco>, IDisposable
    {
        Endereco GetEnderecoClientAtivo(int clienteId);

        Endereco TrocarEnderecoEntrega(int id);

        IEnumerable<Endereco> GetAllEnderecoByClient(Usuario client); 
    }
}
