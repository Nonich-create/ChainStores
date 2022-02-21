using ChainStores.DATA;
using ChainStores.DATA.Logic;
using ChainStores.DATA.Models;
using System;
using System.Threading.Tasks;

namespace ChainStores.View.ProductCategory
{
    public partial class UpdateCategory : System.Web.UI.Page
    {
        private dbContext _db;
        private IProductCategoryRepository _productCategoryRepository;

        public UpdateCategory()
        {
            _db = new dbContext();
            _productCategoryRepository = new ProductCategoryRepository(_db);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void form1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                var entitty =   _productCategoryRepository.Find(Id);
                textCode.Text = entitty.Code;
                TextTitle.Text = entitty.Title;
                textInfo.Text = entitty.Info;
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                Guid Id = new Guid(Request.QueryString["Id"]);
                if (!String.IsNullOrEmpty(textCode.Text)
                    && !String.IsNullOrEmpty(TextTitle.Text))
                {
                    ChainStores.DATA.Models.ProductCategory productCategory = new ChainStores.DATA.Models.ProductCategory()
                    {
                        Id = Id,
                        Title = TextTitle.Text,
                        Code = textCode.Text,
                        Info = textInfo.Text
                    };

                        _productCategoryRepository.UpdateAsync(productCategory);
                        Response.Redirect("~/View/ProductCategory/ViewProductCategory");
                    
                     
                }
            }
            catch
            {

            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        => Response.Redirect("~/View/ProductCategory/ViewProductCategory");
    }
}