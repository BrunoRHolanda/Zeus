//------------------------------------------------------------------------------
// <auto-generated>
//    O código foi gerado a partir de um modelo.
//
//    Alterações manuais neste arquivo podem provocar comportamento inesperado no aplicativo.
//    Alterações manuais neste arquivo serão substituídas se o código for gerado novamente.
// </auto-generated>
//------------------------------------------------------------------------------

namespace wink.com.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Endereco
    {
        public int id { get; set; }
        public string cep { get; set; }
        public string uf { get; set; }
        public string cidade { get; set; }
        public string bairro { get; set; }
        public string rua { get; set; }
        public int numero { get; set; }
        public string complemento { get; set; }
        public bool entrega { get; set; }
    
        public virtual Cliente Cliente { get; set; }
    }
}
