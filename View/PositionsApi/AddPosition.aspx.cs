using System;

namespace ChainStores.View.PositionsApi
{
    public partial class AddPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/PositionsApi/ViewPositions");
        }
    }
}