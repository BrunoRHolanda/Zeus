using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using api_wink.com.Repository;
using api_wink.com.Models;

namespace api_wink.com.Services
{
    public class UsuarioAuthentication
    {
        public static Usuario Login(string email, string senha)
        {
            IUsuarioRepository usuarioRepository = 
                new UsuarioRepository(new Utils.Helpers.Database());

            Usuario usuario = 
                usuarioRepository.Query(u => u.email.Equals(email) &&
                    u.senha.Equals(senha)).FirstOrDefault();

            return usuario;
        }
    }
}