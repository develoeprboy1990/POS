-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2023 at 07:00 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extbooks_accounting`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AirLineID` int(11) NOT NULL,
  `AirLineName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`AirLineID`, `AirLineName`) VALUES
(1, 'AKBAR TRAVEL'),
(2, 'AIR BLUE'),
(3, 'AL DIYAFA');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `AttachmentID` int(8) NOT NULL,
  `InvoiceNo` varchar(25) DEFAULT NULL,
  `FileName` varchar(75) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `InvoiceDetailID` int(8) NOT NULL,
  `InvoiceMasterID` int(8) DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `Qty` int(8) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_master`
--

CREATE TABLE `bill_master` (
  `InvoiceMasterID` int(8) NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int(8) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_detail`
--

CREATE TABLE `challan_detail` (
  `ChallanDetailID` int(8) NOT NULL,
  `ChallanMasterID` int(8) NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `Qty` int(8) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `challan_master`
--

CREATE TABLE `challan_master` (
  `ChallanMasterID` int(8) NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `WalkinCustomerName` varchar(75) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanType` varchar(25) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int(8) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_type`
--

CREATE TABLE `challan_type` (
  `ChallanTypeID` int(8) NOT NULL,
  `ChallanTypeName` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challan_type`
--

INSERT INTO `challan_type` (`ChallanTypeID`, `ChallanTypeName`) VALUES
(2, 'Supply of Goods'),
(3, 'Job Work'),
(4, 'Supply on Approval'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `chartofaccount`
--

CREATE TABLE `chartofaccount` (
  `ChartOfAccountID` int(12) NOT NULL,
  `CODE` varchar(15) DEFAULT NULL,
  `ChartOfAccountName` varchar(75) DEFAULT NULL,
  `OpenDebit` int(12) DEFAULT NULL,
  `OpenCredit` int(12) DEFAULT NULL,
  `L1` int(10) DEFAULT NULL,
  `L2` int(10) DEFAULT NULL,
  `L3` int(10) DEFAULT NULL,
  `Category` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chartofaccount`
--

INSERT INTO `chartofaccount` (`ChartOfAccountID`, `CODE`, `ChartOfAccountName`, `OpenDebit`, `OpenCredit`, `L1`, `L2`, `L3`, `Category`) VALUES
(100000, 'A', 'ASSETS', NULL, NULL, 100000, 100000, 100000, NULL),
(110000, 'A', 'CURRENT ASSET', NULL, NULL, 100000, 100000, 110000, NULL),
(110100, 'A', 'CASH ACCOUNT', NULL, NULL, 100000, 110000, 110100, NULL),
(110101, 'A', 'CASH IN HAND', NULL, NULL, 100000, 110000, 110100, 'CASH'),
(110106, 'A', 'PETTY CASH', NULL, NULL, 100000, 110000, 110100, NULL),
(110200, 'A', 'BANK DEPOSITS', NULL, NULL, 100000, 110000, 110200, NULL),
(110201, 'A', 'BANK1', NULL, NULL, 100000, 110000, 110200, 'BANK'),
(110202, 'A', 'BANK2', NULL, NULL, 100000, 110000, 110200, 'BANK'),
(110250, 'A', 'Credit Card ACCOUNT.', NULL, NULL, 100000, 110000, 110200, 'CARD'),
(110300, 'A', 'JAYLIN PAY.', NULL, NULL, 100000, 110000, 110200, NULL),
(110400, 'A', 'A/C RECEIVABLE.', NULL, NULL, 100000, 110000, 110400, 'AR'),
(110401, 'A', 'PARTY A/C.', NULL, NULL, 100000, 110000, 110400, NULL),
(110402, 'A', 'OTHER RECEIVABLES', NULL, NULL, 100000, 110000, 110400, NULL),
(110420, 'A', 'STAFF ADVANCES.', NULL, NULL, 100000, 110000, 110400, NULL),
(110430, 'A', 'OTHER ADVANCES', NULL, NULL, 100000, 110000, 110400, NULL),
(110490, 'A', 'BAD DEBTS', NULL, NULL, 100000, 110000, 110400, NULL),
(110500, 'A', 'INVENTORY', NULL, NULL, 100000, 110000, 110500, NULL),
(110501, 'A', 'STOCK IN HAND', NULL, NULL, 100000, 110000, 110500, NULL),
(110600, 'A', 'MISC. ADJUSTMENTS', NULL, NULL, 100000, 110000, 110600, NULL),
(110700, 'A', 'STOCK INVENTORY', NULL, NULL, 100000, 110000, 110000, NULL),
(110800, 'A', 'TAX ON PURCHASES', NULL, NULL, 100000, 110000, 110000, NULL),
(110900, 'A', 'PREPAID RENT', NULL, NULL, 100000, 110000, 110000, NULL),
(110901, 'A', 'EMPLOYEE SALAYR ADVANCE', NULL, NULL, 100000, 110000, 110000, NULL),
(110902, 'A', 'PREPAID VISA', NULL, NULL, 100000, 110000, 110000, NULL),
(110903, 'A', 'INPUT EXCISE TAX', NULL, NULL, 100000, 110000, 110000, NULL),
(110904, 'A', 'INPUT VAT', NULL, NULL, 100000, 110000, 110000, NULL),
(110905, 'A', 'PREPAID LEGAL FEES', NULL, NULL, 100000, 110000, 110000, NULL),
(110906, 'A', 'PREPAID OTHERS', NULL, NULL, 100000, 110000, 110000, NULL),
(110907, 'A', 'PREPAID INSURANCE', NULL, NULL, 100000, 110000, 110000, NULL),
(110908, 'A', 'SECURITY DEPOSIT', NULL, NULL, 100000, 110000, 110000, NULL),
(110909, 'A', 'OFFICE SUPPLIES', NULL, NULL, 100000, 110000, 110000, NULL),
(120100, 'A', 'FIXED ASSETS', NULL, NULL, 100000, 120000, 120100, NULL),
(120101, 'A', 'ACCUMULATED DESPRECIATION', NULL, NULL, 100000, 120000, 120100, NULL),
(120103, 'A', 'OFFICE EQUIPMENT', NULL, NULL, 100000, 120000, 120100, NULL),
(120104, 'A', 'MACHINERY & EQUIPMENT', NULL, NULL, 100000, 120000, 120100, NULL),
(120105, 'A', 'LAND & BUILDING', NULL, NULL, 100000, 120000, 120100, NULL),
(120106, 'A', 'GOOD WILL', NULL, NULL, 100000, 120000, 120100, NULL),
(120125, 'A', 'VEHICLES', NULL, NULL, 100000, 120000, 120100, NULL),
(120127, 'A', 'PREMISES(SHOP)', NULL, NULL, 100000, 120000, 120100, NULL),
(130000, 'A', 'OTHER ASSETS', NULL, NULL, 100000, 130000, 130000, NULL),
(130100, 'A', 'PREPAID EXPENSES', NULL, NULL, 100000, 130000, 130100, NULL),
(130200, 'A', 'LONG TERM INVESTMENTS', NULL, NULL, 100000, 130000, 130200, NULL),
(140000, 'A', 'DEFERRED ASSETS', NULL, NULL, 100000, 140000, 140000, NULL),
(140100, 'A', 'DEFERRED ASSETS', NULL, NULL, 100000, 140000, 140100, NULL),
(140200, 'A', 'DEPOSITS', NULL, NULL, 100000, 140000, 140200, NULL),
(140300, 'A', 'LEASEHOLD IMPROV.NET', NULL, NULL, 100000, 140000, 140300, NULL),
(200000, 'L', 'LIABILITIES', NULL, NULL, 200000, 200000, 200000, NULL),
(210000, 'L', 'ACCOUNTS PAYABLE', NULL, NULL, 200000, 210000, 210000, NULL),
(210100, 'L', 'A/C PAYABLE', NULL, NULL, 200000, 210000, 210100, 'AP'),
(210101, 'L', 'ADVANCE PAYMENT', NULL, NULL, 200000, 210000, 210100, NULL),
(210102, 'L', 'OTHER PAYABLES', NULL, NULL, 200000, 210000, 210100, NULL),
(210103, 'L', 'BALANCE ADJUSTMENT', NULL, NULL, 200000, 210000, 210100, NULL),
(210104, 'L', 'RENT PAYABLE', NULL, NULL, 200000, 210000, 210300, NULL),
(210105, 'L', 'TELEPHONE EXPENSE PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210106, 'L', 'PDC PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210107, 'L', 'WATER & ELECTRICITY PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210108, 'L', 'SALARY PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210109, 'L', 'EXCISE TAX PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210110, 'L', 'OUTPUT VAT', NULL, NULL, 200000, 210000, 210100, NULL),
(210111, 'L', 'OTHER EXCISE TAX', NULL, NULL, 200000, 210000, 210100, NULL),
(210112, 'L', 'VAT PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210113, 'L', 'UNEARNED REVENUE', NULL, NULL, 200000, 210000, 210100, NULL),
(210114, 'L', 'PROFESSIONAL FEE PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210115, 'L', 'ACCRUED EXPENSE', NULL, NULL, 200000, 210000, 210100, NULL),
(210300, 'L', 'TAX PAYABLES', NULL, NULL, 200000, 210000, 210300, NULL),
(210301, 'L', 'W/H TAX Deductions', NULL, NULL, 200000, 210000, 210300, NULL),
(210302, 'L', 'MARKETING COMMISSION PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL),
(210303, 'L', 'TAKAFAL PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL),
(220000, 'L', 'SECURITIES', NULL, NULL, 200000, 220000, 220000, NULL),
(220100, 'L', 'SECURITIES', NULL, NULL, 200000, 220000, 220100, NULL),
(230000, 'L', 'VAT A/C', NULL, NULL, 200000, 230000, 230000, NULL),
(230100, 'L', 'VAT-OUTPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL),
(230200, 'L', 'VAT-INPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL),
(240000, 'L', 'LONG TERM LIABILITY', NULL, NULL, 200000, 200000, 240000, NULL),
(240100, 'L', 'ANNUAL LEAVE PAYABLE', NULL, NULL, 200000, 200000, 240000, NULL),
(240101, 'L', 'END OF SERVICE BENEFITS', NULL, NULL, 200000, 200000, 240000, NULL),
(240102, 'L', 'STAFFAIR TICKET PAYABLE', NULL, NULL, 200000, 200000, 240000, NULL),
(300000, 'C', 'STOCKHOLDERS EQUITY', NULL, NULL, 300000, 300000, 300000, NULL),
(310000, 'C', 'STOCKHOLDERS EQUITY', NULL, NULL, 300000, 310000, 310000, NULL),
(310100, 'C', 'CAPITAL STOCK.', NULL, NULL, 300000, 310000, 310100, NULL),
(310101, 'C', 'CAPITAL A/C.', NULL, NULL, 300000, 310000, 310100, NULL),
(310102, 'C', 'PROFIT AND LOSS A/C.', NULL, NULL, 300000, 310000, 310100, NULL),
(310103, 'C', 'CURRENT PERIOD PROF/LOSS.', NULL, NULL, 300000, 310000, 310100, NULL),
(310104, 'C', 'PARTNERS WITHDRAWAL', NULL, NULL, 300000, 310000, 310100, NULL),
(310105, 'C', 'SHARE CPAITAL ACCOUNT', NULL, NULL, 300000, 310000, 310100, NULL),
(310106, 'C', 'SHAREHOLDERS\'S CURRENT ACCOUNT', NULL, NULL, 300000, 310000, 310100, NULL),
(310107, 'C', 'RETAINED EARNINGS', NULL, NULL, 300000, 310000, 310100, NULL),
(310108, 'C', 'OWNERS EQUITY', NULL, NULL, 300000, 310000, 310100, NULL),
(320000, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320000, NULL),
(320100, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320100, NULL),
(400000, 'R', 'REVENUES', NULL, NULL, 400000, 400000, 400000, NULL),
(410000, 'R', 'SALES', NULL, NULL, 400000, 410000, 410000, NULL),
(410100, 'R', 'SALES', NULL, NULL, 400000, 410000, 410100, NULL),
(410101, 'R', 'COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL),
(410150, 'R', 'SALE OF TICKET', NULL, NULL, 400000, 410000, 410100, NULL),
(410151, 'R', 'INCOME FROM REPAIR', NULL, NULL, 400000, 410000, 410100, NULL),
(410152, 'R', 'DISCOUNT RECEIVED', NULL, NULL, 400000, 410000, 410100, NULL),
(410155, 'R', 'SALES DISCOUNTS', NULL, NULL, 400000, 410000, 410100, NULL),
(410172, 'R', 'FREIGHT CHARGES', NULL, NULL, 400000, 410000, 410100, NULL),
(410173, 'R', 'INCOME SALE COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL),
(410175, 'R', 'SALE RETURNS.', NULL, NULL, 400000, 410000, 410100, NULL),
(410180, 'R', 'SALE RETURN DISCOUNT.', NULL, NULL, 400000, 410000, 410100, NULL),
(410185, 'R', 'SALE RETURN FREIGHT', NULL, NULL, 400000, 410000, 410100, NULL),
(410200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 410000, 410200, NULL),
(410201, 'R', 'MISC. INCOME', NULL, NULL, 400000, 410000, 410200, NULL),
(410205, 'R', 'OTHER SALES.', NULL, NULL, 400000, 410000, 410200, NULL),
(420000, 'R', 'OTHER REVENUES', NULL, NULL, 400000, 420000, 420000, NULL),
(420100, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420100, NULL),
(420101, 'R', 'OTHER INCOME 2', NULL, NULL, 400000, 420000, 420100, NULL),
(420104, 'R', 'PENDING/TARGET INCOME', NULL, NULL, 400000, 420000, 420100, NULL),
(420105, 'R', 'SERVICE CHARGES', NULL, NULL, 400000, 420000, 420100, NULL),
(420200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420201, 'R', 'GENERAL INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420202, 'R', 'INTEREST INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420203, 'R', 'LATE FEE INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420204, 'R', 'DISCOUNT', NULL, NULL, 400000, 420000, 420200, NULL),
(420205, 'R', 'OTHER CHARGES', NULL, NULL, 400000, 420000, 420200, NULL),
(500000, 'E', 'TOTAL EXPENSES', NULL, NULL, 500000, 500000, 500000, NULL),
(500100, 'E', 'Shipping Expenses', NULL, NULL, 500000, 500000, 500000, NULL),
(500200, 'E', 'COST OF SALES', NULL, NULL, 500000, 500000, 500000, NULL),
(500300, 'E', 'TAXES:-:', NULL, NULL, 500000, 500000, 500000, '0'),
(510000, 'E', 'COST OF GOODS SOLD.', NULL, NULL, 500000, 510000, 510000, NULL),
(510100, 'E', 'MATERIAL INVENTORY', NULL, NULL, 500000, 510000, 510100, NULL),
(510101, 'E', 'OPENING STOCK.', NULL, NULL, 500000, 510000, 510100, NULL),
(510102, 'E', 'PURCHASES', NULL, NULL, 500000, 510000, 510100, NULL),
(510103, 'E', 'PURCHASE OF TICKET', NULL, NULL, 500000, 510000, 510100, NULL),
(510104, 'E', 'DISCOUNT ALLOWED', NULL, NULL, 500000, 510000, 510100, NULL),
(510105, 'E', 'PURCHASE DISCOUNTS', NULL, NULL, 500000, 510000, 510100, NULL),
(510107, 'E', 'PURCHASE LOADING', NULL, NULL, 500000, 510000, 510100, NULL),
(510109, 'E', 'PURCHASE UNLOADING', NULL, NULL, 500000, 510000, 510100, NULL),
(510110, 'E', 'PURCHASE RETURN.', NULL, NULL, 500000, 510000, 510100, NULL),
(510117, 'E', 'ZAKAT ACCOUNT.', NULL, NULL, 500000, 510000, 510100, NULL),
(510120, 'E', 'PURCHASES MISC. ADJ.', NULL, NULL, 500000, 510000, 510100, NULL),
(510122, 'E', 'PURCHASE BENDING', NULL, NULL, 500000, 510000, 510100, NULL),
(510140, 'E', 'ADNAN PAY.', NULL, NULL, 500000, 510000, 510100, NULL),
(510145, 'E', 'STOCK EXPENSES', NULL, NULL, 500000, 510000, 510100, NULL),
(510200, 'E', 'PACKING MATERIAL EXPENS.', NULL, NULL, 500000, 510000, 510200, NULL),
(510300, 'E', 'POWER:-', NULL, NULL, 500000, 510000, 510300, NULL),
(510400, 'E', 'MARKETING EXPENSES', NULL, NULL, 500000, 510000, 510400, NULL),
(510441, 'E', 'MARKETING SALARIES', NULL, NULL, 500000, 510000, 510400, NULL),
(510451, 'E', 'MARKETING PHONE/MOB EXP.', NULL, NULL, 500000, 510000, 510400, NULL),
(510461, 'E', 'ENTERTAINMENT', NULL, NULL, 500000, 510000, 510400, NULL),
(520000, 'E', 'GEN & ADMIN EXPENSES', NULL, NULL, 500000, 520000, 520000, NULL),
(520100, 'E', 'PAYROLL EXPENSES', NULL, NULL, 500000, 520000, 520100, NULL),
(520200, 'E', 'MAINTENANCE', NULL, NULL, 500000, 520000, 520200, NULL),
(530000, 'E', 'ORGANISATION EXPENSE.', NULL, NULL, 500000, 530000, 530000, NULL),
(530100, 'E', 'PAYROLL EXPENSES', NULL, NULL, 500000, 530000, 530100, NULL),
(530200, 'E', 'ASSETS INSURANCE', NULL, NULL, 500000, 530000, 530200, NULL),
(540000, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540000, NULL),
(540100, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540100, NULL),
(540110, 'E', 'R/M VEHICLE.', NULL, NULL, 500000, 540000, 540100, NULL),
(540111, 'E', 'R/M FURNITURE & FIXTURE', NULL, NULL, 500000, 540000, 540100, NULL),
(540112, 'E', 'R/M EQUIPMENT / COMPUTER', NULL, NULL, 500000, 540000, 540100, NULL),
(540130, 'E', 'GIFT ACCOUNT.', NULL, NULL, 500000, 540000, 540100, NULL),
(550000, 'E', 'OFFICE EXPENSES', NULL, NULL, 500000, 550000, 550000, NULL),
(550100, 'E', 'OFFICE EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550110, 'E', 'PRINTING & STATIONARY', NULL, NULL, 500000, 550000, 550100, NULL),
(550114, 'E', 'VEHICLE EXP.', NULL, NULL, 500000, 550000, 550100, NULL),
(550115, 'E', 'LICENCE EXPENSE.', NULL, NULL, 500000, 550000, 550100, NULL),
(550116, 'E', 'TELEPHONE BILLS', NULL, NULL, 500000, 550000, 550100, NULL),
(550120, 'E', 'WATER BILLS', NULL, NULL, 500000, 550000, 550100, NULL),
(550121, 'E', 'ELECTRIC BILL.', NULL, NULL, 500000, 550000, 550100, NULL),
(550123, 'E', 'HOME EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550124, 'E', 'ROOM RENT.', NULL, NULL, 500000, 550000, 550100, NULL),
(550125, 'E', 'TRAVELLING EXP.', NULL, NULL, 500000, 550000, 550100, NULL),
(550126, 'E', 'TEA & FOOD EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550130, 'E', 'POL VEHICLE.', NULL, NULL, 500000, 550000, 550100, NULL),
(550132, 'E', 'LEGAL & PROFESSIONAL', NULL, NULL, 500000, 550000, 550100, NULL),
(550134, 'E', 'MISC. EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550136, 'E', 'CHARITY & DONATIONS', NULL, NULL, 500000, 550000, 550100, NULL),
(550138, 'E', 'NEWS PAPERS', NULL, NULL, 500000, 550000, 550100, NULL),
(550140, 'E', 'MEMBERSHIP FEE', NULL, NULL, 500000, 550000, 550100, NULL),
(560000, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560000, NULL),
(560100, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560100, NULL),
(560110, 'E', 'BANK CHARGES', NULL, NULL, 500000, 560000, 560100, NULL),
(560111, 'E', 'FEE CHARGED', NULL, NULL, 500000, 560000, 560100, NULL),
(570000, 'E', 'DEPRICIATION', NULL, NULL, 500000, 570000, 570000, NULL),
(570100, 'E', 'DEPRICIATION', NULL, NULL, 500000, 570000, 570100, NULL),
(580100, 'E', 'TAXES:-', NULL, NULL, 500000, 580000, 580100, NULL),
(580120, 'E', 'TAX PAYABLE', NULL, NULL, 500000, 580000, 580120, NULL),
(580130, 'E', 'SALES TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(580135, 'E', 'INCOME TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(580140, 'E', 'PROFESSIONAL TAX (EXCISE)', NULL, NULL, 500000, 580000, 580100, NULL),
(580145, 'E', 'TOLL TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(590000, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590000, NULL),
(590100, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590101, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590104, 'E', 'OFFICE EXPENCE.', NULL, NULL, 500000, 590000, 590100, NULL),
(590105, 'E', 'OFFICE RENT.', NULL, NULL, 500000, 590000, 590100, NULL),
(590106, 'E', 'COMPUTER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590107, 'E', 'BAD DEBTS ', NULL, NULL, 500000, 590000, 590100, NULL),
(590108, 'E', 'CASH SHORT /EXCESS', NULL, NULL, 500000, 590000, 590100, NULL),
(590109, 'E', 'PREVIOUS PERIOD P&L.', NULL, NULL, 500000, 590000, 590100, NULL),
(600000, 'S', 'SUSPENSE', NULL, NULL, 600000, 600000, 600000, NULL),
(610100, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL),
(610101, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL),
(610102, 'S', 'CLEARING ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL),
(610103, 'S', 'CHEQUE ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL),
(610104, 'S', 'EXCESS & SHORT ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyID` int(8) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `Name2` varchar(255) DEFAULT NULL,
  `TRN` varchar(150) DEFAULT NULL COMMENT 'tax registration no',
  `Currency` varchar(3) DEFAULT NULL,
  `Mobile` varchar(75) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `BackgroundLogo` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Signature` varchar(255) DEFAULT NULL,
  `DigitalSignature` varchar(255) DEFAULT NULL,
  `EstimateInvoiceTitle` varchar(150) DEFAULT NULL,
  `SaleInvoiceTitle` varchar(150) DEFAULT NULL,
  `DeliveryChallanTitle` varchar(150) DEFAULT NULL,
  `CreditNoteTitle` varchar(150) DEFAULT NULL,
  `PurchaseInvoiceTitle` varchar(150) DEFAULT NULL,
  `DebitNoteTitle` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyID`, `Name`, `Name2`, `TRN`, `Currency`, `Mobile`, `Contact`, `Email`, `Website`, `Address`, `Logo`, `BackgroundLogo`, `CreatedDate`, `UpdatedDate`, `Signature`, `DigitalSignature`, `EstimateInvoiceTitle`, `SaleInvoiceTitle`, `DeliveryChallanTitle`, `CreditNoteTitle`, `PurchaseInvoiceTitle`, `DebitNoteTitle`) VALUES
(1, 'Extensive IT Services', NULL, '123456789', 'AED', NULL, '+971 4 584 8310', 'info@eits.ae', 'www.eits.ae', 'Office #1807 Clover Bay Tower, Business Bay - Dubai', '1673075815.png', '1673075815.png', '2023-01-07 07:16:55', '2023-01-07 07:16:55', '1670523242.png', '<h2><strong>Finance Director,</strong></h2>\r\n\r\n<p><strong>Kashif</strong></p>', 'Quotation', 'Sale Inoice by', 'Delivery Note', 'Credit Note', 'Purchase Bill', 'Debit Note');

-- --------------------------------------------------------

--
-- Table structure for table `estimate_detail`
--

CREATE TABLE `estimate_detail` (
  `EstimateDetailID` int(8) NOT NULL,
  `EstimateMasterID` int(8) NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Qty` int(8) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_master`
--

CREATE TABLE `estimate_master` (
  `EstimateMasterID` int(8) NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `WalkinCustomerName` varchar(55) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `TaxType` varchar(25) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int(8) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_detail`
--

CREATE TABLE `expense_detail` (
  `ExpenseDetailID` int(8) NOT NULL,
  `ExpenseMasterID` int(8) DEFAULT NULL,
  `ChartOfAccountID` int(10) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_master`
--

CREATE TABLE `expense_master` (
  `ExpenseMasterID` int(8) NOT NULL,
  `ExpenseNo` varchar(55) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChartOfAccountID` int(9) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `ReferenceNo` varchar(55) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `GrantTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `InvoiceDetailID` int(8) NOT NULL,
  `InvoiceMasterID` int(8) DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `Qty` int(8) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(10,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail_ssss`
--

CREATE TABLE `invoice_detail_ssss` (
  `InvoiceDetailID` int(8) NOT NULL,
  `InvoiceMasterID` int(8) DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `JobType` varchar(99) DEFAULT '',
  `Mode` varchar(255) DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `BL_AWB` varchar(255) DEFAULT '',
  `FCL_LCL` varchar(75) DEFAULT NULL,
  `ETA` date DEFAULT NULL,
  `DeliveryPerson` varchar(75) DEFAULT NULL,
  `Status` varchar(75) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `GrossAmount` double(12,2) DEFAULT NULL,
  `VATRate` double(12,2) DEFAULT NULL,
  `VATAmount` double(12,2) DEFAULT NULL,
  `AmountAfterVAT` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE `invoice_master` (
  `InvoiceMasterID` int(8) NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int(8) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `TaxType` varchar(55) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(10,2) DEFAULT NULL,
  `DiscountPer` double(10,2) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL,
  `DiscountAmount` double(10,2) DEFAULT NULL,
  `TaxPer` double(10,2) DEFAULT NULL,
  `Tax` double(10,2) DEFAULT NULL,
  `Shipping` double(10,2) DEFAULT NULL,
  `GrandTotal` double(10,2) DEFAULT NULL,
  `Paid` double(10,2) DEFAULT NULL,
  `Balance` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master_ssss`
--

CREATE TABLE `invoice_master_ssss` (
  `InvoiceMasterID` int(8) NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int(8) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `TaxType` varchar(55) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(10,2) DEFAULT NULL,
  `DiscountPer` double(10,2) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL,
  `DiscountAmount` double(10,2) DEFAULT NULL,
  `TaxPer` double(10,2) DEFAULT NULL,
  `Tax` double(10,2) DEFAULT NULL,
  `Shipping` double(10,2) DEFAULT NULL,
  `GrandTotal` double(10,2) DEFAULT NULL,
  `Paid` double(10,2) DEFAULT NULL,
  `Balance` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_type`
--

CREATE TABLE `invoice_type` (
  `InvoiceTypeID` int(8) NOT NULL,
  `InvoiceType` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_type`
--

INSERT INTO `invoice_type` (`InvoiceTypeID`, `InvoiceType`) VALUES
(1, 'Tax Invoice'),
(2, 'Invoice'),
(3, 'Proforma Invoice');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(8) NOT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCode` varchar(5) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int(9) DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int(8) DEFAULT NULL,
  `SellingDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemType`, `ItemCode`, `ItemName`, `UnitName`, `Taxable`, `Percentage`, `CostPrice`, `CostChartofAccountID`, `CostDescription`, `SellingPrice`, `SellingChartofAccountID`, `SellingDescription`) VALUES
(22, NULL, NULL, 'HANDLING', NULL, 'Yes', 5.00, 80.00, NULL, NULL, 100.00, NULL, NULL),
(23, NULL, NULL, 'Malaysia Silver Pkg', NULL, 'No', NULL, 5000.00, NULL, NULL, 5500.00, NULL, NULL),
(24, NULL, NULL, 'Sales', NULL, 'No', NULL, 80.00, NULL, NULL, 80.00, NULL, NULL),
(25, NULL, NULL, '16mm Silver', NULL, 'No', NULL, 42.00, NULL, NULL, 36.00, NULL, NULL),
(26, NULL, NULL, '16mm Golden', NULL, 'No', NULL, 42.00, NULL, NULL, 36.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item__`
--

CREATE TABLE `item__` (
  `ItemID` int(8) NOT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCode` varchar(5) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int(9) DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int(8) DEFAULT NULL,
  `SellingDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item__`
--

INSERT INTO `item__` (`ItemID`, `ItemType`, `ItemCode`, `ItemName`, `UnitName`, `Taxable`, `Percentage`, `CostPrice`, `CostChartofAccountID`, `CostDescription`, `SellingPrice`, `SellingChartofAccountID`, `SellingDescription`) VALUES
(7, 'Service', NULL, 'Approval', 'lb', 'Yes', 4.76, 56.00, NULL, NULL, 55.00, NULL, NULL),
(8, 'Service', 'CO', 'Covid Test', NULL, 'No', 4.76, NULL, NULL, NULL, 88.00, NULL, NULL),
(9, 'Service', 'V1', 'Dubai Visa 1 Month', NULL, 'No', 4.76, NULL, NULL, NULL, 99.00, NULL, NULL),
(10, 'Service', 'V2', 'Dubai Visa 3 Months', NULL, 'No', 4.76, NULL, NULL, NULL, 100.00, NULL, NULL),
(11, 'Service', 'V3', 'Dubai Visa 30 Days Inside', NULL, 'No', 4.76, NULL, NULL, NULL, 1011.00, NULL, NULL),
(12, 'Service', 'V4', 'Dubai Visa 90 Days Inside', NULL, 'Yes', 4.76, NULL, NULL, NULL, 1012.00, NULL, NULL),
(13, 'Service', 'FR', 'Freelance', NULL, 'No', 4.76, NULL, NULL, NULL, 1013.00, NULL, NULL),
(14, 'Service', 'H', 'Hotel Booking', NULL, 'Yes', 4.76, 11.00, NULL, '321', 1014.00, NULL, '68'),
(15, 'Service', 'KS', 'KSA', NULL, 'No', 4.76, NULL, NULL, NULL, 1015.00, NULL, NULL),
(16, 'Service', 'S', 'Safari', NULL, 'No', 4.76, NULL, NULL, NULL, 1016.00, NULL, NULL),
(17, 'Service', 'T', 'Ticket Charges', NULL, 'No', 4.76, NULL, NULL, NULL, 1017.00, NULL, NULL),
(18, 'Service', 'V', 'Visa 30 Days', NULL, 'No', 4.76, NULL, NULL, NULL, 1018.00, NULL, NULL),
(19, NULL, 'DD', 'DD', NULL, 'No', 4.76, NULL, NULL, NULL, 1019.00, NULL, NULL),
(20, NULL, 'DD', 'DDDD', NULL, 'No', 4.76, NULL, NULL, NULL, 2000.00, NULL, NULL),
(21, NULL, NULL, 'Totex Hair Mask  Keratine 500 ML', NULL, 'Yes', 4.76, NULL, NULL, NULL, 1800.00, NULL, NULL),
(22, NULL, NULL, 'Pepsi 1 Ltr', NULL, 'Yes', 4.76, 80.00, NULL, NULL, 100.00, NULL, NULL),
(23, NULL, NULL, '16mm silver', NULL, 'No', NULL, 33.00, NULL, NULL, 42.00, NULL, NULL),
(24, NULL, NULL, '16mm Gold', NULL, 'No', NULL, 56.00, NULL, NULL, 56.00, NULL, NULL),
(25, NULL, NULL, '16mm Gold', NULL, 'No', NULL, 56.00, NULL, NULL, 56.00, NULL, NULL),
(26, NULL, NULL, '16mm Gold', NULL, 'No', NULL, 56.00, NULL, NULL, 56.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `JournalID` int(10) NOT NULL,
  `VHNO` varchar(15) DEFAULT NULL,
  `JournalType` varchar(10) DEFAULT NULL,
  `ChartOfAccountID` int(8) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `VoucherMstID` int(12) DEFAULT NULL,
  `PettyMstID` int(12) DEFAULT NULL,
  `InvoiceMasterID` int(12) DEFAULT NULL,
  `ExpenseMasterID` int(8) DEFAULT NULL,
  `PaymentMasterID` int(8) DEFAULT NULL,
  `PurchasePaymentMasterID` int(8) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Dr` double(10,2) DEFAULT NULL,
  `Cr` double(10,2) DEFAULT NULL,
  `Trace` decimal(10,0) DEFAULT NULL,
  `BankReconcile` varchar(15) DEFAULT NULL,
  `ReconcileDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_10_10_143303_create_attendances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `PartyID` int(8) NOT NULL,
  `PartyName` varchar(150) DEFAULT NULL,
  `TRN` varchar(150) DEFAULT '',
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(175) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int(10) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`PartyID`, `PartyName`, `TRN`, `Address`, `City`, `Mobile`, `Phone`, `Email`, `Website`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, 'Walkin Customer', '1234', '000000', NULL, '0000', '00000', '00000', '0000', 'Yes', 0, '2022-07-08 04:12:14'),
(1002, 'kashif mushtaq', '6789', 'Kashif House, Khyber colony No 1, Tehkal Payan', 'Peshawar', '+923349047993', '+923349047993', 'kashif@inu.edu.pk', 'teqholic.com', 'No', 5, '2022-01-16 17:59:43'),
(1012, 'SAJID SB PAK', '1256', 'Kashif House, Khyber colony No 1, Tehkal Payan', NULL, NULL, '+923349047993', 'kashif@inu.edu.pk', NULL, 'Yes', 90, '2022-01-16 17:59:49'),
(1023, 'LIGHT SPEED', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:58'),
(1044, 'MALIK MAQSOOD AGENT', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:20'),
(1053, 'SADAF TRAVELS', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:46'),
(1576, 'COZMO  TRAVEL', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:23'),
(1680, 'KSA', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:55'),
(1700, 'MESSZAN TRV', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:34'),
(2213, 'Kamal Mehmood', '1256', 'Kashif House, Khyber colony No 1, Tehkal Payan', NULL, NULL, '+923349047993', 'kashif@inu.edu.pk', NULL, 'Yes', NULL, '2022-03-06 04:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `PaymentDetailID` int(8) NOT NULL,
  `PaymentMasterID` int(8) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int(8) DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE `payment_master` (
  `PaymentMasterID` int(8) NOT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int(12) DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `ID` int(8) NOT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`ID`, `PaymentMode`) VALUES
(1, 'Cash'),
(2, 'Bank Transfer'),
(3, 'Cheque'),
(4, 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_detail`
--

CREATE TABLE `pettycash_detail` (
  `PettyDetID` int(10) NOT NULL,
  `PettyMstID` int(10) DEFAULT NULL,
  `PettyVoucher` varchar(12) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChOfAcc` int(8) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Invoice` varchar(35) DEFAULT NULL,
  `RefNo` varchar(35) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `FromChOfAcc` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `pettycash_detail`
--
DELIMITER $$
CREATE TRIGGER `delete` AFTER DELETE ON `pettycash_detail` FOR EACH ROW begin
delete from journal where PettyMstID = old.PettyMstID;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal` AFTER INSERT ON `pettycash_detail` FOR EACH ROW begin
declare chart_name varchar(25);
select ChartOfAccountName into chart_name from chartofaccount where ChartOfAccountID=new.ChOfAcc;

INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Cr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.FromChOfAcc,new.PettyMstID,concat(new.Narration,' (', chart_name,') '),new.Date,new.Debit);


INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Dr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.ChOfAcc,new.PettyMstID,new.Narration,new.Date,new.Debit);


end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_master`
--

CREATE TABLE `pettycash_master` (
  `PettyMstID` int(12) NOT NULL,
  `PettyVoucher` varchar(11) DEFAULT NULL,
  `ChOfAcc` int(8) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(8) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `price` varchar(55) DEFAULT NULL,
  `details` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `details`) VALUES
(1, 'Kashif', '55', '55'),
(2, 'Mu', '55', '66'),
(3, 'usma', NULL, NULL),
(4, 'khan', NULL, NULL),
(5, 'pakistna', NULL, NULL),
(6, 'india', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_detail`
--

CREATE TABLE `purchasepayment_detail` (
  `PurchasePaymentDetailID` int(8) NOT NULL,
  `PurchasePaymentMasterID` int(8) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int(8) DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_master`
--

CREATE TABLE `purchasepayment_master` (
  `PurchasePaymentMasterID` int(8) NOT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int(12) DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

CREATE TABLE `purchase_order_detail` (
  `PurchaseOrderDetailID` int(8) NOT NULL,
  `PurchaseOrderMasterID` int(8) NOT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int(8) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `Qty` varchar(10) DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_master`
--

CREATE TABLE `purchase_order_master` (
  `PurchaseOrderMasterID` int(8) NOT NULL,
  `PON` varchar(10) DEFAULT NULL,
  `SupplierID` int(8) DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `PONotes` varchar(255) DEFAULT NULL,
  `DeliveryNotes` longtext,
  `UserID` int(8) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(8) NOT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(1) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `Table`, `Action`, `Allow`) VALUES
(1, 'Invoice', 'List', 'Y'),
(12, 'Invoice', 'Create', 'Y'),
(13, 'Invoice', 'Update', 'Y'),
(14, 'Invoice', 'Delete', 'Y'),
(15, 'Invoice', 'View', 'Y'),
(16, 'Invoice', 'PDF', 'Y'),
(63, 'Voucher', 'List', 'Y'),
(64, 'Voucher', 'Create', 'Y'),
(65, 'Voucher', 'Update', 'Y'),
(66, 'Voucher', 'Delete', 'Y'),
(67, 'Voucher', 'View', 'Y'),
(68, 'Petty Cash', 'List', 'Y'),
(69, 'Petty Cash', 'Create', 'Y'),
(70, 'Petty Cash', 'Update', 'Y'),
(71, 'Petty Cash', 'Delete', 'Y'),
(72, 'Petty Cash', 'View', 'Y'),
(73, 'Adjustment Balance', 'Create', 'Y'),
(74, 'Chart of Account', 'List / Create', 'Y'),
(75, 'Chart of Account', 'Update', 'Y'),
(76, 'Chart of Account', 'Delete', 'Y'),
(77, 'Item/Inventory', 'List / Create', 'Y'),
(78, 'Item/Inventory', 'Update', 'Y'),
(79, 'Item/Inventory', 'Delete', 'Y'),
(80, 'Party / Customers', 'List / Create', 'Y'),
(81, 'Party / Customers', 'Update', 'Y'),
(82, 'Party / Customers', 'Delete', 'Y'),
(83, 'Supplier', 'List / Create', 'Y'),
(84, 'Supplier', 'Update', 'Y'),
(85, 'Supplier', 'Delete', 'Y'),
(86, 'User', 'List / Create', 'Y'),
(87, 'User', 'Update', 'Y'),
(88, 'User', 'Delete', 'Y'),
(89, 'User Rights', 'Assign', 'Y'),
(90, 'Party Ledger', 'View', 'Y'),
(91, 'Party Ledger', 'PDF', 'Y'),
(92, 'Party Balance', 'View', 'Y'),
(93, 'Party Balance', 'PDF', 'Y'),
(94, 'Yearly Report', 'View', 'Y'),
(95, 'Yearly Report', 'PDF', 'Y'),
(96, 'Ageing Report', 'View', 'Y'),
(97, 'Ageing Report', 'PDF', 'Y'),
(98, 'Party Analysis', 'View', 'Y'),
(99, 'Party Analysis', 'PDF', 'Y'),
(100, 'Party List', 'View', 'Y'),
(101, 'Party List', 'PDF', 'Y'),
(102, 'Outstanding Invoices', 'View', 'Y'),
(103, 'Outstanding Invoices', 'PDF', 'Y'),
(104, 'Supplier Ledger', 'View', 'Y'),
(105, 'Supplier Ledger', 'PDF', 'Y'),
(106, 'Supplier Balance', 'View', 'Y'),
(107, 'Supplier Balance', 'PDF', 'Y'),
(108, 'Sale Invoice', 'View', 'Y'),
(109, 'Sale Invoice', 'PDF', 'Y'),
(110, 'Ticket Register', 'View', 'Y'),
(111, 'Ticket Register', 'PDF', 'Y'),
(112, 'Airline Summary', 'View', 'Y'),
(113, 'Airline Summary', 'PDF', 'Y'),
(114, 'Sale Man Report', 'View', 'Y'),
(115, 'Sale Man Report', 'PDF', 'Y'),
(116, 'Tax Report', 'View', 'Y'),
(117, 'Tax Report', 'PDF', 'Y'),
(118, 'Sales Report', 'View', 'Y'),
(119, 'Sales Report', 'PDF', 'Y'),
(120, 'Voucher Report', 'View', 'Y'),
(121, 'Voucher Report', 'PDF', 'Y'),
(122, 'Cash Book', 'View', 'Y'),
(123, 'Cash Book', 'PDF', 'Y'),
(124, 'Day Book', 'View', 'Y'),
(125, 'Day Book', 'PDF', 'Y'),
(126, 'General Ledger', 'View', 'Y'),
(127, 'General Ledger', 'PDF', 'Y'),
(128, 'Trial Balance', 'View', 'Y'),
(129, 'Trial Balance', 'PDF', 'Y'),
(130, 'Trial with Activity', 'View', 'Y'),
(131, 'Trial with Activity', 'PDF', 'Y'),
(132, 'Yearly Summary', 'View', 'Y'),
(133, 'Yearly Summary', 'PDF', 'Y'),
(134, 'Profit & Loss ', 'View', 'Y'),
(135, 'Profit & Loss ', 'PDF', 'Y'),
(136, 'Balance Sheet', 'View', 'Y'),
(137, 'Balance Sheet', 'PDF', 'Y'),
(138, 'Invoice Summary', 'View', 'Y'),
(139, 'Invoice Summary', 'PDF', 'Y'),
(140, 'Party Wise Sale', 'View', 'Y'),
(141, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `runtotaltestdata`
--

CREATE TABLE `runtotaltestdata` (
  `id` int(8) NOT NULL,
  `value` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runtotaltestdata`
--

INSERT INTO `runtotaltestdata` (`id`, `value`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 7),
(5, 9),
(6, 12),
(7, 13),
(8, 16),
(9, 22),
(10, 42),
(11, 57),
(12, 58),
(13, 59),
(14, 60);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(8) NOT NULL,
  `SupplierName` varchar(150) DEFAULT NULL,
  `TRN` varchar(75) DEFAULT NULL COMMENT 'tax regsitration no',
  `Address` varchar(75) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int(10) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `TRN`, `Address`, `Mobile`, `Phone`, `Email`, `Website`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, 'Walkin Supplier', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-07-20 18:35:02'),
(1002, 'RAHAT TRAVEL AGENT', '1256789999', 'Kashif House, Khyber colony No 1, Tehkal Payan', '03349047993', '22', 'kashif@inu.edu.pk', 'home.com', 'No', 5, '2022-01-16 17:59:43'),
(1012, 'SAJID SB PAK', NULL, 'Kashif House, Khyber colony No 1, Tehkal Payan', NULL, '+923349047993', 'kashif@inu.edu.pk', NULL, 'Yes', 90, '2022-01-16 17:59:49'),
(1023, 'LIGHT SPEED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:58'),
(1029, 'AL DIYAFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:02'),
(1030, 'AKBAR TRAVEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:57:57'),
(1032, 'PIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:36'),
(1033, 'AIR BLUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:57:49'),
(1043, 'STATIONERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:54'),
(1044, 'MALIK MAQSOOD AGENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:20'),
(1053, 'SADAF TRAVELS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:46'),
(1076, 'FCB LOAN AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:29'),
(1094, 'HADAF TRAVEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:45'),
(1172, 'AMR  TRAVEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:08'),
(1309, 'FREELANCE VISAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:33'),
(1410, 'HOTEL BOOKINGS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:49'),
(1576, 'COZMO  TRAVEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:23'),
(1665, 'DGRFA APPROVAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:40'),
(1666, 'MARSHAL TRAVEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:26'),
(1680, 'KSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:55'),
(1700, 'MESSZAN TRV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:34'),
(1735, 'COVID REST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:12'),
(1790, 'ISB TRV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:53'),
(2072, 'AL HIND TRV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:05'),
(2211, 'DUMMY TICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:26'),
(2212, 'test2', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-03-28 12:46:42'),
(2213, 'DD', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-04-11 06:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `SupplierCatID` int(8) NOT NULL,
  `SupplierCode` varchar(10) DEFAULT NULL,
  `SupplierCategory` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_category`
--

INSERT INTO `supplier_category` (`SupplierCatID`, `SupplierCode`, `SupplierCategory`) VALUES
(1, 'C', 'Customer'),
(2, 'VC', 'Airline Customer'),
(3, 'EC', 'Employee'),
(4, 'X', 'Discontinued'),
(5, 'XC', 'Bad Debds'),
(6, 'VS', 'Supplier'),
(7, 'BC', 'Old Bad Debts');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `TaxID` int(255) NOT NULL,
  `TaxPer` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Section` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`TaxID`, `TaxPer`, `Description`, `Section`) VALUES
(1, '0', '[0%] Tax ', 'Invoice'),
(2, '5', '[4.76%] Tax', 'Invoice'),
(3, '0', '[0%] Tax ', 'Estimate'),
(4, '4.76', '[5%] Tax', 'Estimate');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int(8) NOT NULL,
  `UnitName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `UnitName`) VALUES
(1, 'box'),
(2, 'cm'),
(3, 'dz'),
(4, 'ft'),
(5, 'g'),
(6, 'in'),
(7, 'kg'),
(8, 'km'),
(9, 'lb'),
(10, 'mg'),
(11, 'm'),
(12, 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(8) NOT NULL,
  `FullName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `UserType` varchar(25) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` varchar(5) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FullName`, `Email`, `Password`, `UserType`, `eDate`, `Active`) VALUES
(1, 'Extensive Accounting', 'demo@extbooks.com', '123456', 'Admin', '2023-01-07 07:13:48', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `RoleId` int(8) NOT NULL,
  `UserID` int(8) DEFAULT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(10) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`RoleId`, `UserID`, `Table`, `Action`, `Allow`) VALUES
(4301, 1, 'Invoice', 'List', 'Y'),
(4302, 1, 'Invoice', 'Create', 'Y'),
(4303, 1, 'Invoice', 'Update', 'Y'),
(4304, 1, 'Invoice', 'Delete', 'Y'),
(4305, 1, 'Invoice', 'View', 'Y'),
(4306, 1, 'Invoice', 'PDF', 'Y'),
(4307, 1, 'Voucher', 'List', 'Y'),
(4308, 1, 'Voucher', 'Create', 'Y'),
(4309, 1, 'Voucher', 'Update', 'Y'),
(4310, 1, 'Voucher', 'Delete', 'Y'),
(4311, 1, 'Voucher', 'View', 'Y'),
(4312, 1, 'Petty Cash', 'List', 'Y'),
(4313, 1, 'Petty Cash', 'Create', 'Y'),
(4314, 1, 'Petty Cash', 'Update', 'Y'),
(4315, 1, 'Petty Cash', 'Delete', 'Y'),
(4316, 1, 'Petty Cash', 'View', 'Y'),
(4317, 1, 'Adjustment Balance', 'Create', 'Y'),
(4318, 1, 'Chart of Account', 'List / Create', 'Y'),
(4319, 1, 'Chart of Account', 'Update', 'Y'),
(4320, 1, 'Chart of Account', 'Delete', 'Y'),
(4321, 1, 'Item/Inventory', 'List / Create', 'Y'),
(4322, 1, 'Item/Inventory', 'Update', 'Y'),
(4323, 1, 'Item/Inventory', 'Delete', 'Y'),
(4324, 1, 'Party / Customers', 'List / Create', 'Y'),
(4325, 1, 'Party / Customers', 'Update', 'Y'),
(4326, 1, 'Party / Customers', 'Delete', 'Y'),
(4327, 1, 'Supplier', 'List / Create', 'Y'),
(4328, 1, 'Supplier', 'Update', 'Y'),
(4329, 1, 'Supplier', 'Delete', 'Y'),
(4330, 1, 'User', 'List / Create', 'Y'),
(4331, 1, 'User', 'Update', 'Y'),
(4332, 1, 'User', 'Delete', 'Y'),
(4333, 1, 'User Rights', 'Assign', 'Y'),
(4334, 1, 'Party Ledger', 'View', 'Y'),
(4335, 1, 'Party Ledger', 'PDF', 'Y'),
(4336, 1, 'Party Balance', 'View', 'Y'),
(4337, 1, 'Party Balance', 'PDF', 'Y'),
(4338, 1, 'Yearly Report', 'View', 'Y'),
(4339, 1, 'Yearly Report', 'PDF', 'Y'),
(4340, 1, 'Ageing Report', 'View', 'Y'),
(4341, 1, 'Ageing Report', 'PDF', 'Y'),
(4342, 1, 'Party Analysis', 'View', 'Y'),
(4343, 1, 'Party Analysis', 'PDF', 'Y'),
(4344, 1, 'Party List', 'View', 'Y'),
(4345, 1, 'Party List', 'PDF', 'Y'),
(4346, 1, 'Outstanding Invoices', 'View', 'Y'),
(4347, 1, 'Outstanding Invoices', 'PDF', 'Y'),
(4348, 1, 'Supplier Ledger', 'View', 'Y'),
(4349, 1, 'Supplier Ledger', 'PDF', 'Y'),
(4350, 1, 'Supplier Balance', 'View', 'Y'),
(4351, 1, 'Supplier Balance', 'PDF', 'Y'),
(4352, 1, 'Sale Invoice', 'View', 'Y'),
(4353, 1, 'Sale Invoice', 'PDF', 'Y'),
(4354, 1, 'Ticket Register', 'View', 'Y'),
(4355, 1, 'Ticket Register', 'PDF', 'Y'),
(4356, 1, 'Airline Summary', 'View', 'Y'),
(4357, 1, 'Airline Summary', 'PDF', 'Y'),
(4358, 1, 'Sale Man Report', 'View', 'Y'),
(4359, 1, 'Sale Man Report', 'PDF', 'Y'),
(4360, 1, 'Tax Report', 'View', 'Y'),
(4361, 1, 'Tax Report', 'PDF', 'Y'),
(4362, 1, 'Sales Report', 'View', 'Y'),
(4363, 1, 'Sales Report', 'PDF', 'Y'),
(4364, 1, 'Voucher Report', 'View', 'Y'),
(4365, 1, 'Voucher Report', 'PDF', 'Y'),
(4366, 1, 'Cash Book', 'View', 'Y'),
(4367, 1, 'Cash Book', 'PDF', 'Y'),
(4368, 1, 'Day Book', 'View', 'Y'),
(4369, 1, 'Day Book', 'PDF', 'Y'),
(4370, 1, 'General Ledger', 'View', 'Y'),
(4371, 1, 'General Ledger', 'PDF', 'Y'),
(4372, 1, 'Trial Balance', 'View', 'Y'),
(4373, 1, 'Trial Balance', 'PDF', 'Y'),
(4374, 1, 'Trial with Activity', 'View', 'Y'),
(4375, 1, 'Trial with Activity', 'PDF', 'Y'),
(4376, 1, 'Yearly Summary', 'View', 'Y'),
(4377, 1, 'Yearly Summary', 'PDF', 'Y'),
(4378, 1, 'Profit & Loss', 'View', 'Y'),
(4379, 1, 'Profit & Loss', 'PDF', 'Y'),
(4380, 1, 'Balance Sheet', 'View', 'Y'),
(4381, 1, 'Balance Sheet', 'PDF', 'Y'),
(4382, 1, 'Invoice Summary', 'View', 'Y'),
(4383, 1, 'Invoice Summary', 'PDF', 'Y'),
(4384, 1, 'Party Wise Sale', 'View', 'Y'),
(4385, 1, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_detail`
--

CREATE TABLE `voucher_detail` (
  `VoucherDetID` int(12) NOT NULL,
  `VoucherMstID` int(12) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `ChOfAcc` int(10) DEFAULT NULL,
  `PartyID` int(8) DEFAULT NULL,
  `SupplierID` int(12) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `InvoiceNo` varchar(75) DEFAULT NULL,
  `RefNo` varchar(75) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `voucher_detail`
--
DELIMITER $$
CREATE TRIGGER `beforeinsert` AFTER INSERT ON `voucher_detail` FOR EACH ROW begin
 
INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,SupplierID,VoucherMstID,Narration,Date,Dr,Cr,PartyID) 
values (new.Voucher,SUBSTRING(new.Voucher,1,2),new.ChOfAcc,new.SupplierID,new.VoucherMstID,new.Narration,new.Date,new.Debit,new.Credit,new.PartyID);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_master`
--

CREATE TABLE `voucher_master` (
  `VoucherMstID` int(12) NOT NULL,
  `VoucherCodeID` int(10) DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_type`
--

CREATE TABLE `voucher_type` (
  `VoucherTypeID` int(8) NOT NULL,
  `VoucherCode` varchar(35) DEFAULT NULL,
  `VoucherTypeName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_type`
--

INSERT INTO `voucher_type` (`VoucherTypeID`, `VoucherCode`, `VoucherTypeName`) VALUES
(1, 'BP', 'BANK PAYMENT'),
(2, 'BR', 'BANK RECEIPT'),
(3, 'CN', 'CREDIT NOTE'),
(4, 'CP', 'CASH PAYMENT'),
(5, 'CR', 'CASH RECEIPT'),
(6, 'DN', 'DEBIT NOTES'),
(7, 'JV', 'JOURNAL VOUCHER'),
(8, 'CC', 'CREDIT CARD');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cashflow`
-- (See below for the actual view)
--
CREATE TABLE `v_cashflow` (
`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_detail` (
`ChallanDetailID` int(8)
,`ChallanMasterID` int(8)
,`ChallanNo` varchar(10)
,`ChallanDate` date
,`ItemID` int(8)
,`Qty` int(8)
,`Rate` double(8,2)
,`TaxAmount` double(8,2)
,`TaxPer` double(8,2)
,`Discount` double(8,2)
,`Total` double(8,2)
,`ItemType` varchar(55)
,`ItemCode` varchar(5)
,`ItemName` varchar(55)
,`UnitName` varchar(10)
,`Description` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_master`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_master` (
`ChallanMasterID` int(8)
,`ChallanNo` varchar(10)
,`PartyID` int(8)
,`PartyName` varchar(150)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`ChallanDate` varchar(10)
,`ChallanType` varchar(25)
,`Total` double(8,2)
,`CustomerNotes` varchar(255)
,`TermAndCondition` varchar(255)
,`File` varchar(75)
,`TRN` varchar(150)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(25)
,`Email` varchar(25)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`eDate` timestamp
,`Subject` varchar(255)
,`DescriptionNotes` varchar(255)
,`WalkinCustomerName` varchar(75)
,`DiscountPer` double(8,2)
,`SubTotal` double(8,2)
,`DiscountAmount` double(8,2)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`Shipping` double(8,2)
,`GrandTotal` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount` (
`ChartOfAccountID` int(12)
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount_mini`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount_mini` (
`ChartOfAccountID` int(12)
,`CODE` varchar(15)
,`ChartOfAccountName` varchar(75)
,`OpenDebit` int(12)
,`OpenCredit` int(12)
,`L1` int(10)
,`L2` int(10)
,`L3` int(10)
,`Category` varchar(55)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_delivery_challan`
-- (See below for the actual view)
--
CREATE TABLE `v_delivery_challan` (
`ChallanMasterID` int(8)
,`ChallanNo` varchar(10)
,`PartyID` int(8)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`ChallanDate` date
,`ChallanType` varchar(25)
,`Total` double(8,2)
,`CustomerNotes` varchar(255)
,`TermAndCondition` varchar(255)
,`File` varchar(75)
,`UserID` int(8)
,`PartyName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`TRN` varchar(150)
,`Mobile` varchar(150)
,`Website` varchar(150)
,`eDate` timestamp
,`Subject` varchar(255)
,`DescriptionNotes` varchar(255)
,`WalkinCustomerName` varchar(75)
,`SubTotal` double(8,2)
,`DiscountPer` double(8,2)
,`DiscountAmount` double(8,2)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`Shipping` double(8,2)
,`GrandTotal` double(8,2)
,`Paid` double(8,2)
,`Balance` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_detail` (
`EstimateDetailID` int(8)
,`EstimateMasterID` int(8)
,`EstimateNo` varchar(10)
,`EstimateDate` date
,`ItemID` int(8)
,`ItemName` varchar(55)
,`Qty` int(8)
,`Rate` double(8,2)
,`Total` double(8,2)
,`Description` varchar(255)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_master`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_master` (
`EstimateMasterID` int(8)
,`EstimateNo` varchar(10)
,`PartyID` int(8)
,`PartyName` varchar(150)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`EstimateDate` date
,`Total` double(8,2)
,`CustomerNotes` varchar(255)
,`TermAndCondition` varchar(255)
,`File` varchar(75)
,`UserID` int(8)
,`Subject` varchar(255)
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`Date` date
,`SubTotal` double(8,2)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`DiscountPer` double(8,2)
,`Discount` double(8,2)
,`WalkinCustomerName` varchar(55)
,`Shipping` double(8,2)
,`DescriptionNotes` varchar(255)
,`ExpiryDate` date
,`GrandTotal` double(8,2)
,`TRN` varchar(150)
,`Mobile` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense`
-- (See below for the actual view)
--
CREATE TABLE `v_expense` (
`ExpenseMasterID` int(8)
,`Date` date
,`Date1` varchar(10)
,`ChartOfAccountID` int(9)
,`ChartOfAccountName` varchar(75)
,`SupplierID` int(8)
,`SupplierName` varchar(150)
,`ReferenceNo` varchar(55)
,`ExpenseNo` varchar(55)
,`GrantTotal` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_chart` (
`MonthName` varchar(69)
,`Balance` double(19,2)
,`ChartOfAccountName` varchar(75)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_detail` (
`ExpenseNo` varchar(55)
,`Date` date
,`ChartOfAccountName` varchar(75)
,`ExpenseDetailID` int(8)
,`ExpenseMasterID` int(8)
,`ChartOfAccountID` int(10)
,`Notes` varchar(255)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`Amount` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_master`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_master` (
`Date` date
,`ExpenseNo` varchar(55)
,`ChartOfAccountName` varchar(75)
,`ReferenceNo` varchar(55)
,`SupplierName` varchar(150)
,`GrantTotal` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_income_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_income_exp_chart` (
`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory` (
`ItemID` int(8)
,`ItemName` varchar(55)
,`UnitName` varchar(10)
,`SaleReturn` decimal(32,0)
,`QtyIn` decimal(32,0)
,`QtyOut` decimal(32,0)
,`Balance` decimal(34,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory_detail` (
`ItemID` int(8)
,`ItemName` varchar(55)
,`UnitName` varchar(10)
,`SaleReturn` bigint(11)
,`QtyIn` bigint(11)
,`QtyOut` bigint(11)
,`Date` date
,`InvoiceNo` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_bal`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_bal` (
`PartyID` int(8)
,`InvoiceMasterID` int(12)
,`INVOICE` double(19,2)
,`PAID` double(19,2)
,`due` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_balance` (
`InvoiceMasterID` int(8)
,`PartyID` int(8)
,`InvoiceNo` varchar(10)
,`INVOICE` double(19,2)
,`PAID` double(19,2)
,`BALANCE` double(19,2)
,`Date` date
,`DueDate` date
,`ReferenceNo` varchar(35)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_both`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_both` (
`InvoiceMasterID` int(8)
,`Date` date
,`UserID` int(8)
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(19,2)
,`DueDate` date
,`PartyName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int(8)
,`PartyID` int(8)
,`SubTotal` double(10,2)
,`DiscountPer` double(10,2)
,`DiscountAmount` double(10,2)
,`InvoiceType` varchar(30)
,`WalkinCustomerName` varchar(155)
,`DescriptionNotes` varchar(255)
,`TaxPer` double(10,2)
,`Tax` double(10,2)
,`Shipping` double(10,2)
,`GrandTotal` double(10,2)
,`Mobile` varchar(150)
,`TRN` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`eDate` timestamp
,`PaymentDetails` varchar(255)
,`FullName` varchar(55)
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_detail` (
`InvoiceNo` varchar(10)
,`Date` date
,`InvoiceDetailID` int(8)
,`InvoiceMasterID` int(8)
,`ItemID` int(8)
,`SupplierID` int(8)
,`PartyID` int(8)
,`Qty` int(8)
,`Rate` double(8,2)
,`Total` double(8,2)
,`ItemCode` varchar(5)
,`ItemName` varchar(55)
,`Description` varchar(255)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`InvoiceType` varchar(30)
,`Discount` double(8,2)
,`DiscountType` double(8,2)
,`DiscountAmountItem` double(10,2)
,`Gross` double(8,2)
,`PartyName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master` (
`InvoiceMasterID` int(8)
,`Date` date
,`UserID` int(8)
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(19,2)
,`DueDate` date
,`PartyName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int(8)
,`PartyID` int(8)
,`SubTotal` double(10,2)
,`DiscountPer` double(10,2)
,`DiscountAmount` double(10,2)
,`InvoiceType` varchar(30)
,`WalkinCustomerName` varchar(155)
,`DescriptionNotes` varchar(255)
,`TaxPer` double(10,2)
,`Tax` double(10,2)
,`Shipping` double(10,2)
,`GrandTotal` double(10,2)
,`Mobile` varchar(150)
,`TRN` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`eDate` timestamp
,`PaymentDetails` varchar(255)
,`FullName` varchar(55)
,`TaxType` varchar(55)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master_supplier` (
`InvoiceMasterID` int(8)
,`Date` date
,`UserID` int(8)
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(10,2)
,`DueDate` date
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int(8)
,`PartyID` int(8)
,`SubTotal` double(10,2)
,`DiscountPer` double(10,2)
,`DiscountAmount` double(10,2)
,`SupplierName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`WalkinCustomerName` varchar(155)
,`PaymentDetails` varchar(255)
,`DescriptionNotes` varchar(255)
,`GrandTotal` double(10,2)
,`Shipping` double(10,2)
,`Tax` double(10,2)
,`TaxPer` double(10,2)
,`TRN` varchar(75)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_party_balance` (
`PartyID` int(8)
,`BALANCE` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_balance` (
`InvoiceMasterID` int(12)
,`Balance` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_detail` (
`InvoiceMasterID` int(8)
,`InvoiceNo` varchar(10)
,`ItemID` int(8)
,`SupplierID` int(8)
,`Qty` int(8)
,`Rate` double(8,2)
,`ItemName` varchar(55)
,`Gross` double(8,2)
,`Total` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal`
-- (See below for the actual view)
--
CREATE TABLE `v_journal` (
`VHNO` varchar(15)
,`JournalType` varchar(10)
,`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`SupplierID` int(8)
,`VoucherMstID` int(12)
,`PettyMstID` int(12)
,`InvoiceMasterID` int(12)
,`Date` date
,`Dr` double(10,2)
,`Cr` double(10,2)
,`PartyID` int(8)
,`Narration` varchar(255)
,`L1` int(10)
,`L2` int(10)
,`L3` int(10)
,`CODE` varchar(15)
,`Trace` decimal(10,0)
,`BankReconcile` varchar(15)
,`ReconcileDate` timestamp
,`JournalID` int(10)
,`Category` varchar(55)
,`ExpenseMasterID` int(8)
,`PaymentMasterID` int(8)
,`PurchasePaymentMasterID` int(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal_report`
-- (See below for the actual view)
--
CREATE TABLE `v_journal_report` (
`InvoiceMasterID` int(8)
,`InvoiceNo` varchar(10)
,`Date` date
,`INVOICE` varchar(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_partywise_sale`
-- (See below for the actual view)
--
CREATE TABLE `v_partywise_sale` (
`PartyID` int(8)
,`PartyName` varchar(150)
,`InvoiceMasterID` int(8)
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Date` date
,`DueDate` date
,`WalkinCustomerName` varchar(155)
,`SupplierID` int(8)
,`ReferenceNo` varchar(35)
,`UserID` int(8)
,`PaymentMode` varchar(25)
,`PaymentDetails` varchar(255)
,`Subject` varchar(255)
,`DescriptionNotes` varchar(255)
,`CustomerNotes` varchar(255)
,`SubTotal` double(10,2)
,`DiscountPer` double(10,2)
,`Total` double(10,2)
,`DiscountAmount` double(10,2)
,`TaxPer` double(10,2)
,`Tax` double(10,2)
,`Shipping` double(10,2)
,`GrandTotal` double(10,2)
,`Paid` double(10,2)
,`Balance` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_aging`
-- (See below for the actual view)
--
CREATE TABLE `v_party_aging` (
`PartyID` int(8)
,`age7Days` double(19,2)
,`age15Days` double(19,2)
,`age30Days` double(19,2)
,`age60Days` double(19,2)
,`age90Days` double(19,2)
,`age90plusDays` double(19,2)
,`Total` double(19,2)
,`PartyName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_balance` (
`VHNO` varchar(15)
,`JournalType` varchar(10)
,`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`SupplierID` int(8)
,`VoucherMstID` int(12)
,`PettyMstID` int(12)
,`InvoiceMasterID` int(12)
,`Date` date
,`Dr` double(10,2)
,`Cr` double(10,2)
,`PartyID` int(8)
,`Narration` varchar(255)
,`PartyName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_montly_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_montly_balance` (
`Date` varchar(37)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
,`PartyID` int(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_payment` (
`PaymentMasterID` int(8)
,`PartyID` int(8)
,`PartyName` varchar(150)
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int(12)
,`ReferenceNo` varchar(35)
,`File` varchar(35)
,`Notes` longtext
,`eDate` timestamp
,`TRN` varchar(150)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(25)
,`Email` varchar(25)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_detail` (
`InvoiceNo` varchar(10)
,`PaymentDetailID` int(8)
,`PaymentMasterID` int(8)
,`PaymentDate` date
,`InvoiceMasterID` int(8)
,`Payment` double(8,2)
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_summary` (
`InvoiceMasterID` int(8)
,`Paid` double(19,2)
,`PaymentMasterID` int(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pettycash_master`
-- (See below for the actual view)
--
CREATE TABLE `v_pettycash_master` (
`PettyMstID` int(12)
,`PettyVoucher` varchar(11)
,`ChartOfAccountID` int(12)
,`CODE` varchar(15)
,`ChartOfAccountName` varchar(75)
,`Date` date
,`Narration` varchar(255)
,`Credit` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_detail` (
`PurchaseOrderDetailID` int(8)
,`PurchaseOrderMasterID` int(8)
,`Date` date
,`ItemID` int(8)
,`Description` varchar(255)
,`Rate` double(8,2)
,`Qty` varchar(10)
,`Unit` varchar(10)
,`DiscountPer` double(8,2)
,`Discount` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Amount` double(8,2)
,`Remarks` varchar(255)
,`ItemName` varchar(55)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_master` (
`PurchaseOrderMasterID` int(8)
,`PON` varchar(10)
,`SupplierID` int(8)
,`Date` date
,`PONotes` varchar(255)
,`UserID` int(8)
,`Subject` varchar(255)
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`ReferenceNo` varchar(255)
,`Tax` double(8,2)
,`GrandTotal` double(8,2)
,`eDate` timestamp
,`DeliveryDate` date
,`DeliveryNotes` longtext
,`SubTotal` double(8,2)
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment` (
`PurchasePaymentMasterID` int(8)
,`SupplierID` int(8)
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int(12)
,`ReferenceNo` varchar(35)
,`File` varchar(35)
,`Notes` longtext
,`eDate` timestamp
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment_master` (
`PurchasePaymentMasterID` int(8)
,`SupplierID` int(8)
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int(12)
,`ReferenceNo` varchar(35)
,`File` varchar(35)
,`Notes` longtext
,`eDate` timestamp
,`SupplierName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Active` varchar(3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_receivabledetail`
-- (See below for the actual view)
--
CREATE TABLE `v_receivabledetail` (
`InvoiceMasterID` int(8)
,`InvoiceNo` varchar(10)
,`Date` date
,`ReferenceNo` varchar(35)
,`InvoiceDetailID` int(8)
,`ItemID` int(8)
,`Qty` int(8)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(10,2)
,`PartyName` varchar(150)
,`Address` varchar(75)
,`PartyID` int(8)
,`SubTotal` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp` (
`Rev` double
,`Exp` double
,`DATE_FORMAT(date,'%M-%Y')` varchar(69)
,`date_format(``v_journal``.``Date``,'%m-%Y')` varchar(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp_chart` (
`Rev` double(17,0)
,`Exp` double(17,0)
,`MonthName` varchar(69)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier` (
`SupplierID` int(8)
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int(10)
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_balance` (
`SupplierID` int(8)
,`Date` varchar(37)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_outstanding`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_outstanding` (
`InvoiceMasterID` int(12)
,`PartyID` int(8)
,`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`InvoiceNo` varchar(10)
,`Date` date
,`DueDate` date
,`PAID` double(19,2)
,`BALANCE` double(19,2)
,`SupplierID` int(8)
,`GrandTotal` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_over_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_over_balance` (
`SupplierID` int(8)
,`BALANCE` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_test`
-- (See below for the actual view)
--
CREATE TABLE `v_test` (
`ItemID` int(8)
,`ItemName` varchar(55)
,`T1` int(8)
,`InvoiceMasterID` int(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial`
-- (See below for the actual view)
--
CREATE TABLE `v_trial` (
`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trialreport`
-- (See below for the actual view)
--
CREATE TABLE `v_trialreport` (
`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_trial_balance` (
`ChartOfAccountID` int(8)
,`ChartOfAccountName` varchar(75)
,`Dr` double(19,2)
,`Cr` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher` (
`VoucherMstID` int(12)
,`VoucherCode` varchar(35)
,`VoucherTypeName` varchar(35)
,`Voucher` varchar(15)
,`Date` date
,`Narration` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_detail` (
`VoucherMstID` int(12)
,`VoucherCodeID` int(10)
,`Voucher` varchar(15)
,`NarrationMaster` varchar(255)
,`Date` date
,`ChOfAcc` int(10)
,`ChartOfAccountName` varchar(75)
,`Debit` double(10,2)
,`Credit` double(10,2)
,`InvoiceNo` varchar(75)
,`Narration` varchar(255)
,`SupplierID` int(12)
,`PartyID` int(8)
,`RefNo` varchar(75)
,`PartyName` varchar(150)
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_master`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_master` (
`VoucherMstID` int(12)
,`VoucherCodeID` int(10)
,`Voucher` varchar(15)
,`Date` date
,`Narration` varchar(255)
,`VoucherTypeID` int(8)
,`VoucherCode` varchar(35)
,`VoucherTypeName` varchar(35)
,`PartyID` int(8)
,`PartyName` varchar(150)
,`Debit` double(10,2)
,`Credit` double(10,2)
);

-- --------------------------------------------------------

--
-- Structure for view `v_cashflow`
--
DROP TABLE IF EXISTS `v_cashflow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cashflow`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y') ORDER BY date_format(`journal`.`Date`,'%b-%Y') ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_detail`
--
DROP TABLE IF EXISTS `v_challan_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_challan_detail`  AS SELECT `challan_detail`.`ChallanDetailID` AS `ChallanDetailID`, `challan_detail`.`ChallanMasterID` AS `ChallanMasterID`, `challan_detail`.`ChallanNo` AS `ChallanNo`, `challan_detail`.`ChallanDate` AS `ChallanDate`, `challan_detail`.`ItemID` AS `ItemID`, `challan_detail`.`Qty` AS `Qty`, `challan_detail`.`Rate` AS `Rate`, `challan_detail`.`TaxAmount` AS `TaxAmount`, `challan_detail`.`TaxPer` AS `TaxPer`, `challan_detail`.`Discount` AS `Discount`, `challan_detail`.`Total` AS `Total`, `item`.`ItemType` AS `ItemType`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, `challan_detail`.`Description` AS `Description` FROM (`challan_detail` join `item` on((`challan_detail`.`ItemID` = `item`.`ItemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_master`
--
DROP TABLE IF EXISTS `v_challan_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_challan_master`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, date_format(`challan_master`.`ChallanDate`,'%d/%m/%Y') AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount`
--
DROP TABLE IF EXISTS `v_chartofaccount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chartofaccount`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`CODE` AS `CODE` FROM `chartofaccount` WHERE ((right(`chartofaccount`.`ChartOfAccountID`,5) = 0) AND (`chartofaccount`.`ChartOfAccountName` is not null)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount_mini`
--
DROP TABLE IF EXISTS `v_chartofaccount_mini`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chartofaccount_mini`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`OpenDebit` AS `OpenDebit`, `chartofaccount`.`OpenCredit` AS `OpenCredit`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`Category` AS `Category` FROM `chartofaccount` WHERE (`chartofaccount`.`Category` in ('CASH','CARD','BANK','AR')) ;

-- --------------------------------------------------------

--
-- Structure for view `v_delivery_challan`
--
DROP TABLE IF EXISTS `v_delivery_challan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_delivery_challan`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, `challan_master`.`ChallanDate` AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `challan_master`.`UserID` AS `UserID`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal`, `challan_master`.`Paid` AS `Paid`, `challan_master`.`Balance` AS `Balance` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_detail`
--
DROP TABLE IF EXISTS `v_estimate_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estimate_detail`  AS SELECT `estimate_detail`.`EstimateDetailID` AS `EstimateDetailID`, `estimate_detail`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_detail`.`EstimateNo` AS `EstimateNo`, `estimate_detail`.`EstimateDate` AS `EstimateDate`, `estimate_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `estimate_detail`.`Qty` AS `Qty`, `estimate_detail`.`Rate` AS `Rate`, `estimate_detail`.`Total` AS `Total`, `estimate_detail`.`Description` AS `Description`, `estimate_detail`.`TaxPer` AS `TaxPer`, `estimate_detail`.`Tax` AS `Tax` FROM (`estimate_detail` join `item` on((`estimate_detail`.`ItemID` = `item`.`ItemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_master`
--
DROP TABLE IF EXISTS `v_estimate_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estimate_master`  AS SELECT `estimate_master`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_master`.`EstimateNo` AS `EstimateNo`, `estimate_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `estimate_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `estimate_master`.`ReferenceNo` AS `ReferenceNo`, `estimate_master`.`EstimateDate` AS `EstimateDate`, `estimate_master`.`Total` AS `Total`, `estimate_master`.`CustomerNotes` AS `CustomerNotes`, `estimate_master`.`TermAndCondition` AS `TermAndCondition`, `estimate_master`.`File` AS `File`, `estimate_master`.`UserID` AS `UserID`, `estimate_master`.`Subject` AS `Subject`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `estimate_master`.`Date` AS `Date`, `estimate_master`.`SubTotal` AS `SubTotal`, `estimate_master`.`TaxPer` AS `TaxPer`, `estimate_master`.`Tax` AS `Tax`, `estimate_master`.`DiscountPer` AS `DiscountPer`, `estimate_master`.`Discount` AS `Discount`, `estimate_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `estimate_master`.`Shipping` AS `Shipping`, `estimate_master`.`DescriptionNotes` AS `DescriptionNotes`, `estimate_master`.`ExpiryDate` AS `ExpiryDate`, `estimate_master`.`GrandTotal` AS `GrandTotal`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate` FROM (`estimate_master` join `party` on((`estimate_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense`
--
DROP TABLE IF EXISTS `v_expense`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense`  AS SELECT `expense_master`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_master`.`Date` AS `Date`, date_format(`expense_master`.`Date`,'%d-%m-%Y') AS `Date1`, `expense_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_chart`
--
DROP TABLE IF EXISTS `v_expense_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_chart`  AS SELECT date_format(`v_journal`.`Date`,'%M-%Y') AS `MonthName`, (sum(if(isnull(`v_journal`.`Dr`),0,`v_journal`.`Dr`)) - sum(if(isnull(`v_journal`.`Cr`),0,`v_journal`.`Cr`))) AS `Balance`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'E') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), `v_journal`.`ChartOfAccountName` ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_detail`
--
DROP TABLE IF EXISTS `v_expense_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_detail`  AS SELECT `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`Date` AS `Date`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_detail`.`ExpenseDetailID` AS `ExpenseDetailID`, `expense_detail`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_detail`.`ChartOfAccountID` AS `ChartOfAccountID`, `expense_detail`.`Notes` AS `Notes`, `expense_detail`.`TaxPer` AS `TaxPer`, `expense_detail`.`Tax` AS `Tax`, `expense_detail`.`Amount` AS `Amount` FROM ((`expense_detail` join `expense_master` on((`expense_master`.`ExpenseMasterID` = `expense_detail`.`ExpenseMasterID`))) join `chartofaccount` on((`expense_detail`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_master`
--
DROP TABLE IF EXISTS `v_expense_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_master`  AS SELECT `expense_master`.`Date` AS `Date`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_income_exp_chart`
--
DROP TABLE IF EXISTS `v_income_exp_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_income_exp_chart`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y') ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory`
--
DROP TABLE IF EXISTS `v_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventory`  AS SELECT `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, sum(if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0)) AS `SaleReturn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0)) AS `QtyIn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0)) AS `QtyOut`, (sum((if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0) + if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0))) - sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0))) AS `Balance` FROM (`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) GROUP BY `invoice_detail`.`ItemID`, `item`.`ItemName`, `item`.`UnitName` ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory_detail`
--
DROP TABLE IF EXISTS `v_inventory_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventory_detail`  AS SELECT `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0) AS `SaleReturn`, if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0) AS `QtyIn`, if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0) AS `QtyOut`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo` FROM ((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_bal`
--
DROP TABLE IF EXISTS `v_invoice_bal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_bal`  AS SELECT `journal`.`PartyID` AS `PartyID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(ifnull(`journal`.`Dr`,0)) AS `INVOICE`, sum(ifnull(`journal`.`Cr`,0)) AS `PAID`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `due` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 110400) GROUP BY `journal`.`PartyID`, `journal`.`InvoiceMasterID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_balance`
--
DROP TABLE IF EXISTS `v_invoice_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_balance`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_invoice_bal`.`PartyID` AS `PartyID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `v_invoice_bal`.`INVOICE` AS `INVOICE`, `v_invoice_bal`.`PAID` AS `PAID`, `v_invoice_bal`.`due` AS `BALANCE`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`ReferenceNo` AS `ReferenceNo` FROM (`invoice_master` join `v_invoice_bal` on((`invoice_master`.`InvoiceMasterID` = `v_invoice_bal`.`InvoiceMasterID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_both`
--
DROP TABLE IF EXISTS `v_invoice_both`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_both`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `supplier`.`SupplierName` AS `SupplierName` FROM (((`invoice_master` left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) left join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_detail`
--
DROP TABLE IF EXISTS `v_invoice_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_detail`  AS SELECT `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`PartyID` AS `PartyID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `invoice_detail`.`Total` AS `Total`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Description` AS `Description`, `invoice_detail`.`TaxPer` AS `TaxPer`, `invoice_detail`.`Tax` AS `Tax`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_detail`.`Discount` AS `Discount`, `invoice_detail`.`DiscountType` AS `DiscountType`, `invoice_detail`.`DiscountAmountItem` AS `DiscountAmountItem`, `invoice_detail`.`Gross` AS `Gross`, `party`.`PartyName` AS `PartyName` FROM (((`invoice_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master`
--
DROP TABLE IF EXISTS `v_invoice_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_master`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `invoice_master`.`TaxType` AS `TaxType` FROM ((`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master_supplier`
--
DROP TABLE IF EXISTS `v_invoice_master_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_master_supplier`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`TaxPer` AS `TaxPer`, `supplier`.`TRN` AS `TRN` FROM (`invoice_master` join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_party_balance`
--
DROP TABLE IF EXISTS `v_invoice_party_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_party_balance`  AS SELECT `v_invoice_balance`.`PartyID` AS `PartyID`, sum(`v_invoice_balance`.`BALANCE`) AS `BALANCE` FROM `v_invoice_balance` GROUP BY `v_invoice_balance`.`PartyID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_balance`
--
DROP TABLE IF EXISTS `v_inv_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inv_balance`  AS SELECT `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`journal`.`Dr`) AS `Balance` FROM `journal` WHERE (left(`journal`.`VHNO`,3) = 'PAY') GROUP BY `journal`.`InvoiceMasterID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_detail`
--
DROP TABLE IF EXISTS `v_inv_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inv_detail`  AS SELECT `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Gross` AS `Gross`, `invoice_detail`.`Total` AS `Total` FROM (`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal`
--
DROP TABLE IF EXISTS `v_journal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_journal`  AS SELECT `journal`.`VHNO` AS `VHNO`, `journal`.`JournalType` AS `JournalType`, `journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `journal`.`SupplierID` AS `SupplierID`, `journal`.`VoucherMstID` AS `VoucherMstID`, `journal`.`PettyMstID` AS `PettyMstID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `journal`.`Date` AS `Date`, `journal`.`Dr` AS `Dr`, `journal`.`Cr` AS `Cr`, `journal`.`PartyID` AS `PartyID`, `journal`.`Narration` AS `Narration`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`CODE` AS `CODE`, `journal`.`Trace` AS `Trace`, `journal`.`BankReconcile` AS `BankReconcile`, `journal`.`ReconcileDate` AS `ReconcileDate`, `journal`.`JournalID` AS `JournalID`, `chartofaccount`.`Category` AS `Category`, `journal`.`ExpenseMasterID` AS `ExpenseMasterID`, `journal`.`PaymentMasterID` AS `PaymentMasterID`, `journal`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID` FROM (`chartofaccount` join `journal` on((`chartofaccount`.`ChartOfAccountID` = `journal`.`ChartOfAccountID`))) ORDER BY `journal`.`JournalID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal_report`
--
DROP TABLE IF EXISTS `v_journal_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_journal_report`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, 'INVOICE' AS `INVOICE` FROM `invoice_master` ;

-- --------------------------------------------------------

--
-- Structure for view `v_partywise_sale`
--
DROP TABLE IF EXISTS `v_partywise_sale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_partywise_sale`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_aging`
--
DROP TABLE IF EXISTS `v_party_aging`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_aging`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 1 and 7),`invoice_master`.`GrandTotal`,0)) AS `age7Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 8 and 16),`invoice_master`.`GrandTotal`,0)) AS `age15Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 17 and 30),`invoice_master`.`GrandTotal`,0)) AS `age30Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 31 and 60),`invoice_master`.`GrandTotal`,0)) AS `age60Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 61 and 90),`invoice_master`.`GrandTotal`,0)) AS `age90Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 90),`invoice_master`.`GrandTotal`,0)) AS `age90plusDays`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 0),`invoice_master`.`GrandTotal`,0)) AS `Total`, `party`.`PartyName` AS `PartyName` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) WHERE (`invoice_master`.`Paid` = 0) GROUP BY `invoice_master`.`PartyID`, `party`.`PartyName` ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_balance`
--
DROP TABLE IF EXISTS `v_party_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_balance`  AS SELECT `v_journal`.`VHNO` AS `VHNO`, `v_journal`.`JournalType` AS `JournalType`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `v_journal`.`SupplierID` AS `SupplierID`, `v_journal`.`VoucherMstID` AS `VoucherMstID`, `v_journal`.`PettyMstID` AS `PettyMstID`, `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`Date` AS `Date`, `v_journal`.`Dr` AS `Dr`, `v_journal`.`Cr` AS `Cr`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`Narration` AS `Narration`, `party`.`PartyName` AS `PartyName` FROM (`v_journal` join `party` on((`v_journal`.`PartyID` = `party`.`PartyID`))) WHERE (`v_journal`.`ChartOfAccountID` = 110400) ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_montly_balance`
--
DROP TABLE IF EXISTS `v_party_montly_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_montly_balance`  AS SELECT date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, `journal`.`PartyID` AS `PartyID` FROM `journal` WHERE ((`journal`.`ChartOfAccountID` = 110400) AND (`journal`.`PartyID` is not null)) GROUP BY `journal`.`PartyID`, date_format(`journal`.`Date`,'%b-%Y') ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment`
--
DROP TABLE IF EXISTS `v_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment`  AS SELECT `payment_master`.`PaymentMasterID` AS `PaymentMasterID`, `payment_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `payment_master`.`PaymentDate` AS `PaymentDate`, `payment_master`.`PaymentAmount` AS `PaymentAmount`, `payment_master`.`PaymentMode` AS `PaymentMode`, `payment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `payment_master`.`ReferenceNo` AS `ReferenceNo`, `payment_master`.`File` AS `File`, `payment_master`.`Notes` AS `Notes`, `payment_master`.`eDate` AS `eDate`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays` FROM (`payment_master` join `party` on((`payment_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_detail`
--
DROP TABLE IF EXISTS `v_payment_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment_detail`  AS SELECT `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `payment_detail`.`PaymentDetailID` AS `PaymentDetailID`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID`, `payment_detail`.`PaymentDate` AS `PaymentDate`, `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `payment_detail`.`Payment` AS `Payment`, `payment_detail`.`eDate` AS `eDate` FROM (`payment_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `payment_detail`.`InvoiceMasterID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_summary`
--
DROP TABLE IF EXISTS `v_payment_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment_summary`  AS SELECT `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`payment_detail`.`Payment`) AS `Paid`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID` FROM `payment_detail` GROUP BY `payment_detail`.`InvoiceMasterID`, `payment_detail`.`PaymentMasterID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_pettycash_master`
--
DROP TABLE IF EXISTS `v_pettycash_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pettycash_master`  AS SELECT `pettycash_master`.`PettyMstID` AS `PettyMstID`, `pettycash_master`.`PettyVoucher` AS `PettyVoucher`, `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `pettycash_master`.`Date` AS `Date`, `pettycash_master`.`Narration` AS `Narration`, `pettycash_master`.`Credit` AS `Credit` FROM (`chartofaccount` join `pettycash_master` on((`chartofaccount`.`ChartOfAccountID` = `pettycash_master`.`ChOfAcc`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_detail`
--
DROP TABLE IF EXISTS `v_purchase_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_order_detail`  AS SELECT `purchase_order_detail`.`PurchaseOrderDetailID` AS `PurchaseOrderDetailID`, `purchase_order_detail`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_detail`.`Date` AS `Date`, `purchase_order_detail`.`ItemID` AS `ItemID`, `purchase_order_detail`.`Description` AS `Description`, `purchase_order_detail`.`Rate` AS `Rate`, `purchase_order_detail`.`Qty` AS `Qty`, `purchase_order_detail`.`Unit` AS `Unit`, `purchase_order_detail`.`DiscountPer` AS `DiscountPer`, `purchase_order_detail`.`Discount` AS `Discount`, `purchase_order_detail`.`Tax` AS `Tax`, `purchase_order_detail`.`TaxPer` AS `TaxPer`, `purchase_order_detail`.`Amount` AS `Amount`, `purchase_order_detail`.`Remarks` AS `Remarks`, `item`.`ItemName` AS `ItemName` FROM (`purchase_order_detail` join `item` on((`purchase_order_detail`.`ItemID` = `item`.`ItemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_master`
--
DROP TABLE IF EXISTS `v_purchase_order_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_order_master`  AS SELECT `purchase_order_master`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_master`.`PON` AS `PON`, `purchase_order_master`.`SupplierID` AS `SupplierID`, `purchase_order_master`.`Date` AS `Date`, `purchase_order_master`.`PONotes` AS `PONotes`, `purchase_order_master`.`UserID` AS `UserID`, `purchase_order_master`.`Subject` AS `Subject`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `purchase_order_master`.`ReferenceNo` AS `ReferenceNo`, `purchase_order_master`.`Tax` AS `Tax`, `purchase_order_master`.`GrandTotal` AS `GrandTotal`, `purchase_order_master`.`eDate` AS `eDate`, `purchase_order_master`.`DeliveryDate` AS `DeliveryDate`, `purchase_order_master`.`DeliveryNotes` AS `DeliveryNotes`, `purchase_order_master`.`SubTotal` AS `SubTotal`, `purchase_order_master`.`Discount` AS `Discount`, `purchase_order_master`.`DiscountPer` AS `DiscountPer` FROM (`purchase_order_master` join `supplier` on((`purchase_order_master`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment`
--
DROP TABLE IF EXISTS `v_purchase_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_payment`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment_master`
--
DROP TABLE IF EXISTS `v_purchase_payment_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_payment_master`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_receivabledetail`
--
DROP TABLE IF EXISTS `v_receivabledetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_receivabledetail`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal` FROM ((`invoice_master` join `invoice_detail` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp`
--
DROP TABLE IF EXISTS `v_rev_exp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rev_exp`  AS SELECT (sum(if(isnull(`v_journal`.`Cr`),0,`v_journal`.`Cr`)) - sum(if(isnull(`v_journal`.`Dr`),0,`v_journal`.`Dr`))) AS `Rev`, 0 AS `Exp`, date_format(`v_journal`.`Date`,'%M-%Y') AS `DATE_FORMAT(date,'%M-%Y')`, date_format(`v_journal`.`Date`,'%m-%Y') AS `date_format(``v_journal``.``Date``,'%m-%Y')` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'r') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), date_format(`v_journal`.`Date`,'%m-%Y'), `v_journal`.`CODE` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp_chart`
--
DROP TABLE IF EXISTS `v_rev_exp_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rev_exp_chart`  AS SELECT abs(round(sum(`v_rev_exp`.`Rev`),0)) AS `Rev`, abs(round(sum(`v_rev_exp`.`Exp`),0)) AS `Exp`, `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` AS `MonthName` FROM `v_rev_exp` GROUP BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ORDER BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier`
--
DROP TABLE IF EXISTS `v_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier`  AS SELECT `supplier`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `supplier`.`eDate` AS `eDate` FROM `supplier` ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_balance`
--
DROP TABLE IF EXISTS `v_supplier_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_balance`  AS SELECT `journal`.`SupplierID` AS `SupplierID`, date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(if(isnull(`journal`.`Dr`),0,`journal`.`Dr`)) AS `Dr`, sum(if(isnull(`journal`.`Cr`),0,`journal`.`Cr`)) AS `Cr`, sum((if(isnull(`journal`.`Dr`),0,`journal`.`Dr`) - if(isnull(`journal`.`Cr`),0,`journal`.`Cr`))) AS `Balance` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 210100) GROUP BY `journal`.`SupplierID`, date_format(`journal`.`Date`,'%b-%Y') ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_outstanding`
--
DROP TABLE IF EXISTS `v_supplier_outstanding`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_outstanding`  AS SELECT `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, sum(ifnull(`v_journal`.`Dr`,0)) AS `PAID`, abs((sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0)))) AS `BALANCE`, `v_journal`.`SupplierID` AS `SupplierID`, `invoice_master`.`GrandTotal` AS `GrandTotal` FROM (`v_journal` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `v_journal`.`InvoiceMasterID`))) WHERE (((`v_journal`.`VHNO` like 'BILL%') OR (`v_journal`.`VHNO` like 'BILLPAY%')) AND (`v_journal`.`ChartOfAccountID` = 210100)) GROUP BY `v_journal`.`InvoiceMasterID`, `v_journal`.`PartyID`, `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName`, `invoice_master`.`InvoiceNo`, `invoice_master`.`Date`, `invoice_master`.`DueDate`, `invoice_master`.`GrandTotal`, `v_journal`.`SupplierID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_over_balance`
--
DROP TABLE IF EXISTS `v_supplier_over_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_over_balance`  AS SELECT `v_supplier_outstanding`.`SupplierID` AS `SupplierID`, sum(`v_supplier_outstanding`.`BALANCE`) AS `BALANCE` FROM `v_supplier_outstanding` GROUP BY `v_supplier_outstanding`.`SupplierID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_test`
--
DROP TABLE IF EXISTS `v_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_test`  AS SELECT `item`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`ItemID` AS `T1`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`item` join `invoice_detail` on((`item`.`ItemID` = `invoice_detail`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial`
--
DROP TABLE IF EXISTS `v_trial`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trial`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_trialreport`
--
DROP TABLE IF EXISTS `v_trialreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trialreport`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial_balance`
--
DROP TABLE IF EXISTS `v_trial_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trial_balance`  AS SELECT `v_trial`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_trial`.`ChartOfAccountName` AS `ChartOfAccountName`, if((`v_trial`.`Balance` >= 0),`v_trial`.`Balance`,0) AS `Dr`, if((`v_trial`.`Balance` < 0),abs(`v_trial`.`Balance`),0) AS `Cr` FROM `v_trial` ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher`
--
DROP TABLE IF EXISTS `v_voucher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration` FROM (`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_detail`
--
DROP TABLE IF EXISTS `v_voucher_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher_detail`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Narration` AS `NarrationMaster`, `voucher_detail`.`Date` AS `Date`, `voucher_detail`.`ChOfAcc` AS `ChOfAcc`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit`, `voucher_detail`.`InvoiceNo` AS `InvoiceNo`, `voucher_detail`.`Narration` AS `Narration`, `voucher_detail`.`SupplierID` AS `SupplierID`, `voucher_detail`.`PartyID` AS `PartyID`, `voucher_detail`.`RefNo` AS `RefNo`, `party`.`PartyName` AS `PartyName`, `supplier`.`SupplierName` AS `SupplierName` FROM ((((`voucher_detail` join `voucher_master` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `chartofaccount` on((`chartofaccount`.`ChartOfAccountID` = `voucher_detail`.`ChOfAcc`))) left join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) left join `supplier` on((`voucher_detail`.`SupplierID` = `supplier`.`SupplierID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_master`
--
DROP TABLE IF EXISTS `v_voucher_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher_master`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration`, `voucher_type`.`VoucherTypeID` AS `VoucherTypeID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_detail`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit` FROM (((`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) join `voucher_detail` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AirLineID`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`AttachmentID`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `bill_master`
--
ALTER TABLE `bill_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `challan_detail`
--
ALTER TABLE `challan_detail`
  ADD PRIMARY KEY (`ChallanDetailID`);

--
-- Indexes for table `challan_master`
--
ALTER TABLE `challan_master`
  ADD PRIMARY KEY (`ChallanMasterID`);

--
-- Indexes for table `challan_type`
--
ALTER TABLE `challan_type`
  ADD PRIMARY KEY (`ChallanTypeID`);

--
-- Indexes for table `chartofaccount`
--
ALTER TABLE `chartofaccount`
  ADD PRIMARY KEY (`ChartOfAccountID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `estimate_detail`
--
ALTER TABLE `estimate_detail`
  ADD PRIMARY KEY (`EstimateDetailID`);

--
-- Indexes for table `estimate_master`
--
ALTER TABLE `estimate_master`
  ADD PRIMARY KEY (`EstimateMasterID`);

--
-- Indexes for table `expense_detail`
--
ALTER TABLE `expense_detail`
  ADD PRIMARY KEY (`ExpenseDetailID`);

--
-- Indexes for table `expense_master`
--
ALTER TABLE `expense_master`
  ADD PRIMARY KEY (`ExpenseMasterID`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `invoice_type`
--
ALTER TABLE `invoice_type`
  ADD PRIMARY KEY (`InvoiceTypeID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `item__`
--
ALTER TABLE `item__`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`JournalID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`PartyID`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`PaymentDetailID`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
  ADD PRIMARY KEY (`PaymentMasterID`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD PRIMARY KEY (`PettyDetID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  ADD PRIMARY KEY (`PettyMstID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  ADD PRIMARY KEY (`PurchasePaymentDetailID`);

--
-- Indexes for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  ADD PRIMARY KEY (`PurchasePaymentMasterID`);

--
-- Indexes for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  ADD PRIMARY KEY (`PurchaseOrderDetailID`);

--
-- Indexes for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  ADD PRIMARY KEY (`PurchaseOrderMasterID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplier_category`
--
ALTER TABLE `supplier_category`
  ADD PRIMARY KEY (`SupplierCatID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`TaxID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD PRIMARY KEY (`VoucherDetID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`);

--
-- Indexes for table `voucher_master`
--
ALTER TABLE `voucher_master`
  ADD PRIMARY KEY (`VoucherMstID`);

--
-- Indexes for table `voucher_type`
--
ALTER TABLE `voucher_type`
  ADD PRIMARY KEY (`VoucherTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `AirLineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `AttachmentID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `InvoiceDetailID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_master`
--
ALTER TABLE `bill_master`
  MODIFY `InvoiceMasterID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_detail`
--
ALTER TABLE `challan_detail`
  MODIFY `ChallanDetailID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_master`
--
ALTER TABLE `challan_master`
  MODIFY `ChallanMasterID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `InvoiceDetailID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
  MODIFY `InvoiceMasterID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_type`
--
ALTER TABLE `invoice_type`
  MODIFY `InvoiceTypeID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `item__`
--
ALTER TABLE `item__`
  MODIFY `ItemID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `party`
--
ALTER TABLE `party`
  MODIFY `PartyID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2214;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `PaymentDetailID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `PaymentMasterID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  MODIFY `PettyDetID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  MODIFY `PettyMstID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  MODIFY `PurchasePaymentDetailID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  MODIFY `PurchasePaymentMasterID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  MODIFY `PurchaseOrderDetailID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  MODIFY `PurchaseOrderMasterID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2214;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `SupplierCatID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `TaxID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `UnitID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `RoleId` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4386;

--
-- AUTO_INCREMENT for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  MODIFY `VoucherDetID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `voucher_master`
--
ALTER TABLE `voucher_master`
  MODIFY `VoucherMstID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `voucher_type`
--
ALTER TABLE `voucher_type`
  MODIFY `VoucherTypeID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD CONSTRAINT `pettycash_detail_ibfk_1` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD CONSTRAINT `voucher_detail_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
