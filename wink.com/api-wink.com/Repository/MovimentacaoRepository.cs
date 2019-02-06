using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using api_wink.com.Models;

namespace api_wink.com.Repository
{
    public class MovimentacaoRepository : IMovimentacaoRepository
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
        public MovimentacaoRepository(Utils.Helpers.Database context)
        {
            _context = context;
        }

        public Movimentacao Delete(Movimentacao entity)
        {
            Context.Movimentacao.Remove(entity);

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

        public Movimentacao[] GetAll()
        {
            return Context.Movimentacao.ToArray();
        }

        public Movimentacao GetById(int id)
        {
            return Query(m => m.Id == id).FirstOrDefault();
        }

        public IQueryable<Movimentacao> Query(Expression<Func<Movimentacao, bool>> filter)
        {
            return Context.Movimentacao.Where(filter);
        }

        public Movimentacao Save(Movimentacao entity)
        {
            if (entity.Id == 0)
            {
                Context.Movimentacao.Add(entity);
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

        public ICollection<Movimentacao> GetMovimentacoes(Conta conta)
        {
            return Query(m => m.Conta.Id.Equals(conta.Id)).ToArray();
        }
    }
}