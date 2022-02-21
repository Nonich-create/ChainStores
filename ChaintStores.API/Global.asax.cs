using ChainStores.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Cors;

namespace ChaintStores.API
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        private dbContext db;
        protected void Application_Start()
        {
            CorsPolicy corsPolicy = new CorsPolicy();
          
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
     

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            db = new dbContext();
           // dbInitializer dbInitializer = new dbInitializer(db);
        }
    }
}
