using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Threading.Tasks;

namespace ChainStores.View.Shops
{
    public partial class UpdateShop : System.Web.UI.Page
    {
        private dbContext _db;
        private IShopRepository _shopRepository;

        public UpdateShop()
        {
            _db = new dbContext();
            _shopRepository = new ShopRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty =  _shopRepository.Find(Id);
                textTitle.Text = entitty.Title;
                textAdress.Text = entitty.Adress;
                textCategory.Text = entitty.Category;
                textFormTradeService.Text = entitty.FormTradeService;
                textMCC.Text = entitty.MCC;
                textPhoneNumber.Text = entitty.PhoneNumber;
                textProductRange.Text = entitty.ProductRange;
                textRetailSpace.Text = entitty.RetailSpace.ToString();
                textWebSite.Text = entitty.WebSite;
                TextInfo.Text = entitty.Info;
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                if (!String.IsNullOrEmpty(textAdress.Text) && !String.IsNullOrEmpty(textPhoneNumber.Text)
                       && !String.IsNullOrEmpty(textTitle.Text) && !String.IsNullOrEmpty(textCategory.Text))
                {
                    Shop shop = new Shop()
                    {
                        Id = Id,
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
                    _shopRepository.UpdateAsync(shop);
                    Response.Redirect("~/View/Shops/ViewShops");
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/Shops/ViewShops");
    }
}