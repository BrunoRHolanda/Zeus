
using api_wink.com.Repository;

namespace api_wink.com.Utils.Helpers
{
    public interface IRepository
    {
        IUsuarioRepository Usuario { get; }

        IEnderecoRepository Endereco { get; }
    }
}
