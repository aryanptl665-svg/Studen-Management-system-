# Student Management System

## Overview
This is a complete C# .NET Framework 4.x WinForms desktop application built for managing student data, courses, marks, and attendance. It utilizes ADO.NET for data access, along with SQL Server for database storage. 

## Features
- Admin Login (Password Hashed with SHA256)
- Comprehensive Dashboard with summary metrics and generated charts
- Student, Course, Subject, Marks, and Attendance Management 
- Various Reports generation with CSV Export capability

## Setup Instructions

### 1. Database Setup
1. Launch SQL Server Management Studio (SSMS) or equivalent IDE (like Azure Data Studio).
2. Connect to your `.\SQLEXPRESS` or `(localdb)\MSSQLLocalDB` instance.
3. Open the `StudentManagementDB.sql` script located in the project's root folder.
4. Execute the script to create the `StudentManagementDB` database, all necessary tables, constraints, and seed data.

### 2. Configure the Connection String
1. Open up Visual Studio and load the `StudentManagementSystem.sln` or `StudentManagementSystem.csproj`.
2. Locate the `App.config` file.
3. Ensure the connection string under `<connectionStrings>` correctly matches your SQL Server instance:
   ```xml
   <add name="StudentManagementDB"
         connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=StudentManagementDB;Integrated Security=True;"
         providerName="System.Data.SqlClient"/>
   ```
   *Note: If you are using LocalDB, change `Data Source=.\SQLEXPRESS` to `Data Source=(localdb)\MSSQLLocalDB`.*

### 3. Run the Application
1. Select the project `StudentManagementSystem` as your startup project in Visual Studio.
2. Build the solution.
3. Run the application (`F5`).
4. Login using the default Admin credentials seeded by the SQL Script:
   - **Username**: admin
   - **Password**: admin

## Dependencies
- Designed using .NET SDK format with `<TargetFramework>net48</TargetFramework>`.
- `System.Data.SqlClient` (Included in .NET Framework)
- `System.Windows.Forms.DataVisualization` (For charting in Dashboard)
- `iTextSharp` (Included via NuGet for potential extension/PDF generation)
- The user interface strictly applies vanilla WinForms out-of-the-box controls without external UI dependencies.

## Architecture
- **UI (Forms)**: All components of the primary graphical interface are within the `Forms` directory.
- **DAL (Data Access Layer)**: Responsible for interactions with the underlying SQL Server database. Kept strictly distinct from business logic models and views.
- **Models**: Maps SQL rows objects directly into standardized DTO/Entity C# classes inside the application.
