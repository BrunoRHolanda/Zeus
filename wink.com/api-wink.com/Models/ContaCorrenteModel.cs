using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_wink.com.Models
{
    public partial class ContaCorrente
    {
        public ContaCorrente()
        {
            //
        }

        public ContaCorrente(double valor) : base(valor)
        {
            TipoConta = TipoConta.CC;
        }

        public override void Sacar(double valor)
        {
            double saldoDescontato = Saldo * (1 - 0.015);
            double novoSaldo = saldoDescontato - valor;

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

        public override void Transferir(double valor, Conta beneficiado)
        {
            Sacar(valor);

            beneficiado.Depositar(valor);
        }
    }
}