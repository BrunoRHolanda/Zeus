using api_wink.com.Models;
using System.Collections.Generic;

namespace api_wink.com.Repository
{
    public interface IMovimentacaoRepository : IRepository<Movimentacao>
    {
        ICollection<Movimentacao> GetMovimentacoes(Conta conta);
    }
}
