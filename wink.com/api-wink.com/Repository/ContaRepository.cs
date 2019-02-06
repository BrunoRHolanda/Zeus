using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using api_wink.com.Models;

namespace api_wink.com.Repository
{
    public class ContaRepository : IContaRepository
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
        public ContaRepository(Utils.Helpers.Database context)
        {
            _context = context;
        }

        public Conta Delete(Conta entity)
        {
            Context.Conta.Remove(entity);

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

        public Conta[] GetAll()
        {
            return Context.Conta.ToArray();
        }

        public Conta GetById(int id)
        {
            return Query(c => c.Id == id).FirstOrDefault();
        }

        public IQueryable<Conta> Query(Expression<Func<Conta, bool>> filter)
        {
            return Context.Conta.Where(filter);
        }

        public Conta Save(Conta entity)
        {
            if (entity.Id == 0)
            {
                Context.Conta.Add(entity);
            }
            else
            {
                Context.Entry(entity).State = EntityState.Modified;
            }

            Commit();

            return entity;
        }

        private void Commit()
        {
            Context.SaveChanges();
            /*
            try
            {
                Context.SaveChanges();
            }

            catch (System.Data.Entity.Infrastructure.DbUpdateException e)
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Conta com dados duplicados !"))
                };

                throw new HttpResponseException(message);
            }*/
        }
    }
}