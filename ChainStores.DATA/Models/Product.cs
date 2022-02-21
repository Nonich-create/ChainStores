using ChainStores.DATA.Models.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ChainStores.DATA.Models
{
    public class Product: EntityTitle
    {
        
        public string Article { get; set; }
        [StringLength(1000), DataType(DataType.MultilineText)]
        public string Сertificate { get; set; }
        [StringLength(10000), Display(Name = "Product composition"), DataType(DataType.MultilineText)]
        public string ProductComposition { get; set; }
        [Display(Name = "Date of manufacture")]
        public DateTime DateManufacture { get; set; }
        [Display(Name = "Expiration date")]
        public DateTime? ExpirationDate { get; set; }  
        [Display(Name = "Update date")]
        public DateTime UpdateDate { get; set; } = DateTime.Now;
        [Display(Name = "Price")]
        public double? UnitPrice { get; set; }
        [StringLength(10000), Display(Name = "Product Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }
        public Guid ProductCategoryId { get; set; }
        public virtual ProductCategory ProductCategory { get; set; }
        public Guid ProductManufacturerId { get; set; }
        public virtual ProductManufacturer ProductManufacturer { get; set; }
        public Guid CommoаdityUnitId { get; set; }
        public virtual CommoаdityUnit CommoаdityUnit { get; set; }
 
    }
 
}