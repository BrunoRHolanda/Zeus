
using api_wink.com.Repository;

namespace api_wink.com.Utils.Helpers
{
    public interface IRepository
    {
        IClienteRepository Cliente { get; }
        IContaRepository Conta { get; }
        IMovimentacaoRepository Movimentacao { get; }
    }
}
