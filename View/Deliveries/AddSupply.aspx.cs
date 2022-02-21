using ChainStores.DATA;
 
using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChainStores.View.Deliveries
{
    public partial class AddSupply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<string> GetProducts()
        {
            var _db = new dbContext();
            var products = _db.Products.Select(g => g.Title).Distinct().OrderBy(c => c);
            return products;
        }

        public IEnumerable<string> GetSuppliers()
        {
            var _db = new dbContext();
            var suppliers = _db.Suppliers.Select(g => g.Title).Distinct().OrderBy(c => c);
            return suppliers;
        }

        public IEnumerable<string> GetShops()
        {
            var _db = new dbContext();
            var shops = _db.Shops.Select(g => g.Title).Distinct().OrderBy(c => c);
            return shops;
        }

        public IEnumerable<string> GetEmployees()
        {
            var _db = new dbContext();
            var employees = _db.Employees.Select(g => g.LastName + " "+ g.FirstName).Distinct().OrderBy(c => c);
            return employees;
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            var _db = new dbContext();
            try
            {
                var employeeId = _db.Employees.First(c => c.LastName + " "+ c.FirstName
                == dropDownEmployees.SelectedValue).Id;
                var shopId = _db.Shops.First(c => c.Title == dropDownShop.SelectedValue).Id;
                var productId = _db.Products.First(c => c.Title == dropDownProducts.SelectedValue).Id;
                var supplierId = _db.Suppliers.First(c => c.Title == dropDownSuppliers.SelectedValue).Id;
                if (Convert.ToInt32(textQuantity.Text) > 0)
                {
                    Supply supply = new Supply()
                    {
                        EmployeeId = employeeId,
                        ShopId = shopId,
                        Quantity = Convert.ToInt32(textQuantity.Text),
                        ProductId = productId,
                        SupplierId = supplierId,
                        

                    };
                    _db.Deliveries.Add(supply);
                    _db.SaveChanges();
                    Response.Redirect("~/View/Deliveries/ViewDeliveries");
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Deliveries/ViewDeliveries");
        }
    }
}