using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class Position: EntityTitle
    {
        [StringLength(7), Display(Name = "Code position")]
        public string CodePosition { get; set; }
        public double Salary { get; set; }
        [StringLength(10000), Display(Name = "Job descriptions"), DataType(DataType.MultilineText)]
        public string JobDescriptions { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
}