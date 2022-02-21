using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace ChainStores.Events
{
    public interface IEventGrid 
    {
       void gridViewHeader(object sender, GridViewRowEventArgs e);
    }
}
