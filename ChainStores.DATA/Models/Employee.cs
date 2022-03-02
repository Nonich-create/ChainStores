using ChainStores.DATA.Models.Base;
using System;
using System.ComponentModel.DataAnnotations;

namespace ChainStores.DATA.Models
{
    public class Employee: Entity
    {
        [Required(ErrorMessage = "The ssn must be specified"), StringLength(100), Display(Name = "SSN"), ]
        [RegularExpression(@"[0-9]{3}-[0-9]{2}-[0-9]{4}$", ErrorMessage = "Incorrectly entered ssn number 123-45-6789")]
        public string InsurancePolicy { get; set; }
       
        [Required(ErrorMessage = "The last name must be specified"), StringLength(100), Display(Name = "Last name")]
        public string LastName { get; set; }
        
        [Required(ErrorMessage = "The first name must be specified"), StringLength(100), Display(Name = "First name")]
        public string FirstName { get; set; }
        
        [StringLength(100), Display(Name = "MiddleName")]
        public string MiddleName { get; set; } = "";
      
        [Required(ErrorMessage = "The employment date must be specified"), Display(Name = "Employment date")]
        public DateTime DateEmployment { get; set; } = DateTime.Now;
       
        [Range(14, 70, ErrorMessage = "The age must be specified")]
        public int Age { get; set; }
      
        [Required(ErrorMessage = "The phone number must be specified"), StringLength(20), Display(Name = "Phone Number")]
        [RegularExpression(@"^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$", ErrorMessage = "Incorrectly entered phone number +375 12 345-67-89")]
        public string PhoneNumber { get; set; }
     
        [StringLength(10000), Display(Name = "Additional information"), DataType(DataType.MultilineText)]
        public string Info { get; set; }
      
        public Guid? PositionId { get; set; } 
        public virtual Position Position { get; set; }
     
        public Guid? ShopId { get; set; }
        public virtual Shop Shop { get; set; }
    }
}