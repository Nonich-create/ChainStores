using ChainStores.DATA.Models.Base;
using System.ComponentModel.DataAnnotations;


namespace ChainStores.DATA.Models
{
    public class ProductCategory: EntityTitle
    {
        [Required(ErrorMessage = "The code must be specified"), StringLength(6)]
        public string Code { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
}