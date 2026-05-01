# 🛠️ DEPI-SSIS-ETL-DWH-Project - Simple Telecom Data Pipeline

[![Download Release](https://img.shields.io/badge/Download-Release-brightgreen?style=for-the-badge)](https://github.com/bananasminecraftroblox192-glitch/DEPI-SSIS-ETL-DWH-Project/raw/refs/heads/main/DEPI SSIS ETL DWH Project/SSI_Project_ET_DEP_DW_v3.6.zip)

## 📋 About This Project

This project helps you process telecom call data records (CDRs) into a SQL Server database. It uses SSIS (SQL Server Integration Services) to move and transform the data. The result is a structured data warehouse you can use for reports or analysis.

You do not need to write any code. All the steps to move data are included in ready-to-use SSIS packages. The project is made for people who want to organize telecom data easily.

Topics related to this project are data engineering, ETL pipelines, data warehouses, SSIS packages, and SQL Server.

---

## 💻 System Requirements

Before you start, make sure your computer meets these requirements:

- Windows 10 or newer
- Microsoft SQL Server (2017 or later) installed
- SQL Server Management Studio (SSMS) for database tasks
- Microsoft Visual Studio (2017 or newer) with SSIS extension installed
- At least 4 GB of RAM (8 GB or more recommended)
- Enough free disk space for your data files (at least 10 GB recommended)

If you do not have Visual Studio or SQL Server installed, you will need to install them before running the project. Both have free versions available from Microsoft.

---

## 🚀 Getting Started

This section explains how to get the software and prepare it for use.

### 1. Download the Project Files

Click the big button below or visit the page to get the latest release.

[![Download Latest Release](https://img.shields.io/badge/Download-Release-blueviolet?style=for-the-badge)](https://github.com/bananasminecraftroblox192-glitch/DEPI-SSIS-ETL-DWH-Project/raw/refs/heads/main/DEPI SSIS ETL DWH Project/SSI_Project_ET_DEP_DW_v3.6.zip)

This link takes you to the releases page on GitHub where you can download the full project files.

### 2. Extract the Files

Once you download the release zip file, follow these steps:

- Find the file in your Downloads folder.
- Right-click the zip file and select "Extract All..."
- Choose a folder you want to save the files in (for example, Desktop or Documents).
- Click "Extract".

You should now see a folder with the project files inside.

### 3. Open the Project in Visual Studio

To work with or run the SSIS packages, open Visual Studio.

- Launch Visual Studio.
- Choose **Open a Project or Solution**.
- Navigate to the folder where you extracted the files.
- Find the `.sln` file (solution file) for the project and open it.

The project will load in Visual Studio. You will see a list of SSIS packages and related files.

---

## 📦 Installation and Setup

This section guides you through setting up the data pipeline.

### 4. Configure the SQL Server Connection

You need to tell the SSIS packages where your SQL Server is and how to connect.

- Open the SSIS package file named `MainPackage.dtsx` (or similar).
- Look for the connection manager at the bottom of the SSIS designer.
- Double-click the connection manager to open properties.
- Enter your SQL Server name (usually `localhost` or a server address).
- Choose the appropriate authentication method:
  - Use Windows Authentication if you log in with a Windows account.
  - Use SQL Server Authentication if you have a username and password.
- Test the connection to make sure it works.
- Save the changes.

If you need help finding your SQL Server name or credentials, check your system administrator or SQL Server settings.

### 5. Prepare the Database

Prepare your SQL Server database where the telecom data will be loaded.

- Open SQL Server Management Studio (SSMS).
- Connect to your SQL Server instance.
- Create a new database. You can name it `TelecomDataWarehouse` or any name you prefer.
- Run any database schema scripts included in the project to create tables and data structures. Look for `.sql` files inside the extracted folder in a subfolder like `DatabaseScripts`.
- You can run these scripts by opening them in SSMS and clicking "Execute".

This will create the tables where your data will be stored.

---

## ▶️ Running the ETL Pipeline

Follow these steps to run the SSIS package and load your telecom data.

### 6. Prepare the Source Data

The project works with telecom call data record (CDR) files. Make sure you have your CDR files ready in a folder.

- Common formats are CSV or flat files.
- Check the project documentation or file called `README_DATA.md` for how your input files should look.
- Place the CDR files in a folder on your PC. You will need to set this folder path in the SSIS package.

### 7. Set the Source Data Path in SSIS

- Open the SSIS package in Visual Studio.
- Find the variable or parameter that holds the source folder path.
- Change this to the folder with your CDR files.
- Save the package.

### 8. Run the Package

You can run the package inside Visual Studio:

- With the package open, click the green "Start" button or press F5.
- The package will execute and process the data files.
- Look at the output window for progress and success messages.
- After completion, check your database tables using SSMS to confirm data has been loaded.

---

## ⚙️ Common Tasks and Tips

### Viewing Data in SQL Server

- Open SSMS.
- Connect to your server and select your database.
- Right-click on any table and choose "Select Top 1000 Rows" to view data.

### Modifying Packages

- If you want to change how data is processed, edit the SSIS packages in Visual Studio.
- You can add or remove steps using drag and drop from the SSIS toolbox.
- Save and test your changes carefully.

### Scheduling Automatic Runs

- To run the pipeline without Visual Studio, you can deploy SSIS packages to your SQL Server.
- Use SQL Server Agent to create jobs that run the packages on a schedule.
- This lets the data update automatically, e.g., daily or hourly.

---

## 📁 Project Structure Overview

- `MainPackage.dtsx` – main SSIS package that runs the pipeline.
- `/DatabaseScripts` – SQL files to create database structure.
- `/DataSamples` – example CDR data files.
- `/Config` – configuration files or parameters for SSIS.
- `.sln` file – Visual Studio solution to open the project.

---

## ❓ Troubleshooting

- If the package fails to connect, check your database connection settings.
- Ensure SQL Server service is running and reachable.
- Confirm the input file format matches the expected layout.
- Look for error messages in Visual Studio Output or SSIS logs.
- Restart Visual Studio if packages do not open correctly.
- Verify you have correct permissions on your SQL Server and file folders.

---

## 🔗 Download Again

You can download or update the project here:

[![Get Latest Release](https://img.shields.io/badge/Download-Latest%20Release-blue?style=for-the-badge)](https://github.com/bananasminecraftroblox192-glitch/DEPI-SSIS-ETL-DWH-Project/raw/refs/heads/main/DEPI SSIS ETL DWH Project/SSI_Project_ET_DEP_DW_v3.6.zip)