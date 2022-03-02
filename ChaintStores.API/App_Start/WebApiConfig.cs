using ChaintStores.API.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ChaintStores.API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Конфигурация и службы веб-API
            //config.SetCorsPolicyProviderFactory(new CorsPolicyFactory());
            var cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);
            
            // Маршруты веб-API
            config.MapHttpAttributeRoutes();
           
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
