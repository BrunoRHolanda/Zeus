using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json;
using Owin;
using System;
using System.Web.Http;
using Unity;
using Unity.Lifetime;

using api_wink.com.Utils.Providers;

[assembly: OwinStartup(typeof(api_wink.com.Startup))]

namespace api_wink.com
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // configuracao WebApi
            var config = new HttpConfiguration();

            // configurando rotas
            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
                  name: "DefaultApi",
                  routeTemplate: "api/{controller}/{id}",
                  defaults: new { id = RouteParameter.Optional }
             );

            // Criação do container
            var container = new UnityContainer();

            // Mapeamento de dependências
            container.RegisterType
                <Utils.Helpers.IRepository, Utils.Helpers.Repository>(
                    new HierarchicalLifetimeManager());


            // configuração da instância do resolver
            config.DependencyResolver = new Utils.Helpers.UnityResolver(container);

            // ativando cors
            app.UseCors(CorsOptions.AllowAll);
            
            // configurando json formater
            config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling
                = ReferenceLoopHandling.Ignore;

            // ativando a geração do token
            AtivarGeracaoTokenAcesso(app);

            // ativando configuração WebApi
            app.UseWebApi(config);
        }

        private void AtivarGeracaoTokenAcesso(IAppBuilder app)
        {
            var opcoesConfiguracaoToken = new OAuthAuthorizationServerOptions()
            {
                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString("/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromHours(1),
                Provider = new UsuarioAuthorizeationProvider()
            };
            app.UseOAuthAuthorizationServer(opcoesConfiguracaoToken);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}
