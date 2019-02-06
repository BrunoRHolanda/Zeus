using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_wink.com.Models
{
    public partial class ContaPoupanca
    {
        public ContaPoupanca()
        {
            //
        }

        public ContaPoupanca(double valor): base(valor)
        {
            TipoConta = TipoConta.CP;
        }

        public override void Sacar(double valor)
        {
            double limite = Saldo * 0.4;

            double novoSaldo = Saldo - valor;

            if (valor > 0 && novoSaldo >= 0 && valor <= limite)
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
                    Content = new StringContent(string.Format("Saldo insuficiênte"))
                };

                throw new HttpResponseException(message);
            }
            else if (valor > limite)
            {
                HttpResponseMessage message = new HttpResponseMessage()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Content = new StringContent(string.Format("Valor acima do limite permitido de 40%"))
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