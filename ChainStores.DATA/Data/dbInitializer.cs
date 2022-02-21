using ChainStores.DATA.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ChainStores.DATA
{
    public class dbInitializer : CreateDatabaseIfNotExists<dbContext>
    {
        public dbInitializer(dbContext context)
        {
            context = new dbContext();
            if (!context.Database.Exists())
            {
                context.Database.Initialize(true);
            }
            if (!context.CommoаdityUnits.Any())
            {
                context.CommoаdityUnits.AddRange(GetCommoаdityUnits());
                context.SaveChanges();
            }
            if (!context.Positions.Any())
            {
                context.Positions.AddRange(GetPositions());
                context.SaveChanges();
            }
            if (!context.Shops.Any())
            {
                context.Shops.AddRange(GetShops());
                context.SaveChanges();
            }
            if (!context.ProductManufacturers.Any())
            {
                context.ProductManufacturers.AddRange(GetProductManufacturer());
                context.SaveChanges();
            }
            if (!context.ProductCategories.Any())
            {
                context.ProductCategories.AddRange(GetProductCategories());
                context.SaveChanges();
            }
            if (!context.Products.Any())
            {
                context.Products.AddRange(GetProducts(context));
                context.SaveChanges();
            }
            if (!context.Employees.Any())
            {
                context.Employees.AddRange(GetEmployees(context));
                context.SaveChanges();
            }
            if (!context.Suppliers.Any())
            {
                context.Suppliers.AddRange(GetSuppliers());
                context.SaveChanges();
            }   
           //if (!context.Deliveries.Any())
           //{
           //    context.Deliveries.AddRange(GetDeliveries(context));
           //    context.SaveChanges();
           //}
        }
       
        private List<Position> GetPositions()
        {
            var positions = new List<Position> {
                new Position
                {
                    Title = "Manager",
                    Salary = 2600
                },
                new Position
                {
                    Title = "Accountant",
                    Salary = 3800
                },
                new Position
                {
                    Title = "Seller-cashier"
                    ,
                    Salary = 2200
                },
                new Position
                {
                    Title = "Merchandiser",
                    Salary = 1800
                },
                new Position
                {
                    Title = "Storekeeper",
                    Salary = 1700
                },
                new Position
                {
                    Title = "HR Manager",
                    Salary = 2300
                },
                new Position
                {
                    Title = "Store director",
                    Salary = 4500
                },
                new Position
                {
                    Title = "Economist",
                    Salary = 2600
                },
                new Position
                {
                    Title = "Middle manager",
                    Salary = 3000
                },
                new Position
                {
                    Title = "Chief accountant",
                    Salary = 4000
                },
            };

            return positions;
        }
        private List<Shop> GetShops()
        {
            var shops = new List<Shop> {
                new Shop
                {
                    Title = "The Home Depot",
                    Adress = "60 Orange St, Bloomfield, NJ 07003, US",
                    PhoneNumber = "+19736808700",
                    RetailSpace = 155
                },
                new Shop
                {
                    Title = "Rug Depot",
                    Adress = "199 Franklin Ave, Nutley, NJ 07110, US",
                    PhoneNumber = "+19732350444",
                    RetailSpace = 355
                },
                new Shop
                {
                    Title = "Stop & Shop",
                    Adress = "8 Franklin St, Bloomfield, NJ 07003, US",
                    PhoneNumber = "+19737436413",
                    RetailSpace = 289
                },
                new Shop
                {
                    Title = "Walmart Supercenter",
                    Adress = "150 Harrison Ave, Kearny, NJ 07032, US",
                    PhoneNumber = "+12019550280",
                    RetailSpace = 55
                },
                new Shop
                {
                    Title = "Macy’s",
                    Adress = "20 Mall Dr E, Jersey City, NJ 07310,  US",
                    PhoneNumber = "+12012555200",
                    RetailSpace = 100
                },
                new Shop
                {
                    Title = "H Mart Ridgefield",
                    Adress = "321 Broad Ave, Ridgefield, NJ 07657, US",
                    PhoneNumber = "+12019439600",
                    RetailSpace = 355
                },
                new Shop
                {
                    Title = "Westfield Garden State Plaza",
                    Adress = "One Garden State Plaza, Paramus, NJ 07652, US",
                    PhoneNumber = "+12018432121",
                    RetailSpace = 500
                },
                new Shop
                {
                    Title = "ShopRite of New Milford",
                    Adress = "250 River Rd, New Milford, NJ 07646, US",
                    PhoneNumber = "+12012628834",
                    RetailSpace = 322
                },
                new Shop
                {
                    Title = "ACME Markets",
                    Adress = "136 Lake Ave, Midland Park, NJ 07432, US",
                    PhoneNumber = "+12014937050",
                    RetailSpace = 677
                },
                new Shop
                {
                    Title = "Woo-Ri Mart",
                    Adress = "206 Pegasus Ave, Northvale, NJ 07647, US",
                    PhoneNumber = "+12017501203",
                    RetailSpace = 144
                },
            };
            return shops;
        }
        private List<ProductManufacturer> GetProductManufacturer()
        {
            var productManufacturers = new List<ProductManufacturer> {
                new ProductManufacturer
                {
                    Title = "Levi's",
                    Address = "750 Baychester Ave, Bronx",
                    Country = "US"
                },
                new ProductManufacturer
                {
                    Title = "Nike",
                    Address = "1 E 161 St, Bronx",
                    Country = "US"
                },
                new ProductManufacturer
                {
                    Title = "Intel",
                    Address = "1740 Eastchester Rd, Bronx",
                    Country = "US"
                },
                new ProductManufacturer
                {
                    Title = "Urban Decay",
                    Address = "",
                    Country = "US"
                },
                new ProductManufacturer
                {
                    Title = "Kate Spade",
                    Address = "1 Guojiatiyuchang S Rd, Chaoyang",
                    Country = "China"
                },
                new ProductManufacturer
                {
                    Title = "Polaroid",
                    Address = "Beijing, Dongcheng, Daboge Hu Tong,",
                    Country = "China"
                },
                new ProductManufacturer
                {
                    Title = "Shinola",
                    Address = "Dongcheng District, Beijing",
                    Country = "China"
                },
                new ProductManufacturer
                {
                    Title = "Corning Incorporated",
                    Address = "Jianguo Rd, Chaoyang, Beijing",
                    Country = "China"
                },
                new ProductManufacturer
                {
                    Title = "Benchmade Knife",
                    Address = "Henan Road, Tonghui, Chaoyang, Chaoyang, Beijing",
                    Country = "China"
                },
                new ProductManufacturer
                {
                    Title = "Abbott Laboratories",
                    Address = "Yangzha Roundabout, Chaoyang, Beijing",
                    Country = "China"
                },
            };
            return productManufacturers;
        }
        private List<ProductCategory> GetProductCategories()
        {
            var productCategories = new List<ProductCategory> {
                new ProductCategory
                {
                    Title = "Technic",
                    Code = "000001",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Perfumery",
                    Code = "000002",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Food products",
                      Code = "000003",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Consumer goods",
                      Code = "000004",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Plumbing",
                      Code = "000005",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Military products",
                    Code = "000006",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Sports equipment",
                      Code = "000007",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Footwear",
                    Code = "000008",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Clothes",
                      Code = "000009",
                    Info =""
                },
                new ProductCategory
                {
                    Title = "Toys",
                      Code = "000010",
                    Info =""
                },
            };
            return productCategories;
        }
        private List<Supplier> GetSuppliers()
        {
            var suppliers = new List<Supplier> {
                new Supplier
                {
                    Title = "Patel Brothers",
                    Adress = "1681 Oak Tree Rd, Edison, NJ 08820",
                    Info = "",
                    PhoneNumber = "+17325159574",
                    Email ="PatelBrothers@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Aaron Lewis", 
                    PaymentAccount = "2353467585009852"
                },
                new Supplier
                {
                    Title = "Rite of Ernston Road",
                    Adress = "2909 Washington Rd, Parlin, NJ 08859",
                    Info = "",
                    PhoneNumber = "+17325258282",
                    Email ="ErnstonRoad@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Adam Levine",
                    PaymentAccount = "2883167585432342"
                },
                new Supplier
                {
                    Title = "Aiello",
                    Adress = "603 Washington Rd, South Amboy, NJ 08879",
                    Info = "",
                    PhoneNumber = "+17325252201",
                    Email ="Aiello@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Ivan Moody",
                    PaymentAccount = "2353467118630342"
                },
                new Supplier
                {
                    Title = "Trader Joe's",
                    Adress = "1022 Broad St, Shrewsbury, NJ 07702",
                    Info = "",
                    PhoneNumber = "+17323392511",
                    Email ="Trader@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Amanda Somerville",
                    PaymentAccount = "2353468009432342"
                },
                new Supplier
                {
                    Title = "Technic",
                    Adress = "1031 Broad St, Shrewsbury, NJ 07702",
                    Info = "",
                    PhoneNumber = "+17323892535",
                    Email ="Technic@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Ariel Bloomer",
                    PaymentAccount = "8812467585432342"
                },
                new Supplier
                {
                    Title = "Exito Fresh",
                    Adress = "176 Broadway, Long Branch, NJ 07740",
                    Info = "",
                    PhoneNumber = "+17322224891",
                    Email ="ExitoFresh@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Benjamin Burnley",
                    PaymentAccount = "2353467585400964"
                },
                new Supplier
                {
                    Title = "International Mexican Grocery & Deli",
                    Adress = "2112 NJ Rt 35 South, Oakhurst",
                    Info = "",
                    PhoneNumber = "+17326869042",
                    Email ="InternationalMexicanGrocery@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Billy Gibbons",
                    PaymentAccount = "8877127585432342"
                },
                new Supplier
                {
                    Title = "Inspired",
                    Adress = "1800 Bloomsbury Ave, Ocean Township, NJ 07712",
                    Info = "",
                    PhoneNumber = "+17326956150",
                    Email ="Inspired@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Billie Joe Armstrong",
                    PaymentAccount = "2353467585472112"
                },
                new Supplier
                {
                    Title = "Jersey Shore Premium Outlets",
                    Adress = "1 Premium Outlet Blvd, Tinton Falls, NJ 07753",
                    Info = "",
                    PhoneNumber = "+17329181700",
                    Email ="JerseyShorePremiumOutlets@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Gwen Stefani",
                    PaymentAccount = "2353467585432342"
                },
                new Supplier
                {
                    Title = "ShopRite of Wall Township",
                    Adress = "2433 NJ-34, Manasquan, NJ 08736",
                    Info = "",
                    PhoneNumber = "+17322929780",
                    Email ="ShopRiteWallTownship@gmail.com",
                    Category = "Broker",
                    Country = "US",
                    ContactPerson = "Blackie Lawless",
                    PaymentAccount = "2375547585432342"
                },
            };
            return suppliers;
        }
        private List<Employee> GetEmployees(dbContext context)
        {
            var employees = new List<Employee> {
                new Employee
                {
                    InsurancePolicy = "123123624523",
                    LastName ="Humphrey",
                    FirstName = "Bogart",
                    Age = 25,
                    ShopId = context.Shops.First(f => f.Title == "The Home Depot").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "Manager").Id,
                    PhoneNumber = "+17325159215"
                },
                new Employee
                {
                    InsurancePolicy = "123123524523",
                    LastName ="Katharine",
                    FirstName = "Hepburn",
                    Age = 49,
                    ShopId = context.Shops.First(f => f.Title == "The Home Depot").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "Manager").Id,
                    PhoneNumber = "+17325159564"
                },
                new Employee
                {
                    InsurancePolicy = "144123624523",
                    LastName ="Cary",
                    FirstName = "Grant",
                    Age = 21,
                    ShopId = context.Shops.First(f => f.Title == "Woo-Ri Mart").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "Store director").Id,
                    PhoneNumber = "+17325159111"
                },
                new Employee
                {
                    InsurancePolicy = "123123625555",
                    LastName ="Bette",
                    FirstName = "Davis",
                    Age = 38,
                    ShopId = context.Shops.First(f => f.Title == "ACME Markets").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "Seller-cashier").Id,
                    PhoneNumber = "+17325159664"
                },
                new Employee
                {
                   InsurancePolicy = "123887754523",
                   LastName ="Bette",
                   FirstName = "Garbo",
                   Age = 33,
                   ShopId = context.Shops.First(f => f.Title == "ShopRite of New Milford").Id,
                   Info = "",
                   PositionId = context.Positions.First(f => f.Title == "Economist").Id,
                   PhoneNumber = "+17325159731"         
                },
                new Employee
                {
                    InsurancePolicy = "000123624523",
                    LastName ="James",
                    FirstName = "Stewart",
                    Age = 29,
                    ShopId = context.Shops.First(f => f.Title == "H Mart Ridgefield").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "Storekeeper").Id,
                    PhoneNumber = "+17325159005"
                },
                new Employee
                {
                    InsurancePolicy = "777723624523",
                    LastName ="Audrey",
                    FirstName = "Hepburn",
                    Age = 21,
                    ShopId = context.Shops.First(f => f.Title == "Rug Depot").Id,
                    Info = "",
                    PositionId = context.Positions.First(f => f.Title == "HR Manager").Id,
                    PhoneNumber = "+17325159124"
                },
                 new Employee
                 {
                     InsurancePolicy = "123123998555",
                     LastName ="James",
                     FirstName = "Bergman",
                     Age = 25,
                     ShopId = context.Shops.First(f => f.Title == "Rug Depot").Id,
                     Info = "",
                     PositionId = context.Positions.First(f => f.Title == "Chief accountant").Id,
                     PhoneNumber = "+17325159010"
                 },
                 new Employee
                 {
                     InsurancePolicy = "177443624523",
                     LastName ="James",
                     FirstName = "Foundation",
                     Age = 40,
                     ShopId = context.Shops.First(f => f.Title == "Rug Depot").Id,
                     Info = "",
                     PositionId = context.Positions.First(f => f.Title == "Accountant").Id,
                     PhoneNumber = "+17325159997"
                 },
                 new Employee
                 {
                     InsurancePolicy = "123121122523",
                     LastName ="Judy",
                     FirstName = "Garland",
                     Age = 28,
                     ShopId = context.Shops.First(f => f.Title == "Woo-Ri Mart").Id,
                     Info = "",
                     PositionId = context.Positions.First(f => f.Title == "Accountant").Id,
                     PhoneNumber = "+17325159321"
                 }
            };
            return employees;
        }
        private List<Product> GetProducts(dbContext context)
        {
            var productes = new List<Product> {
                new Product
                {
                    Article = "123sda",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "TV Blaupunkt 32WB965T",
                    Description = "Resolution 1366x768 (HD)",
                    UnitPrice = 205.98,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Shinola").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Technic").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "One unit").Id
                },
                new Product
                {
                    Article = "123attw",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Versace Versense eau de toilette",
                    Description = "50 ml",
                    UnitPrice = 97.45,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Abbott Laboratories").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Perfumery").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id  
                },
                new Product
                {
                    Article = "aggs341",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Basmati Rice Tamashae Miadi",
                    Description = "long-grain, steamed,for indian pilaf, 1 kg",
                    UnitPrice = 8.76,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Polaroid").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Food products").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id
                },
                new Product
                {
                    Article = "as455",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Midori Sushi Rice",
                    Description = "450 g, Type of rice White, Shape of rice grains Round-grain",
                    UnitPrice = 2.04,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Polaroid").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Food products").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id
                },
                new Product
                {
                    Article = "12ks4",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Our Toy X005-A Game complex",
                    Description = "",
                    UnitPrice = 49.12,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Urban Decay").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Toys").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id
                },
                new Product
                {
                    Article = "573ddd",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Winter men's jacket with sintepon",
                    Description = "",
                    UnitPrice = 44.92,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Levi's").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Clothes").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "One unit").Id
                },
                new Product
                {
                    Article = "77",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "T-shirts UNISEX MELANGE",
                    Description = "100% cotton",
                    UnitPrice = 3.61,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Levi's").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Clothes").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "One unit").Id
                },
                new Product
                {
                    Article = "123ff",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Acrylic bathtub VagnerPlast Cavallo",
                    Description = "160x70 / VPBA167CAV2X-04 (with frame)",
                    UnitPrice = 529.89,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Corning Incorporated").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Plumbing").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "One unit").Id
                },
                new Product
                {
                    Article = "7435sds",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Ball for washing down products",
                    Description = "diameter 12 cm PATERRA/20",
                    UnitPrice = 33.15,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Nike").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Consumer goods").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id
                },
                new Product
                {
                    Article = "1237dD",
                    DateManufacture = DateTime.Now,
                    ExpirationDate = DateTime.Now.AddYears(15),
                    UpdateDate = DateTime.Now,
                    ProductComposition = "",
                    Title = "Smoked sausage from poultry",
                    Description = "Sneksi Wild mustard 80 g.",
                    UnitPrice = 1.18,
                    ProductManufacturerId = context.ProductManufacturers.First(f => f.Title == "Benchmade Knife").Id,
                    ProductCategoryId = context.ProductCategories.First(f => f.Title == "Food products").Id,
                    CommoаdityUnitId =  context.CommoаdityUnits.First(f => f.Title == "Packaging").Id
                },
            };
            return productes;
        }
        private List<Supply> GetDeliveries(dbContext context)
        {
              var supplies = new List<Supply> {
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Humphrey Bogart").Id,
                      ProductId = context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").Id,
                      ShopId = context.Shops.First(f => f.Title == "The Home Depot").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Patel Brothers").Id,
                      Quantity = 15,
                      TotalPrice = 15 * (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(15),
                      ActualDateReceipt = DateTime.Now.AddDays(15),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Humphrey Bogart").Id,
                      ProductId = context.Products.First(f => f.Title == "Smoked sausage from poultry").Id,
                      ShopId = context.Shops.First(f => f.Title == "The Home Depot").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "ShopRite of Wall Township").Id,
                      Quantity = 10,
                      TotalPrice = 10 * (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(12),
                      ActualDateReceipt = DateTime.Now.AddDays(15),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Judy Garland").Id,
                      ProductId = context.Products.First(f => f.Title == "Acrylic bathtub VagnerPlast Cavallo").Id,
                      ShopId = context.Shops.First(f => f.Title == "Woo-Ri Mart").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Patel Brothers").Id,
                      Quantity = 55,
                      TotalPrice = 55 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(7),
                      ActualDateReceipt = DateTime.Now.AddDays(11),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Judy Garland").Id,
                      ProductId = context.Products.First(f => f.Title == "Acrylic bathtub VagnerPlast Cavallo").Id,
                      ShopId = context.Shops.First(f => f.Title == "Woo-Ri Mart").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Inspired").Id,
                      Quantity = 5,
                      TotalPrice = 5 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(22),
                      ActualDateReceipt = DateTime.Now.AddDays(26),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "James Stewart").Id,
                      ProductId = context.Products.First(f => f.Title == "Winter men's jacket with sintepon").Id,
                      ShopId = context.Shops.First(f => f.Title == "H Mart Ridgefield").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Exito Fresh").Id,
                      Quantity = 15,
                      TotalPrice = 15 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(6),
                      ActualDateReceipt = DateTime.Now.AddDays(10),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Katharine Hepburn").Id,
                      ProductId = context.Products.First(f => f.Title == "Winter men's jacket with sintepon").Id,
                      ShopId = context.Shops.First(f => f.Title == "The Home Depot").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Exito Fresh").Id,
                      Quantity = 17,
                      TotalPrice = 17 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(3),
                      ActualDateReceipt = DateTime.Now.AddDays(3),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "James Foundation").Id,
                      ProductId = context.Products.First(f => f.Title == "Our Toy X005-A Game complex").Id,
                      ShopId = context.Shops.First(f => f.Title == "Rug Depot").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "International Mexican Grocery & Deli").Id,
                      Quantity = 25,
                      TotalPrice = 25 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(5),
                      ActualDateReceipt = DateTime.Now.AddDays(5),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "James Foundation").Id,
                      ProductId = context.Products.First(f => f.Title == "Midori Sushi Rice").Id,
                      ShopId = context.Shops.First(f => f.Title == "Rug Depot").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "International Mexican Grocery & Deli").Id,
                      Quantity = 300,
                      TotalPrice = 300 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(15),
                      ActualDateReceipt = DateTime.Now.AddDays(15),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Bette Garbo").Id,
                      ProductId = context.Products.First(f => f.Title == "Midori Sushi Rice").Id,
                      ShopId = context.Shops.First(f => f.Title == "ShopRite of New Milford").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Rite of Ernston Road").Id,
                      Quantity = 250,
                      TotalPrice = 250 *  (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,
                      DateReceipt = DateTime.Now.AddDays(8),
                      ActualDateReceipt = DateTime.Now.AddDays(8),
                   },
                   new Supply
                   {
                      EmployeeId = context.Employees.First(f => f.LastName + " " + f.FirstName == "Bette Garbo").Id,
                      ProductId = context.Products.First(f => f.Title == "Versace Versense eau de toilette").Id,
                      ShopId = context.Shops.First(f => f.Title == "ShopRite of New Milford").Id,
                      SupplierId = context.Suppliers.First(f => f.Title == "Rite of Ernston Road").Id,
                      Quantity = 23,
                      TotalPrice = 23 * (double)context.Products.First(f => f.Title == "TV Blaupunkt 32WB965T").UnitPrice,        
                      DateReceipt = DateTime.Now.AddDays(15),
                      ActualDateReceipt = DateTime.Now.AddDays(15),
                   },
              };
            return supplies;
        }
        private List<CommoаdityUnit> GetCommoаdityUnits()
        {
            var commoаdityUnits = new List<CommoаdityUnit> {
                   new CommoаdityUnit
                   {
                       Title = "One unit"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Packaging"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Litre"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Milliliter"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Kilogram"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Gram"
                   },
                   new CommoаdityUnit
                   {
                       Title = "Metre"
                   },
              };
            return commoаdityUnits;
        }
    }
}

 