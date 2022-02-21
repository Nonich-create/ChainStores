 
using ChainStores.DATA.Models;
using System.Data.Entity;

namespace ChainStores.DATA
{
    public class dbContext : DbContext
    {
        public dbContext() : base("DefaultConnection")
        {

        }
        public DbSet<CommoаdityUnit> CommoаdityUnits { get; set; }
        public DbSet<Position> Positions { get; set; }
        public DbSet<Shop> Shops { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<ProductManufacturer> ProductManufacturers { get; set; }
        public DbSet<ProductCategory> ProductCategories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<Supply> Deliveries { get; set; }
    }
}