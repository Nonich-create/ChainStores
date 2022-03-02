using ChainStores.DATA.Models.Base;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;

namespace ChainStores.DATA.Models
{
    public class Position: EntityTitle
    {
        [Required(ErrorMessage = "The code must be specified"), StringLength(7), Display(Name = "Code position")]
        public string CodePosition { get; set; }
        [Required(ErrorMessage = "The salary must be specified"), Display(Name = "Salary")]
        public double Salary { get; set; }
        [StringLength(10000), Display(Name = "Job descriptions"), DataType(DataType.MultilineText)]
        public string JobDescriptions { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
    }
}