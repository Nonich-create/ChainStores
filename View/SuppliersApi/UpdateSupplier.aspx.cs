using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;

namespace ChainStores.View.SuppliersApi
{
    public partial class UpdateSupplier : System.Web.UI.Page
    {
        private dbContext _db;
        private ISupplierRepository _supplierRepository;

        public UpdateSupplier()
        {
            _db = new dbContext();
            _supplierRepository = new SupplierRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                if (!String.IsNullOrEmpty(textAdress.Text) && !String.IsNullOrEmpty(textTitle.Text)
                                && !String.IsNullOrEmpty(textPhoneNumber.Text))
                {
                    Supplier supplier = new Supplier()
                    {
                        Id = Id,
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
                    _supplierRepository.UpdateAsync(supplier);
                    Response.Redirect("~/View/Suppliers/ViewSuppliers");
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Suppliers/ViewSuppliers");
    }
}