using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Linq;
using System.Web.UI;

namespace ChainStores.View.Shops
{
    public partial class AddShop : System.Web.UI.Page
    {
        private dbContext _db;
        private IShopRepository _shopRepository;

        public AddShop()
        {
            _db = new dbContext();
            _shopRepository = new ShopRepository(_db);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Shop shop = new Shop()
                    {
                        Title = textTitle.Text,
                        Adress = textAdress.Text,
                        PhoneNumber = textPhoneNumber.Text,
                        FormTradeService = textFormTradeService.Text,
                        Category = textCategory.Text,
                        MCC = textMCC.Text,
                        Info = TextInfo.Text,
                        ProductRange = textProductRange.Text,
                        RetailSpace = Convert.ToInt32(textRetailSpace.Text),
                        WebSite = textWebSite.Text
                    };
                    if (!_db.Shops.Any(a => a.Title == shop.Title))
                    {
                        _shopRepository.AddAsync(shop);
                        _db.SaveChanges();
                        Response.Redirect("~/View/Shops/ViewShops");
                    }
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        =>Response.Redirect("~/View/Shops/ViewShops");
        
    }
}