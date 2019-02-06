using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

using api_wink.com.Models;

namespace api_wink.com.Utils.Helpers
{
    public class ClienteFactory
    {
        public Cliente Create(JObject request)
        {
            if (request["tipoCliente"].ToObject<TipoCliente>().Equals(TipoCliente.PF))
            {
                return new ClienteFisico()
                {
                    Cpf = request["cpf"].ToString(),
                    Nome = request["nome"].ToString(),
                    Login = request["login"].ToString(),
                    Senha = request["senha"].ToString(),
                    TipoCliente = TipoCliente.PF
                };
            }
            else if (request["tipoCliente"].ToObject<TipoCliente>().Equals(TipoCliente.PJ))
            {
                return new ClienteJuridico()
                {
                    Cnpj = request["cnpj"].ToString(),
                    Nome = request["nome"].ToString(),
                    Login = request["login"].ToString(),
                    Senha = request["senha"].ToString(),
                    TipoCliente = TipoCliente.PJ
                };
            }

            HttpResponseMessage message = new HttpResponseMessage()
            {
                StatusCode = HttpStatusCode.BadRequest,
                Content = new StringContent(string.Format("Tipo de cliente inválido !"))
            };

            throw new HttpResponseException(message);
        }
    }
}