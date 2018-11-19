using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using api_wink.com.Models;
using System.Data.Entity;

namespace api_wink.com.Repository
{
    public class EnderecoRepository : IEnderecoRepository
    {
        /**
         * Container para uma instância da base de dados Wink
         * 
         * */
        private Utils.Helpers.Database _context;

        /**
         * Propriedade para acessar a instância da base de dados
         * 
         * */
        private Utils.Helpers.Database Context
        {
            get { return this._context; }
        }

        /**
         * Cria uma instância da base de dados.
         * 
         * */
        public EnderecoRepository()
        {
            this._context = Utils.Helpers.Database.GetInstance();
        }
        public Endereco TrocarEnderecoEntrega(int id)
        {
            Endereco enderecoOld = this.Query(e => e.entrega == true).FirstOrDefault();

            enderecoOld.entrega = false;

            Endereco enderecoNew = this.GetById(id);

            enderecoNew.entrega = true;

            this.Save(enderecoOld);

            this.Save(enderecoNew);

            return enderecoNew;
        }

        public Endereco Delete(Endereco endereco)
        {
            return this.Context.Enderecos.Remove(endereco);
        }

        public void Dispose()
        {
            if (this.Context != null)
            {
                this.Context.Dispose();
            }
            GC.SuppressFinalize(this);
        }

        public Endereco[] GetAll()
        {
            return this.Context.Enderecos.ToArray();
        }

        public Endereco GetById(int id)
        {
            return this.Context.Enderecos.Where(e => e.Id == id).FirstOrDefault();
        }

        public Endereco GetEnderecoClientAtivo(int clienteId)
        {
            return this.Query(e => e.entrega == true &&
                e.Usuario.Id == clienteId).FirstOrDefault();
        }

        public IQueryable<Endereco> Query(Expression<Func<Endereco, bool>> filter)
        {
            return this.Context.Enderecos.Where(filter);
        }

        public Endereco Save(Endereco endereco)
        {
            if (endereco.Id == 0)
            {
                this.Context.Enderecos.Add(endereco);
            }
            else
            {
                this.Context.Entry(endereco).State = EntityState.Modified;
            }
            this.Context.SaveChanges();

            return endereco;
        }

        public IEnumerable<Endereco> GetAllEnderecoByClient(Usuario client)
        {
            return this.Query(e => e.Usuario.Equals(client)).ToArray();
        }
    }
}