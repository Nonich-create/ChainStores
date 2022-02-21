using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class ProductCategory: EntityTitle
    {
        [Required, StringLength(6)]
        public string Code { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
}