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
        
        public IUsuarioRepository Usuario
        {
            get { return new UsuarioRepository(this.Context); }
        }

        public IEnderecoRepository Endereco
        {
            get { return new EnderecoRepository(this.Context); }
        }

        public Repository(Database context)
        {
            this.Context = context;
        }
    }
}