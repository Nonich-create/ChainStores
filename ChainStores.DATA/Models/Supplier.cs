using ChainStores.DATA.Models.Base;
using System.ComponentModel.DataAnnotations;

namespace ChainStores.DATA.Models
{  
    public class Supplier : EntityTitle
    {
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
        [Required(ErrorMessage = "The address must be specified"), StringLength(1000), Display(Name = "Address"), DataType(DataType.MultilineText)]
        public string Adress { get; set; }
        [Required(ErrorMessage = "The phone number must be specified"), StringLength(100), Display(Name = "Phone Number")]
        [RegularExpression(@"^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$", ErrorMessage = "Incorrectly entered phone number +375 12 345-67-89")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "The email must be specified"), StringLength(100), Display(Name = "Email")]
       // [RegularExpression(@"^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$", ErrorMessage = "Incorrectly entered email exaple nick@mail.com")]
        public string Email { get; set; }
        [Required(ErrorMessage = "The country must be specified"), StringLength(100), Display(Name = "Country")]
        public string Country { get; set; }
        [Required(ErrorMessage = "The payment account must be specified"), StringLength(100), Display(Name = "Payment account")]
        public string PaymentAccount { get; set; }
        [Required(ErrorMessage = "The сategory must be specified"), StringLength(100), Display(Name = "Category")]
        public string Category { get; set; }
        [StringLength(200), Display(Name = "Contact person")]
        public string ContactPerson { get; set; }

    }
}