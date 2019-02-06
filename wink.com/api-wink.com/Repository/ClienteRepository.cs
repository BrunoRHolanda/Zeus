using System;
using System.Linq;
using System.Linq.Expressions;
using api_wink.com.Models;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Net;

namespace api_wink.com.Repository
{
    public class ClienteRepository : IClienteRepository
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
            get { return _context; }
        }

        /**
         * Cria uma instância da base de dados.
         * 
         * */
        public ClienteRepository(Utils.Helpers.Database context)
        {
            _context = context;
        }

        public Cliente GetById(int id)
        {
            return Query(c => c.Id == id).FirstOrDefault();
        }

        public Cliente[] GetAll()
        {
            return Context.Cliente.ToArray();
        }

        public IQueryable<Cliente> Query(Expression<Func<Cliente, bool>> filter)
        {
            return Context.Cliente.Where(filter);
        }

        public Cliente Save(Cliente entity)
        {
            if (entity.Id == 0)
            {
                Context.Cliente.Add(entity);
            }
            else
            {
                Context.Entry(entity).State = EntityState.Modified;
            }


            Commit();

            return entity;
        }

        public Cliente Delete(Cliente entity)
        {
            Context.Cliente.Remove(entity);

            Commit();

            return entity;
        }

        public void Dispose()
        {
            if (Context != null)
            {
                Context.Dispose();
            }

            GC.SuppressFinalize(this);
        }

        private void Commit()
        {
            try
            {
                Context.SaveChanges();
            }
            catch (System.Data.Entity.Infrastructure.DbUpdateException e)
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Cliente com dados duplicados !"))
                };

                throw new HttpResponseException(message);
            }
        }

        public Cliente GetByLogin(string login)
        {
            return Query(c => c.Login.Equals(login)).FirstOrDefault();
        }
    }
}