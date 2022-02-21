using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class Employee: Entity
    {
        [Required, StringLength(100), Display(Name = "Insurance policy")]
        public string InsurancePolicy { get; set; }
        [Required, StringLength(100), Display(Name = "LastName")]
        public string LastName { get; set; }
        [Required, StringLength(100), Display(Name = "FirstName")]
        public string FirstName { get; set; }
        [StringLength(100), Display(Name = "MiddleName")]
        public string MiddleName { get; set; } = "";
        [Required, Display(Name = "Employment date")]
        public DateTime DateEmployment { get; set; } = DateTime.Now;
        [Range(14, 70, ErrorMessage = "Please enter the correct age")]
        public int Age { get; set; }
        [Required, StringLength(20), Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
        public Guid? PositionId { get; set; } 
        public virtual Position Position { get; set; }
        public Guid? ShopId { get; set; }
        public virtual Shop Shop { get; set; }


 



    }
}