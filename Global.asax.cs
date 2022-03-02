using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Http;
using ChainStores.DATA;

namespace ChainStores
{
    public class Global : HttpApplication
    {
        dbContext db;
        void Application_Start(object sender, EventArgs e)
        {
            // Код, выполняемый при запуске приложения
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            

            db = new dbContext();
            dbInitializer dbInitializer = new dbInitializer(db);
            
        }
  
    }
}