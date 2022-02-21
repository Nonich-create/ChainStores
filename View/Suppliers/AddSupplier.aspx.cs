using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;

namespace ChainStores.View.Suppliers
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        private dbContext _db;
        private ISupplierRepository _supplierRepository;

        public AddSupplier()
        {
            _db = new dbContext();
            _supplierRepository = new SupplierRepository(_db);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
           
            try
            {
                {
                    Supplier supplier = new Supplier()
                    {
                        Title = textTitle.Text,
                        Adress = textAdress.Text,
                        Info = textInfo.Text,
                        PhoneNumber = textPhoneNumber.Text,
                        Category = textCategory.Text,
                        ContactPerson = textContactPerson.Text,
                        Email = textEmail.Text,
                        Country = textCountry.Text,
                        PaymentAccount = textPaymentAccount.Text
                    };
             
                   var context = new ValidationContext(supplier);
                   var results = new List<ValidationResult>();
                   var isValid = Validator.TryValidateObject(supplier, context, results, true);
                   if (!isValid)
                   {
                        RequiredFieldValidator.ErrorMessage = "";
                         foreach (var validationResult in results)
                         {
                            RequiredFieldValidator.ErrorMessage += validationResult.ErrorMessage + "  <br />";
                         }

                        return;
                   }
                     _supplierRepository.AddAsync(supplier);
                     Response.Redirect("~/View/Suppliers/ViewSuppliers");
                }
            }
            catch
            {
                
            }

        }

         
        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Suppliers/ViewSuppliers");
        
    }
}