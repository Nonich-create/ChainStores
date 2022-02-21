using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ChainStores.Events
{
    public class EventGrid: IEventGrid
    {
        public void gridViewHeader(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    cell.Attributes.Add("title", cell.Text);
                }
            }
        }
    }
}