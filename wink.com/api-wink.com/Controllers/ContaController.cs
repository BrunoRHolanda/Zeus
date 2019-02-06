using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json.Linq;

using api_wink.com.Models;
using api_wink.com.Utils.Helpers;
using System;

namespace api_wink.com.Controllers
{
    [Authorize]
    [RoutePrefix("api/conta")]
    public class ContaController : ApiController
    {
        /**
         * Instância para o repositório de usuários
         * 
         */
        private readonly Utils.Helpers.IRepository _repository;

        private Utils.Helpers.IRepository Repository
        {
            get { return this._repository; }
        }

        /**
         * Auto Injeta uma instância para o repositório de usuários
         * 
         * @param IUsuarioRepository usuarioRepository
         * 
         */
        public ContaController(Utils.Helpers.IRepository repository)
        {
            this._repository = repository;
        }

        // POST: api/conta/add
        [HttpPost]
        [Route("add")]
        public Conta Add(JObject request)
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            Cliente cliente = Repository.Cliente.GetByLogin(login);

            ContaFactory contaFactory = new ContaFactory();

            Conta conta = contaFactory.Create(cliente, request);
            
            conta = Repository.Conta.Save(conta);

            Movimentacao movimentacao = new Movimentacao()
            {
                Conta = conta,
                Saldo = conta.Saldo,
                TipoMovimento = TipoMovimento.DEPOSITO,
                Valor = request["deposito"].ToObject<double>(),
                Data = DateTime.Now
            };

            Repository.Movimentacao.Save(movimentacao);

            return conta;
        }

        // PUT: api/conta/8/sacar/10
        [HttpPut]
        [Route("{id}/sacar/{valor}")]
        public Conta Sacar(string id, double valor)
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            Cliente cliente = Repository.Cliente.GetByLogin(login);

            Conta conta = Repository.Conta.GetById(Convert.ToInt32(id));

            conta.Sacar(valor);

            Repository.Conta.Save(conta);

            Movimentacao movimentacao = new Movimentacao()
            {
                Conta = conta,
                Saldo = conta.Saldo,
                TipoMovimento = TipoMovimento.SAQUE,
                Valor = valor,
                Data = DateTime.Now
            };

            Repository.Movimentacao.Save(movimentacao);

            return conta;
        }

        // PUT: api/conta/8/depositar/10
        [HttpPut]
        [Route("{id}/depositar/{valor}")]
        public Conta Depositar(string id, double valor)
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            Cliente cliente = Repository.Cliente.GetByLogin(login);

            Conta conta = Repository.Conta.GetById(Convert.ToInt32(id));

            conta.Depositar(valor);

            Repository.Conta.Save(conta);

            Movimentacao movimentacao = new Movimentacao()
            {
                Conta = conta,
                Saldo = conta.Saldo,
                TipoMovimento = TipoMovimento.DEPOSITO,
                Valor = valor,
                Data = DateTime.Now
            };

            Repository.Movimentacao.Save(movimentacao);

            return conta;
        }

        // PUT: api/conta/8/transferir/10/250
        [HttpPut]
        [Route("{idSacado}/transferir/{idBeneficiado}/{valor}")]
        public Conta Transferir(string idSacado, string idBeneficiado, double valor)
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            Cliente cliente = Repository.Cliente.GetByLogin(login);

            Conta sacado = Repository.Conta.GetById(Convert.ToInt32(idSacado));

            Conta beneficiado = Repository.Conta.GetById(Convert.ToInt32(idBeneficiado));

            sacado.Transferir(valor, beneficiado);

            Repository.Conta.Save(sacado);

            Repository.Conta.Save(beneficiado);

            Movimentacao movimentacaoSacado = new Movimentacao()
            {
                Conta = sacado,
                Saldo = sacado.Saldo,
                TipoMovimento = TipoMovimento.TRANSFERENCIA,
                Valor = valor,
                Data = DateTime.Now
            };

            Movimentacao movimentacaoBeneficiado = new Movimentacao()
            {
                Conta = beneficiado,
                Saldo = beneficiado.Saldo,
                TipoMovimento = TipoMovimento.DEPOSITO,
                Valor = valor,
                Data = DateTime.Now
            };

            Repository.Movimentacao.Save(movimentacaoSacado);

            Repository.Movimentacao.Save(movimentacaoBeneficiado);

            return sacado;
        }

        // GET: api/conta/1/extrato
        [HttpGet]
        [Route("{id}/extrato")]
        public ICollection<Movimentacao> Extrato(string id)
        {
            Conta conta = Repository.Conta.GetById(Convert.ToInt32(id));

            return conta.Movimentacao;
        }

        // POST: api/conta/1/remover
        [HttpDelete]
        [Route("{id}/remover")]
        public Conta Remover(string id)
        {
            string login = ControllerContext.RequestContext.Principal.Identity.Name;

            Cliente cliente = Repository.Cliente.GetByLogin(login);

            Conta conta = Repository.Conta.GetById(Convert.ToInt32(id));

            Repository.Conta.Delete(conta);

            return conta;
        }
    }
}
