using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

using api_wink.com.Models;

namespace api_wink.com.Repository
{

    /**
     * Mantem os dados do usuário
     * 
     * */
    public class UsuarioRepository : IUsuarioRepository
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
        public UsuarioRepository()
        {
            this._context = Utils.Helpers.Database.GetInstance();
        }

        /**
         * Retorna verdadeiro ou falso de arcordo com a pesquisa.
         * 
         * @param Expression<Func<Entity, bool>> filter
         * 
         * return boolean
         * 
         * */
        public bool Any(Expression<Func<Usuario, bool>> filter)
        {
            return this.Context.Usuarios.Any(filter);
        }

        /**
         * Remove um dado usuário da base de dados.
         * 
         * @param Usuario usuario
         * 
         * @retrun Usuario
         * 
         * */
        public Usuario Delete(Usuario usuario)
        {
            return this.Context.Usuarios.Remove(usuario);
        }

        /**
         * Finaliza a conexão com o banco de dados.
         * 
         * return void
         * 
         * */
        public void Dispose()
        {
            if (this.Context != null)
            {
                this.Context.Dispose();
            }
            GC.SuppressFinalize(this);
        }

        /**
         * Retorna todos os usuários cadastrados
         * 
         * return Array Usuario
         * 
         * */
        public Usuario[] GetAll()
        {
            return this.Context.Usuarios.ToArray();
        }

        /**
         * Encontra um usuário pelo seu ID.
         * 
         * return Usuario
         * */
        public Usuario GetById(int id)
        {
            return this.Context.Usuarios.Where(user => user.Id == id).FirstOrDefault();
        }

        /**
         * Realiza uma consulta na tabela usuários
         * 
         * @param Expression<Func<Entity, bool>> filter
         * 
         * return IQueryable<Usuario>
         * 
         * */
        public IQueryable<Usuario> Query(Expression<Func<Usuario, bool>> filter)
        {
            return this.Context.Usuarios.Where(filter);
        }

        /**
         * Salva um usuário no banco de dados
         * 
         * @param Usuario usuario
         * 
         * @return Usuario
         * 
         * */
        public Usuario Save(Usuario usuario)
        {
            if (usuario.Id == 0)
            {
                this.Context.Usuarios.Add(usuario);
            }
            this.Context.SaveChanges();

            return usuario;
        }

        public IEnumerable<Usuario> GetAdministradores()
        {
            return this.Query(u => u.role == Role.Administrador).ToArray();
        }

        public Usuario GetAdmin(int id)
        {
            return this.Query(u => u.Id == id && 
                u.role == Role.Administrador).FirstOrDefault();
        }

        public Usuario GetClienteByEmail(string email)
        {
            return this.Query(u => u.email.Equals(email) &&
                u.role == Role.Cliente).FirstOrDefault();
        }

        public Usuario GetAdministradorById(int id)
        {
            return this.Query(u => u.Id == id && u.role == Role.Administrador).FirstOrDefault();
        }
    }
}