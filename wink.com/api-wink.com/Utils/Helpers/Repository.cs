using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using api_wink.com.Repository;

namespace api_wink.com.Utils.Helpers
{
    public class Repository : IRepository
    {
        private Database _context;

        private Database Context
        {
            get { return this._context; }

            set { this._context = value; }
        }
        
        public IClienteRepository Cliente
        {
            get { return new ClienteRepository(Context); }
        }

        public IContaRepository Conta
        {
            get { return new ContaRepository(Context); }
        }

        public IMovimentacaoRepository Movimentacao
        {
            get { return new MovimentacaoRepository(Context); }
        }

        public Repository(Database context)
        {
            this.Context = context;
        }
    }
}