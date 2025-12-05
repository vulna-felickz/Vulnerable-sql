# Vulnerable-sql

## Microsoft SSDT SQL Server Database Project

This repository contains a boilerplate Microsoft SQL Server Data Tools (SSDT) database project with sample tables and stored procedures.

### Project Structure

```
Database.sqlproj              # Main SSDT project file
Database.publish.xml           # Deployment configuration
dbo/
  ├── Tables/                  # Database tables
  │   ├── Users.sql           # Users table with authentication info
  │   ├── Products.sql        # Products catalog
  │   └── Orders.sql          # Orders with foreign key to Users
  └── StoredProcedures/        # Stored procedures
      ├── GetUserById.sql     # Retrieve user by ID
      ├── InsertProduct.sql   # Add new product
      └── GetOrders.sql       # Query orders with filters
```

### Sample Database Schema

#### Tables

1. **Users** - User account information
   - UserId (PK, Identity)
   - Username, Email (Unique)
   - FirstName, LastName
   - CreatedDate, IsActive

2. **Products** - Product catalog
   - ProductId (PK, Identity)
   - ProductName, Description
   - Price, StockQuantity
   - CategoryId, CreatedDate, ModifiedDate, IsActive

3. **Orders** - Order management
   - OrderId (PK, Identity)
   - UserId (FK to Users)
   - OrderDate, TotalAmount
   - OrderStatus, ShippingAddress, PaymentMethod
   - CreatedDate, ModifiedDate

#### Stored Procedures

1. **GetUserById** - Retrieves a user by their ID
   - Parameter: @UserId INT
   
2. **InsertProduct** - Inserts a new product into the catalog
   - Parameters: @ProductName, @Description, @Price, @StockQuantity, @CategoryId
   - Returns: NewProductId
   
3. **GetOrders** - Retrieves orders with optional filters
   - Parameters: @UserId, @OrderStatus, @StartDate, @EndDate

### How to Use This Project

#### Prerequisites

- Visual Studio 2019 or later with SQL Server Data Tools (SSDT)
- SQL Server or SQL Server Express (LocalDB works too)
- Alternatively, use MSBuild and SqlPackage.exe from command line

#### Option 1: Using Visual Studio

1. Open `Database.sqlproj` in Visual Studio
2. Right-click the project and select "Build" to compile
3. Right-click the project and select "Publish" to deploy to a SQL Server instance
4. Configure the target connection string in the publish dialog or use the provided `Database.publish.xml`

#### Option 2: Using Command Line

```bash
# Build the project
msbuild Database.sqlproj /p:Configuration=Release

# Deploy using SqlPackage (adjust paths as needed)
SqlPackage.exe /Action:Publish /SourceFile:bin\Release\Database.dacpac /TargetConnectionString:"Server=(localdb)\MSSQLLocalDB;Integrated Security=true;Database=SampleDatabase"
```

#### Option 3: Using dotnet CLI (if SQL Build tools are installed)

```bash
# Build the database project
dotnet build Database.sqlproj

# The output will be a .dacpac file in bin/Debug or bin/Release
```

### Database Deployment

The `Database.publish.xml` file contains default deployment settings:
- Target Database: SampleDatabase
- Target Server: (localdb)\MSSQLLocalDB
- Data Loss Protection: Enabled

You can modify these settings or create additional publish profiles for different environments (Dev, Test, Production).

### Notes

- This is a sample/boilerplate project demonstrating SSDT structure
- The schema includes basic constraints, indexes, and foreign keys
- All timestamps use GETDATE() for automatic date insertion
- The stored procedures include parameter validation and proper SET NOCOUNT ON usage
- Tables include audit fields (CreatedDate, ModifiedDate) and soft delete support (IsActive)

### Extending This Project

To add new database objects:

1. Create new .sql files in the appropriate folders (Tables, StoredProcedures, Views, Functions, etc.)
2. Add the files to the .sqlproj file under `<ItemGroup>` with `<Build Include="path/to/file.sql" />`
3. Build and deploy the project

### License

This is a sample project for educational and demonstration purposes.