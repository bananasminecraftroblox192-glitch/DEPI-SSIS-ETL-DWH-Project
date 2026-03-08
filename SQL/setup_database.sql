-- =============================================
-- DEPI SSIS ETL DWH Project - Database Setup
-- =============================================
-- Run this script to create the database and 
-- required tables for the SSIS ETL pipeline.
--
-- Usage:
--   sqlcmd -S .\SQLEXPRESS -i setup_database.sql
-- =============================================

-- Create the database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SSIS_Telecom_DB')
BEGIN
    CREATE DATABASE [SSIS_Telecom_DB];
    PRINT 'Database [SSIS_Telecom_DB] created successfully.';
END
ELSE
    PRINT 'Database [SSIS_Telecom_DB] already exists.';
GO

USE [SSIS_Telecom_DB];
GO

-- =============================================
-- Dimension Table: dim_imsi_reference
-- Lookup table mapping IMSI to subscriber IDs
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dim_imsi_reference]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[dim_imsi_reference] (
        [id]              INT           IDENTITY(1,1) PRIMARY KEY,
        [imsi]            VARCHAR(9)    NOT NULL,
        [subscriber_id]   INT           NOT NULL
    );
    PRINT 'Table [dim_imsi_reference] created successfully.';
END
GO

-- =============================================
-- Fact Table: fact_transaction
-- Main fact table for telecom CDR transactions
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fact_transaction]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[fact_transaction] (
        [id]              INT           IDENTITY(1,1) PRIMARY KEY,
        [transaction_id]  INT           NULL,
        [imsi]            VARCHAR(9)    NULL,
        [subscriber_id]   INT           NULL,
        [tac]             VARCHAR(8)    NULL,
        [snr]             VARCHAR(6)    NULL,
        [imei]            VARCHAR(14)   NULL,
        [cell]            INT           NULL,
        [lac]             INT           NULL,
        [event_type]      VARCHAR(1)    NULL,
        [event_ts]        DATETIME      NULL
    );
    PRINT 'Table [fact_transaction] created successfully.';
END
GO

-- =============================================
-- Error Table: error_destination_output
-- Stores records that failed during ETL loading
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error_destination_output]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[error_destination_output] (
        [id]              INT           NULL,
        [imsi]            VARCHAR(9)    NULL,
        [imei]            VARCHAR(14)   NULL,
        [cell]            INT           NULL,
        [lac]             INT           NULL,
        [event_type]      VARCHAR(1)    NULL,
        [event_ts]        DATETIME      NULL,
        [tac]             VARCHAR(8)    NULL,
        [snr]             VARCHAR(8)    NULL,
        [ErrorCode]       INT           NULL,
        [ErrorColumn]     INT           NULL
    );
    PRINT 'Table [error_destination_output] created successfully.';
END
GO

PRINT '';
PRINT '=============================================';
PRINT ' Database setup complete!';
PRINT ' Database: SSIS_Telecom_DB';
PRINT ' Tables:   dim_imsi_reference';
PRINT '           fact_transaction';
PRINT '           error_destination_output';
PRINT '=============================================';
GO
