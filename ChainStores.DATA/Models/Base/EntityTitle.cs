using System.ComponentModel.DataAnnotations;

namespace ChainStores.DATA.Models.Base
{
    public class EntityTitle: Entity
    {
        [Required(ErrorMessage = "The name must be specified")]
        public string Title { get; set; }
    }
}