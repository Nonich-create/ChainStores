using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class Shop : EntityTitle
    {
        [Required(ErrorMessage = "The address must be specified"), StringLength(1000), Display(Name = "Address"), DataType(DataType.MultilineText)]
        public string Adress { get; set; }
        [Required(ErrorMessage = "The phone number must be specified"), StringLength(20), Display(Name = "Phone Number")]
        [RegularExpression(@"^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$", ErrorMessage = "Incorrectly entered phone number +375 12 345-67-89")]
        public string PhoneNumber { get; set; }
        [StringLength(1000), Display(Name = "Form of trade service"), DataType(DataType.MultilineText)]
        public string FormTradeService { get; set; }
        [StringLength(10000), Display(Name = "Product range"), DataType(DataType.MultilineText)]
        public string ProductRange { get; set; }
        [Display(Name = "Retail space, m2")]
        public int RetailSpace { get; set; }
        public string Category { get; set; }
        [StringLength(4),Display(Name = "Merchant Category Code")]
        public string MCC { get; set; }
        [Display(Name = "Site")]
        public string WebSite { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
}