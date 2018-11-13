using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using wink.com.Models;

namespace wink.com.Repository
{
    public class ClienteRepository : IClienteRepository
    {
        private DB_winkEntities _context;

        private DB_winkEntities Context
        {
            get { return this._context; }

            set { this._context = value; }
        }

        public ClienteRepository()
        {
            this.Context = new DB_winkEntities();
        }

        public Cliente GetById(int id)
        {
            return this.Context.ClienteDefinir
                   .Where(s => s.id == id).FirstOrDefault();
        }

        public Cliente[] GetAll()
        {
            return this.Context.ClienteDefinir.ToArray();
        }

        public IQueryable<Cliente>Query(Expression<Func<Cliente, bool>> filter)
        {
            return this.Context.ClienteDefinir.Where(filter);
        }

        public void Save(Cliente cliente)
        {
            if (cliente.id == null)
            {
                this.Context.ClienteDefinir.Add(cliente);
            }

            this.Context.SaveChanges();
        }

        public void Delete(Cliente cliente)
        {
            this.Context.ClienteDefinir.Remove(cliente);
        }

        public void Dispose() 
        {
            if (this.Context != null)
            {
                this.Context.Dispose();
            }
            GC.SuppressFinalize(this);
        }
    }
}