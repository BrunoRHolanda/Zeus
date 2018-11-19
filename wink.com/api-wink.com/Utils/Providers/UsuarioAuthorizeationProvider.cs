using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
using System.Threading.Tasks;

using api_wink.com.Services;
using api_wink.com.Models;

namespace api_wink.com.Utils.Providers
{
    public class UsuarioAuthorizeationProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            Usuario usuario = UsuarioAuthentication.Login(context.UserName, context.Password);
            if (usuario != null)
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("sub", context.UserName));
                identity.AddClaim(new Claim(ClaimTypes.Name, usuario.email));
                identity.AddClaim(new Claim(ClaimTypes.Role, usuario.role.ToString()));
                context.Validated(identity);
            }
            else
            {
                context.SetError("acesso inválido", "As credenciais do usuário não conferem....");
                return;
            }
        }
    }
}