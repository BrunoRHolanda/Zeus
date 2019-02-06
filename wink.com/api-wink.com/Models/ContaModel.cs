using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_wink.com.Models
{
    public partial class Conta
    {
        public Conta(double valor)
        {
            if (valor >= 150)
            {
                Depositar(valor);
            }
            else
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Valor de abertura menor que 150 reais !"))
                };

                throw new HttpResponseException(message);
            }
        }

        public virtual void Depositar(double valor)
        {
            if (valor > 0)
            {
                Saldo += valor;
            }
            else
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Valor de depósito inválido"))
                };

                throw new HttpResponseException(message);
            }
        }

        public virtual void Sacar(double valor)
        {
            double novoSaldo = Saldo - valor;

            if (valor > 0 && novoSaldo >= 0)
            {
                Saldo = novoSaldo;
            }
            else if (valor <= 0)
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Valor de saque inválido"))
                };

                throw new HttpResponseException(message);
            }
            else if (novoSaldo < 0)
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Saldo Insuficiênte"))
                };

                throw new HttpResponseException(message);
            }
        }

        public virtual void Transferir(double valor, Conta beneficiado)
        {
            Sacar(valor);

            beneficiado.Depositar(valor);
        }
    }
}