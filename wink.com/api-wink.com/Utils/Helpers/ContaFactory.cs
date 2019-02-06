using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using api_wink.com.Models;
using System.Net.Http;
using System.Net;
using System.Web.Http;

namespace api_wink.com.Utils.Helpers
{
    public class ContaFactory
    {
        public Conta Create(Cliente target, JObject request)
        {
            if (request["tipoConta"].ToObject<TipoConta>().Equals(TipoConta.CC))
            {
                return new ContaCorrente(request["deposito"].ToObject<double>())
                {
                    Numero = (new Random()).Next(160000, 520000),
                    TipoConta = TipoConta.CC,
                    Cliente = target,
                    Movimentacao = new List<Movimentacao>()
                };
            }
            else if (request["tipoConta"].ToObject<TipoConta>().Equals(TipoConta.CP))
            {
                return new ContaPoupanca(request["deposito"].ToObject<double>())
                {
                    Numero = (new Random()).Next(100000, 990000),
                    TipoConta = TipoConta.CP,
                    Cliente = target
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