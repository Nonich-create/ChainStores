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
        [Required, StringLength(1000), Display(Name = "Adress"), DataType(DataType.MultilineText)]
        public string Adress { get; set; }
        [Required, StringLength(20), Display(Name = "Phone Number")]
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