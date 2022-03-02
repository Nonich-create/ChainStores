using ChainStores.DATA.Models.Base;
using System.ComponentModel.DataAnnotations;

namespace ChainStores.DATA.Models
{
    public class ProductManufacturer : EntityTitle
    {
        [Required(ErrorMessage = "The country must be specified")]
        public string Country { get; set; }
        public string Address { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
 
}