using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class Supply: Entity
    {  
        [Required]
        public Guid ProductId { get; set; }
        public virtual Product Product { get; set; }
        [Required]
        public Guid SupplierId { get; set; }
        public virtual Supplier Supplier { get; set; }
        [Required]
        public Guid ShopId { get; set; }
        public virtual Shop Shop { get; set; }
        [Required]
        public Guid EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }
        [Required]
        public int Quantity { get; set; }
        public double TotalPrice { get; set; }
        [Display(Name = "Application date")]
        public DateTime ApplicationDate { get; set; } = DateTime.Now;
        [Display(Name = "Date of receipt")]
        public DateTime DateReceipt { get; set; }
        [Display(Name = "Actual date of receipt")]
        public DateTime? ActualDateReceipt { get; set; }
      

    }
}