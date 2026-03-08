# DEPI SSIS ETL DWH Project

An **SSIS (SQL Server Integration Services)** ETL pipeline that processes telecom CDR (Call Detail Record) data from CSV flat files into a SQL Server data warehouse.

## 🏗️ Architecture

```
CSV Source Files ──► Foreach Loop Container ──► Flat File Source
                                                     │
                                                     ▼
                                              Derived Columns
                                            (TAC & SNR from IMEI)
                                                     │
                                                     ▼
                                                  Lookup
                                          (dim_imsi_reference)
                                                     │
                                              ┌──────┴──────┐
                                              ▼              ▼
                                      Handle NULL     fact_transaction
                                    subscriber_id     (OLE DB Dest)
                                                          │
                                                     Error Output
                                                          ▼
                                              error_destination_output
```

### Data Flow Summary

1. **Foreach Loop Container** — Iterates over all `*.csv` files in `Source Files/`
2. **Flat File Source** — Reads pipe-delimited (`|`) CSV data
3. **Derived Columns** — Extracts TAC (first 8 chars) and SNR (last 6 chars) from IMEI
4. **Lookup** — Joins on `imsi` against `dim_imsi_reference` to get `subscriber_id`
5. **Fact Transaction Loading** — Inserts valid records into `fact_transaction`
6. **Error Output** — Redirects failed inserts to `error_destination_output`

## 📊 Source Data Schema

Files are pipe-delimited (`|`) with the following columns:

| Column | Type | Description |
|--------|------|-------------|
| `id` | INT | Transaction ID |
| `imsi` | VARCHAR(9) | International Mobile Subscriber Identity |
| `imei` | VARCHAR(14) | International Mobile Equipment Identity |
| `cell` | INT | Cell tower ID |
| `lac` | INT | Location Area Code |
| `event_type` | VARCHAR(1) | Event type code |
| `event_ts` | DATETIME | Event timestamp |

## 🚀 Getting Started

### Prerequisites

- **SQL Server Express** (or any SQL Server edition)
- **Visual Studio 2022** with the **SQL Server Integration Services Projects** extension
- **SQL Server Management Studio (SSMS)** (recommended)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/Mohammed14906/DEPI-SSIS-ETL-DWH-Project.git
   ```

2. **Create the database and tables**
   ```bash
   # Run the SQL setup script in SSMS or sqlcmd
   sqlcmd -S .\SQLEXPRESS -i SQL/setup_database.sql
   ```

3. **Open the project in Visual Studio**
   - Open `DEPI SSIS ETL DWH Project.slnx`

4. **Update file paths**
   - The package uses absolute paths that need to match your local directory
   - Update the `FullPath` and `Output` variables in the package to match your local directory structure
   - Update the Flat File Connection Manager path and the Foreach Loop Container folder path

5. **Update the database connection**
   - The default connection points to `.\SQLEXPRESS` with Windows Authentication
   - Update the OLE DB Connection Manager if your SQL Server instance name differs

6. **Run the package**
   - Press **F5** or click **Start** in Visual Studio to execute the ETL pipeline

## 📁 Project Structure

```
DEPI SSIS ETL DWH Project/
├── DEPI SSIS ETL DWH Project.slnx     # Solution file
├── Source Files/                        # Input CSV data files
│   ├── 01_clean_data.csv
│   ├── 02_clean_data_with_null.csv
│   ├── 03_sample_data.csv
│   ├── batch_01_file_01.csv ... 05
│   └── batch_02_file_01.csv ... 05
├── Output Files/                        # ETL output directory
├── DEPI SSIS ETL DWH Project/          # SSIS project
│   ├── Package.dtsx                     # Main SSIS package
│   ├── DEPI SSIS ETL DWH Project.dtproj
│   ├── DEPI SSIS ETL DWH Project.database
│   └── Project.params
├── SQL/
│   └── setup_database.sql              # Database setup script
├── README.md
└── .gitignore
```

## 🗄️ Database Tables

| Table | Purpose |
|-------|---------|
| `fact_transaction` | Main fact table for telecom CDR transactions |
| `error_destination_output` | Stores records that failed during ETL loading |
| `dim_imsi_reference` | Dimension/lookup table mapping IMSI to subscriber IDs |

## 📝 License

This project was developed as part of the **DEPI (Digital Egypt Pioneers Initiative)** advanced data engineering track.