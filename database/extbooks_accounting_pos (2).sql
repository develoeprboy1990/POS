-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2023 at 10:46 AM
-- Server version: 8.0.27
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extbooks_accounting_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AirLineID` int NOT NULL,
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
  `AttachmentID` int NOT NULL,
  `InvoiceNo` varchar(25) DEFAULT NULL,
  `FileName` varchar(75) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`AttachmentID`, `InvoiceNo`, `FileName`, `eDate`) VALUES
(199, 'DC-00001', '3797501683283662.mp3', '2023-05-05 10:47:42'),
(200, 'DC-00001', '1885291683283766.wav', '2023-05-05 10:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Faheem', '1675923361.jpg', 'Electric store', NULL, 'adeem@example.com', '03315873298', 'Jhelum', 'Jhelum', 'Punjab', '49600', 'Pakistan', 1, '2021-08-28 23:44:37', '2023-02-09 01:16:01'),
(2, 'Zaigham Shah', NULL, 'Shah Corporation', NULL, 'za@shahcorporationltd.com', '0345-9512786', 'Shah Corporation Building Kala Gujran Phatak GTRoad Jhelum', 'Jhelum', NULL, NULL, NULL, 1, '2021-09-28 17:25:56', '2022-09-12 10:40:27'),
(3, 'test', NULL, 'test company', '3442', 'test@example.com', '4523423', 'fds', 'peshawar', 'kpk', '25000', 'pakistan', 0, '2023-01-18 09:00:03', '2023-01-18 09:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
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
  `InvoiceMasterID` int NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
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
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchID` int NOT NULL,
  `BranchName` varchar(150) DEFAULT NULL,
  `BranchContact` varchar(50) DEFAULT NULL,
  `BranchEmail` varchar(50) DEFAULT NULL,
  `BranchAddress` varchar(150) DEFAULT NULL,
  `BranchLogo` varchar(50) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchID`, `BranchName`, `BranchContact`, `BranchEmail`, `BranchAddress`, `BranchLogo`, `CreatedDate`, `UpdatedDate`) VALUES
(2, 'Allianz Marketing Management', '+971551923008', 'hr@fcb.ae', 'Clover bay Tower Office #1212', '1667395197.jpg', '2022-11-02 13:19:57', '2022-11-02 13:19:57'),
(3, 'Grand Alliance Commercial Brokerage LLC', '045693717', 'hr@fcb.ae', 'Office No 303, Marasi Drive, Clover Bay Tower', '1667471486.jpg', '2022-11-03 10:31:26', NULL),
(4, 'Friends Marketing Management', '047170220', 'hr@fcb.ae', 'Clover Bay Tower, Office No 1807', '1667478735.jpg', '2022-11-03 12:32:15', NULL),
(5, 'Extensive IT Services', '047170220', 'hr@fcb.ae', 'Clover Bay Tower, Office No 1807', '1667478819.jpg', '2022-11-03 12:33:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Philips', NULL, 0, '2021-08-28 23:07:12', '2021-09-06 16:54:17'),
(2, 'Sogo', NULL, 0, '2021-08-28 23:07:25', '2021-09-06 16:54:17'),
(3, 'Dawlance', '20210906115107.png', 0, '2021-09-06 16:51:07', '2021-09-12 21:56:39'),
(4, 'Sumsung', '20210906115343.png', 0, '2021-09-06 16:53:43', '2021-09-12 21:56:39'),
(5, 'IBM', '1683626582.jpg', 1, '2021-09-12 21:57:23', '2023-05-09 16:03:02'),
(6, 'puma', '1683626333.png', 1, '2021-09-25 18:34:35', '2023-05-09 15:58:53'),
(7, 'test abc', NULL, 0, '2023-01-18 06:03:37', '2023-01-18 06:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Technology', NULL, NULL, 0, '2021-08-28 23:04:24', '2021-09-12 21:54:48'),
(2, 'Hardware', NULL, 1, 0, '2021-08-28 23:05:11', '2021-09-12 21:54:48'),
(3, 'Refrigerator', NULL, NULL, 0, '2021-09-06 16:45:11', '2021-09-12 21:54:48'),
(4, 'Microwave Oven', NULL, NULL, 0, '2021-09-06 16:46:45', '2021-09-12 21:54:48'),
(5, 'Inverter', NULL, NULL, 0, '2021-09-06 16:47:03', '2021-09-12 21:54:48'),
(6, 'LED', NULL, NULL, 0, '2021-09-06 16:47:15', '2021-09-12 21:54:48'),
(7, 'Washing Machine', NULL, NULL, 0, '2021-09-06 16:47:44', '2021-09-12 21:54:48'),
(8, 'Oven', NULL, NULL, 0, '2021-09-06 17:21:13', '2021-09-12 21:54:48'),
(9, 'Iron', NULL, NULL, 0, '2021-09-06 18:50:45', '2021-09-12 21:54:48'),
(10, 'Soap', NULL, NULL, 0, '2021-09-12 22:12:49', '2021-09-25 17:42:34'),
(11, 'Shampoo', NULL, NULL, 1, '2021-09-12 22:20:21', '2021-09-12 22:20:21'),
(12, 'Cleaner', NULL, NULL, 0, '2021-09-12 22:21:27', '2021-09-25 17:42:34'),
(13, 'Teezaab', NULL, 12, 0, '2021-09-12 22:21:45', '2021-09-25 17:42:34'),
(14, 'Gel', NULL, NULL, 1, '2021-09-25 17:43:05', '2021-09-25 17:43:05'),
(15, 'Extra Strong', NULL, 14, 1, '2021-09-25 17:43:37', '2021-09-25 17:43:37'),
(16, 'Mega Hold', NULL, 14, 1, '2021-09-25 17:43:58', '2021-09-25 17:43:58'),
(17, 'Gum', NULL, 14, 1, '2021-09-25 17:44:16', '2021-09-25 17:44:16'),
(18, 'Wax', NULL, NULL, 1, '2021-09-25 17:44:47', '2021-09-25 17:44:47'),
(19, 'Matte', NULL, 18, 1, '2021-09-25 17:45:14', '2021-09-25 17:45:14'),
(20, 'Wet', NULL, 18, 1, '2021-09-25 17:45:35', '2021-09-25 17:45:35'),
(21, 'Gold', NULL, 18, 1, '2021-09-25 17:45:58', '2021-09-25 17:45:58'),
(22, 'Wax extra strong', NULL, 18, 1, '2021-09-25 17:49:58', '2021-09-25 17:49:58'),
(23, 'Wax strong matte', NULL, 18, 1, '2021-09-25 17:50:38', '2021-09-25 17:50:38'),
(24, 'Wax bubble gum', NULL, 18, 1, '2021-09-25 17:50:55', '2021-09-25 17:50:55'),
(25, 'Wax Clay', NULL, 18, 1, '2021-09-25 17:51:14', '2021-09-25 17:51:14'),
(26, 'Conditioner', NULL, NULL, 1, '2021-09-25 17:51:49', '2021-09-25 17:51:49'),
(27, 'Spray Argan', NULL, 26, 1, '2021-09-25 17:52:49', '2021-09-25 17:52:49'),
(28, 'Spray Keratein', NULL, 26, 1, '2021-09-25 17:53:19', '2021-09-25 17:53:19'),
(29, 'Spray Blue', NULL, 26, 1, '2021-09-25 17:53:39', '2021-09-25 17:53:39'),
(30, 'Spray Pink', NULL, 26, 1, '2021-09-25 18:02:37', '2021-09-25 18:02:37'),
(31, 'After Shave Cream', NULL, NULL, 1, '2021-09-25 18:42:45', '2022-01-20 09:26:31'),
(32, 'Shave Cream & Cologne Zodiac', NULL, 31, 1, '2021-09-25 18:44:00', '2021-09-25 18:44:00'),
(33, 'Shave Cream & Cologne Wizard', NULL, 31, 1, '2021-09-25 18:44:36', '2021-09-25 18:44:36'),
(34, 'Shave Cream & Cologne Rain Drop', NULL, 31, 1, '2021-09-25 18:45:04', '2021-09-25 18:45:04'),
(35, 'Hair Mask', NULL, NULL, 1, '2021-09-25 18:45:51', '2021-09-25 18:45:51'),
(36, 'Conditioner Cream', NULL, NULL, 1, '2021-09-25 18:46:25', '2021-09-25 18:46:25'),
(37, 'Massage Oil', NULL, NULL, 1, '2021-09-25 18:46:43', '2021-09-25 18:46:43'),
(38, 'Shaving Gel', NULL, NULL, 1, '2021-09-25 18:47:00', '2021-09-25 18:47:00'),
(39, 'Oxidant Cream', NULL, NULL, 1, '2021-09-25 18:47:39', '2021-09-25 18:47:39'),
(40, 'Serum', NULL, NULL, 1, '2021-09-25 18:48:42', '2021-09-25 18:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `challan_detail`
--

CREATE TABLE `challan_detail` (
  `ChallanDetailID` int NOT NULL,
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
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
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(75) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanType` varchar(25) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
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
  `ChallanTypeID` int NOT NULL,
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
  `ChartOfAccountID` int NOT NULL,
  `CODE` varchar(15) DEFAULT NULL,
  `ChartOfAccountName` varchar(75) DEFAULT NULL,
  `OpenDebit` int DEFAULT NULL,
  `OpenCredit` int DEFAULT NULL,
  `L1` int DEFAULT NULL,
  `L2` int DEFAULT NULL,
  `L3` int DEFAULT NULL,
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
(111009, 'A', 'acaca', NULL, NULL, 100000, 110000, 110000, 'BANK'),
(111109, 'A', 'fsgv', NULL, NULL, 100000, 110000, 110000, '0'),
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
  `CompanyID` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
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
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `used` int NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', 166, '2020-11-01 00:22:58', '2021-08-28 22:51:37'),
(2, 'Euro', 'Euro', 0.85, '2020-11-01 01:29:12', '2020-11-10 23:15:34'),
(3, 'Pakistani Rupees', 'Rs', 1, '2021-08-28 22:50:54', '2021-08-28 22:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `customer_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'walk-in', 'General', NULL, '0000000000', NULL, 'Other', 'variant', NULL, NULL, NULL, NULL, NULL, 1, '2021-08-28 23:39:03', '2021-08-28 23:39:03'),
(2, 12, NULL, 'Ajwa Mart', 'Ajwa Mart', NULL, '+92 333 8822233', '8358147', 'WPG9+J83, Jhelum Cantt', 'Jhelum', 'Punjab', NULL, NULL, NULL, NULL, 1, '2021-09-25 17:21:47', '2022-03-22 13:00:24'),
(3, 12, NULL, 'D Super Mart', 'D Mart', NULL, '0544-634022', '4439197-8', 'G T Road Dina', 'Dina', 'Punjab', NULL, NULL, NULL, NULL, 1, '2021-09-25 17:24:34', '2022-05-28 12:01:51'),
(4, 12, NULL, 'A Mart', 'A Mart', NULL, '0300 5488215', NULL, 'Mangla Rd, Hadali Dina', 'Dina', 'Punjab', NULL, NULL, NULL, NULL, 1, '2021-09-25 17:26:17', '2022-01-29 09:25:36'),
(5, 2, NULL, 'nafees Traders', NULL, NULL, '03335837072', NULL, 'Mirpur', 'Mirpur', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-28 17:20:06', '2021-09-28 17:20:06'),
(6, 12, NULL, 'U Mart', NULL, NULL, '(0544) 272124', NULL, 'G.T Road, Opp Fauji Mill Ground، Grand Trunk Rd, Kala Gujran', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-28 17:33:21', '2022-01-29 09:25:56'),
(7, 3, NULL, 'Ch Shehzad(FKS)', NULL, NULL, '0000000', NULL, 'Pindora', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-28 18:20:25', '2021-11-16 21:46:10'),
(8, 3, NULL, 'Ch Waheed(FKS)', NULL, NULL, '0000', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-28 18:22:52', '2021-11-16 21:46:31'),
(9, 3, NULL, 'Ch Akhtar(FKS)', NULL, NULL, '00000', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-28 22:15:37', '2021-11-16 21:46:52'),
(10, 11, NULL, 'Brothers Bakers', NULL, NULL, '0330-9537479', NULL, 'Karimpur road, Haji aima', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 14:57:19', '2022-01-29 09:26:36'),
(11, 12, NULL, 'Jam Mart', NULL, NULL, '0300-9555902', '5426762-5', 'G.T Road Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 15:44:55', '2022-03-22 12:59:10'),
(12, 1, NULL, 'Shoaib Arjumand Janjua', NULL, 'Shoaib@gmail.com', '03365337731', NULL, 'Blue Lagoon Restaurant', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 16:11:20', '2021-09-29 16:11:20'),
(13, 3, NULL, 'Ali Asghar(FKS)', NULL, NULL, '---', NULL, 'London', 'London', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 17:01:50', '2021-11-16 21:47:14'),
(14, 3, NULL, 'Karamat Shah(FKS)', NULL, NULL, '00', NULL, 'Kharian', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 17:09:12', '2021-11-16 21:42:25'),
(15, 3, NULL, 'ABS(FKS)', NULL, NULL, '000', NULL, 'nil', 'nil', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 17:13:21', '2021-11-16 21:47:41'),
(16, 3, NULL, 'Aamir(FKS)', NULL, NULL, '1', NULL, 'N/L', 'N/L', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 17:18:56', '2021-11-16 21:48:05'),
(17, 4, NULL, 'Madam Raheela', NULL, NULL, '11', NULL, 'Jhelum Cantt', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 17:24:18', '2021-09-29 17:24:18'),
(18, 2, NULL, 'Anas', 'Anas', NULL, '0332-3277786', NULL, 'Citi housing', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 18:54:43', '2021-11-15 20:25:15'),
(19, 2, NULL, 'M. Kamran ( H&H sons )', 'H&H sons', NULL, '0332-9582003', NULL, 'near Saif Karyana store, near Ahl-e-hadees chowk', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-29 23:32:24', '2021-09-29 23:32:24'),
(20, 12, NULL, 'Euro store', NULL, NULL, '(053) 3602460', '8863998-1', 'ON GT Road, near Total Parco Petroleum, Gujar Khan, Rawalpindi, Punjab 47850', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 16:43:50', '2022-03-22 12:57:59'),
(21, 2, NULL, 'Sh. Awais(Sample)', NULL, NULL, '12', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:30:51', '2021-11-16 23:05:54'),
(22, 4, NULL, 'Umer Hassan(Salesman)', NULL, NULL, '112', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:41:25', '2021-09-30 21:41:25'),
(23, 4, NULL, 'Umer Hassan(Sample)', NULL, NULL, '1122', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:42:29', '2021-09-30 21:42:29'),
(24, 7, NULL, 'FKS', NULL, NULL, '01', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:46:50', '2021-11-16 21:38:22'),
(25, 3, NULL, 'AttaUllah(FKS)', NULL, NULL, '02', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:51:32', '2021-11-16 21:48:38'),
(26, 7, NULL, 'Alamgir', NULL, NULL, '03', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 21:54:03', '2021-09-30 21:54:03'),
(27, 5, NULL, 'Ahsan', NULL, NULL, '04', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 22:00:51', '2021-09-30 22:00:51'),
(28, 6, NULL, 'Qasim', NULL, NULL, '05', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 22:08:37', '2021-09-30 22:08:37'),
(29, 6, NULL, 'Adeel', NULL, NULL, '06', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 22:16:29', '2021-09-30 22:16:29'),
(30, 4, NULL, 'Babar(Sample)', NULL, NULL, '07', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 22:30:23', '2021-11-16 22:15:14'),
(31, 5, NULL, 'mix', NULL, NULL, '08', NULL, 'mix', 'mix', NULL, NULL, NULL, NULL, NULL, 1, '2021-09-30 23:20:59', '2021-09-30 23:20:59'),
(32, 3, NULL, 'Camran Cidique(FKS)', NULL, NULL, '10', NULL, 'N/L', 'N/L', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-01 15:46:52', '2021-11-16 21:53:12'),
(33, 6, NULL, 'Abdul Khalik KPK(FKS)', NULL, 'abdulkhaliq@gmail.com', '03125485214', NULL, 'KPK', 'KPK', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-01 20:21:43', '2021-11-16 22:48:30'),
(34, 5, NULL, 'Tahir kayani', NULL, 'tahirkayani@gmail.com', '03154822458', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-01 21:04:48', '2021-10-01 21:04:48'),
(35, 8, NULL, 'Nabeel', NULL, NULL, '0314-5448568', NULL, 'Urtasker, citi housing', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-01 22:52:05', '2021-10-01 22:52:05'),
(36, 8, NULL, 'Mirza Zeeshan Haider', NULL, NULL, '0317-014558', NULL, 'Chotala', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-02 16:52:59', '2021-10-02 16:52:59'),
(37, 2, NULL, 'Al-Fajar Traders', NULL, 'alfajartraders@gmail.com', '03002659535', NULL, 'Kotla arab ali Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-02 18:57:28', '2021-10-02 18:57:28'),
(38, 5, NULL, 'Ashar', NULL, NULL, '03341311995', NULL, 'Machine Mohallah No. 3', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-02 22:20:35', '2021-10-02 22:20:35'),
(39, 8, NULL, 'Muhammad usman', NULL, NULL, '0304-1184110', NULL, 'Near Shifa Hospital Gate No: 01, H8/1 Nibaf', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-02 22:28:47', '2021-10-02 22:28:47'),
(40, 2, NULL, 'Butt Trader Gujranwala', 'Butt Trader Gujranwala', NULL, '03226434520', NULL, 'Gujranwala', 'Gujranwala', 'punjab', NULL, NULL, NULL, NULL, 1, '2021-10-04 17:33:14', '2021-10-04 17:33:14'),
(41, 8, NULL, 'Umar Rauf Dina', NULL, 'umarrauf@gmail.com', '03135597694', NULL, 'GT Road Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-04 21:40:28', '2021-10-04 21:40:28'),
(42, 8, NULL, 'Mr Ikram ul Haq', NULL, 'ikramulhaq@gmail.com', '03335835073', NULL, 'Brook College civil line jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-04 22:20:06', '2021-10-04 22:20:06'),
(43, 8, NULL, 'Abdul Rasheed Khan', NULL, 'abdulrasheed@gmail.com', '03145473593', NULL, 'New Khan Cloth House Al Bilal Market GT Road Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-04 22:25:56', '2021-10-04 22:25:56'),
(44, 3, NULL, 'Bangash(FKS)', NULL, NULL, '113', NULL, 'Peshawar', 'Peshawar', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-05 22:21:49', '2021-11-16 21:39:22'),
(45, 5, NULL, 'Aqib Shah', NULL, NULL, '0312-5546248', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 15:17:34', '2021-10-06 15:31:23'),
(46, 5, NULL, 'Zohaib Jutt(SEO)', NULL, NULL, '0317-5991296', NULL, 'Kila Rohtas', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 15:27:51', '2021-10-06 15:27:51'),
(47, 2, NULL, 'Tariq sb', NULL, NULL, '115', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 16:25:51', '2021-10-06 16:25:51'),
(48, 2, NULL, 'Zaki Shah', NULL, NULL, '116', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 17:29:40', '2021-10-06 17:29:40'),
(49, 2, NULL, 'J.J Junaid', NULL, NULL, '117', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 17:45:26', '2021-10-06 17:45:26'),
(50, 4, NULL, 'Tanveer', NULL, NULL, '118', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 17:54:29', '2021-10-06 17:54:29'),
(51, 2, NULL, 'Sohail Ahmed', NULL, NULL, '119', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:00:17', '2021-10-06 18:00:17'),
(52, 2, NULL, 'Naveed Sb.', NULL, NULL, '120', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:24:47', '2021-10-06 18:24:47'),
(53, 2, NULL, 'Rustam', NULL, NULL, '121', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:30:50', '2021-10-06 18:30:50'),
(54, 2, NULL, 'Aftab Gujjar', NULL, NULL, '122', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:45:51', '2021-10-06 18:45:51'),
(55, 2, NULL, 'Adeel', NULL, NULL, '123', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:54:16', '2021-10-06 18:54:16'),
(56, 2, NULL, 'Skander', NULL, NULL, '124', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 18:58:17', '2021-10-06 18:58:17'),
(57, 8, NULL, 'Usama Bin Shan', NULL, NULL, '125', NULL, 'Han store, shandar chowk', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-06 20:54:38', '2021-10-06 20:54:38'),
(58, 8, NULL, 'Usama Bin Shan', NULL, NULL, '126', NULL, 'Shan store, shandar chowk', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 0, '2021-10-06 20:55:29', '2021-10-09 17:18:53'),
(59, 4, NULL, 'Abdul Rahim', NULL, 'Rahim@gmail.com', '03158422548', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 20:07:44', '2021-10-08 20:07:44'),
(60, 8, NULL, 'Maryam Naqvi', NULL, NULL, '0333-0934914', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 20:27:56', '2021-10-08 20:27:56'),
(61, 8, NULL, 'Usama Zulfiqar', NULL, NULL, '0313-5603381', NULL, 'Sarai-alamgir, Aurangabad chowk, dist Gujrat', 'Sarai Alamgir', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 20:35:24', '2021-10-08 20:35:24'),
(62, 8, NULL, 'Shehroz Ali', NULL, NULL, '03101859517', NULL, 'Ashraf Arcade, Street No. 5A, Postal city-lane No. 10, Park road', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 20:55:18', '2021-10-08 20:55:18'),
(63, 8, NULL, 'Talha Rajpoot', NULL, NULL, '0342-6332896', NULL, 'G.T. Gujrat, Village Sheikh sukha near by Shaheen Chowk', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 21:02:52', '2021-10-08 21:02:52'),
(64, 3, NULL, 'bat sab', NULL, 'akcollegejhelum@yahoo.co.uk', '03005424117', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 22:31:47', '2021-10-08 22:31:47'),
(65, 5, NULL, 'Aleena soda', NULL, NULL, '03005424116', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 22:49:22', '2021-10-08 22:49:22'),
(66, 5, NULL, 'Rimsha azhar', NULL, NULL, '0321667589', NULL, 'Bilal Town Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 22:54:09', '2021-10-08 22:54:09'),
(67, 8, NULL, 'TestUser', NULL, NULL, NULL, NULL, 'Unknown', 'Unknown', NULL, NULL, NULL, NULL, NULL, 0, '2021-10-08 23:44:10', '2021-10-08 23:44:56'),
(68, 2, NULL, 'Subhan Traders', NULL, NULL, '0306-5303676', NULL, 'Bani Thana', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 15:53:48', '2021-10-09 15:53:48'),
(69, 4, NULL, 'MG SUPER MARKET', NULL, NULL, '0334 5086293', NULL, '4 Street 15, Golra E-11, Islamabad, Islamabad Capital Territory', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 16:21:41', '2021-10-09 16:21:41'),
(70, 4, NULL, 'Bakeman Bakers & Sweets', NULL, NULL, '0512353706', NULL, 'Sawan Rd, G-10 Markaz G 10 Markaz G-10, Islamabad, Islamabad Capital Territory 44000', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 16:26:40', '2021-10-09 16:26:40'),
(71, 5, NULL, 'Adnan bahi office', NULL, NULL, NULL, NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 20:40:28', '2021-10-09 20:40:28'),
(72, 5, NULL, 'Shazma staff', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 22:37:52', '2021-10-09 22:37:52'),
(73, 5, NULL, 'Shazma staff', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 22:37:53', '2021-10-09 22:37:53'),
(74, 1, NULL, 'Rabia', NULL, NULL, NULL, NULL, 'Bilal town', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-09 22:42:31', '2021-10-09 22:42:31'),
(75, 8, NULL, 'Adeel Arshad', NULL, NULL, '03073209339', NULL, 'Sialkot international airport', 'Sialkot', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-11 19:00:00', '2021-10-11 19:00:00'),
(76, 8, NULL, 'Muhammad Husnain', NULL, NULL, '03117258885', NULL, 'Dokh Abdullah street: 12 Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-11 19:01:05', '2021-10-11 19:01:05'),
(77, 8, NULL, 'Noor Saba', NULL, NULL, '03130087244', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-11 19:01:55', '2021-10-11 19:01:55'),
(78, 8, NULL, 'Haniya', NULL, NULL, '03129583505', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-11 20:03:13', '2021-10-11 20:03:13'),
(79, 8, NULL, 'Mohsin', NULL, NULL, '03355851531', NULL, 'Ranjha Maira near backside of UBL bank.', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-11 20:06:14', '2021-10-11 20:06:14'),
(80, 3, NULL, 'Syed nasir shah(FKS)', NULL, NULL, '03049512788', NULL, 'kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 14:19:17', '2021-11-16 22:13:50'),
(81, 8, NULL, 'Mian Osama zarar', NULL, NULL, '03175595687', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 16:15:16', '2021-10-12 16:15:16'),
(82, 8, NULL, 'Ibtasam Rajpoot', NULL, NULL, '03095242768', NULL, 'Baba medhi shah tipu street jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 17:35:08', '2021-10-12 17:50:35'),
(83, 8, NULL, 'Anum', NULL, NULL, '03336767616', NULL, 'Allama Iqbal town nizam block house no. 537 City lahore', 'lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 17:42:10', '2021-10-12 17:42:10'),
(84, 8, NULL, 'wahab Qureshi', NULL, NULL, '0308 5610031', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 18:09:40', '2021-11-15 20:45:25'),
(85, 4, NULL, 'Umer Rauf', NULL, NULL, '0313 5597694', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 18:14:39', '2021-10-12 18:14:39'),
(86, 3, NULL, 'Azhar bhai(FKS)', NULL, NULL, '03049512786', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 19:07:19', '2021-11-16 22:28:31'),
(87, 1, NULL, 'Sfk', NULL, NULL, '03009527645', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 0, '2021-10-12 19:43:29', '2021-10-12 23:09:37'),
(88, 3, NULL, 'FKS', NULL, NULL, '03009527641', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-12 19:53:40', '2021-11-16 22:24:36'),
(89, 3, NULL, 'FKS', NULL, NULL, '03009527246', NULL, 'islamabad', 'islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-13 14:20:45', '2021-11-16 22:30:23'),
(90, 8, NULL, 'Adeel Ahmed', NULL, NULL, '03075833117', NULL, 'City housing Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-13 15:16:04', '2021-10-13 15:16:04'),
(91, 8, NULL, 'Shoiab Amjad', NULL, NULL, '03008052112', NULL, 'china chowk pusrur road Sialkot', 'Sialkot', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-13 15:18:44', '2021-10-13 15:18:44'),
(92, 8, NULL, 'Sheik Ali', NULL, NULL, '033258887432', NULL, 'Momdhi Chowk muhala islamia school', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-13 15:20:14', '2021-10-13 15:20:14'),
(93, 8, NULL, 'Shahzaib', NULL, NULL, '03471534240', NULL, 'Puran village tehsil sarai alamgir', 'Sarai alamgir', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-13 17:58:35', '2021-10-13 17:58:35'),
(94, 2, NULL, 'Abbasi casmatek', NULL, NULL, NULL, NULL, 'kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 16:05:50', '2021-10-14 16:05:50'),
(95, 1, NULL, 'M.Bilal', NULL, NULL, '03078136401', NULL, 'Mohalla Mehdi Shah Professor Safdar Street', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 16:39:12', '2021-10-14 16:39:12'),
(96, 3, NULL, 'Tussif (FKS)', NULL, NULL, '325', NULL, 'kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 17:19:27', '2021-11-16 21:40:38'),
(97, 6, NULL, 'Zahid (Salesman)', NULL, NULL, 'O3219592786', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 17:25:46', '2021-10-14 17:25:46'),
(98, 6, NULL, 'Zahid (Salesman)', NULL, NULL, '03219592786', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 17:40:33', '2021-10-14 17:40:33'),
(99, 4, NULL, 'D Mart', NULL, NULL, '0544 634022', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 18:39:47', '2021-10-14 18:39:47'),
(100, 2, NULL, 'Saima Shahid', NULL, NULL, '0333-5864801', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 22:25:15', '2021-10-14 22:25:15'),
(101, 8, NULL, 'Shoaib Amjad', NULL, NULL, '0300-8052112', NULL, 'Sialkot', 'sialkot', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 22:54:41', '2021-10-14 22:54:41'),
(102, 8, NULL, 'Nouman Saima', NULL, NULL, '03452360522', NULL, 'karachi', 'Karachi', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 23:14:18', '2021-10-14 23:14:18'),
(103, 8, NULL, 'm.Sahazaib', NULL, NULL, '03045243117', NULL, 'Wha Cantt', 'Wha Cantt', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 23:19:05', '2021-10-14 23:19:05'),
(104, 8, NULL, 'Nabeel Yasin', NULL, NULL, '0331-4378041', NULL, 'islamabad', 'islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-14 23:37:14', '2021-10-14 23:37:14'),
(105, 8, NULL, 'Muqadas', NULL, NULL, '0309-5310164', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-15 20:51:26', '2021-10-15 20:51:26'),
(106, 3, NULL, 'FKS', NULL, NULL, '03009527647', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-15 21:04:41', '2021-11-16 21:45:19'),
(107, 8, NULL, 'Suleman Ali', NULL, NULL, '0347-0171386', NULL, 'Mohamdi Chowk', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-16 15:29:08', '2021-10-16 15:29:08'),
(108, 8, NULL, 'Asjad Mehmood', NULL, NULL, '0330-9536996', NULL, 'P/O Box Chak Daulat', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-16 15:33:37', '2021-10-16 15:33:37'),
(109, 3, NULL, 'Hassan Askri (FKS)', NULL, NULL, '1212121', NULL, 'Gujrat', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-18 16:21:20', '2021-11-16 21:41:02'),
(110, 3, NULL, 'Syed Sajad Shah(FKS)', NULL, NULL, '5555', NULL, 'Dina chak', 'Lalamusa', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-18 16:27:41', '2021-11-16 22:29:26'),
(111, 2, NULL, 'Zaida', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-18 21:30:55', '2021-10-18 21:30:55'),
(112, 2, NULL, 'Zora', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-18 21:33:07', '2021-10-18 21:33:07'),
(113, 6, NULL, 'Awais Lodi(ouan syed)', NULL, NULL, '00100', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-18 21:38:13', '2021-11-17 00:26:02'),
(114, 2, NULL, 'Shaid and sons', NULL, NULL, '03026665548', NULL, 'Satellite town gunjrawala', 'Gunjrawala', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-20 18:30:33', '2021-10-20 18:30:33'),
(115, 1, NULL, 'Hamza Malik', NULL, NULL, '03020158541', NULL, 'Dhok Tahli village near kantrilli main kala gujarn jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-21 20:35:42', '2021-10-21 20:35:42'),
(116, 8, NULL, 'Hassan', 'Hassan', NULL, '03362255136', NULL, 'E block Office no.17 street no. 15 city housing jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-21 20:39:18', '2021-11-15 20:23:32'),
(117, 8, NULL, 'Jawad Hashmi', NULL, NULL, '03053390106', NULL, 'House no. E772 Bilal town jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-21 20:40:39', '2021-10-21 20:40:39'),
(118, 3, NULL, 'FKS', NULL, NULL, '03009527642', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-22 18:07:16', '2021-11-16 22:26:21'),
(119, 6, NULL, 'Ouan ali syed', NULL, NULL, '03458576176', NULL, 'dina', 'dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-22 18:28:30', '2021-10-22 18:28:30'),
(120, 3, NULL, 'Shayan (FKS)', NULL, NULL, '11111111111111111', NULL, 'islamabad', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-22 20:09:39', '2021-11-16 21:41:26'),
(121, 6, NULL, 'Rimsha azhar (Parlor)', NULL, NULL, '03345331035', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-22 20:38:44', '2021-10-22 20:38:44'),
(122, 8, NULL, 'M.Shoaib', NULL, NULL, '0306 9533313', NULL, 'Dohk Abdullha Near Markazi Janazagha Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-22 21:17:45', '2021-10-22 21:17:45'),
(123, 3, NULL, 'Shayan Box 3 (FKS)', NULL, NULL, '2222222222', NULL, 'islamabad', 'islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-23 14:30:39', '2021-11-16 21:41:53'),
(124, 8, NULL, 'M Shoaib', NULL, NULL, '0336 9533313', NULL, 'Dhoke Abdullah, Near Markazi Janazagha Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-25 16:20:16', '2021-10-25 16:20:16'),
(125, 8, NULL, 'Hamza Nadeem', NULL, NULL, '0331 3186321', NULL, 'Near Mohallah Baba Mehdi Shah Jannat Masjid Qabristan Chowk Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-25 16:25:05', '2021-10-25 16:25:05'),
(126, 8, NULL, 'Ghulam Hussnain', NULL, NULL, '0313 8214646', NULL, 'Mohallah Chistian, Mouza kot Khairan Post Office District Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-25 16:29:18', '2021-10-25 16:29:18'),
(127, 8, NULL, 'Raja Usman Lahoreya', NULL, NULL, '03075788884', NULL, 'Back side of Dewan e Saeed, House No 2 Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-26 17:45:47', '2021-10-26 17:45:47'),
(128, 8, NULL, 'Mohsin', NULL, NULL, '03119591823', NULL, 'Sheikh Saeed Clothes House Domeli', 'Domeli', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-26 18:12:39', '2021-10-26 18:12:39'),
(129, 8, NULL, 'Mian Osama Zarar', NULL, NULL, '0317 5595687', NULL, 'Citi Housing Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-10-27 15:58:17', '2021-10-27 15:58:17'),
(130, 8, NULL, 'Ahsan Fazal', NULL, NULL, '03405577725', NULL, 'Tahsil Sohawa Dist.Jhelum PO BOX Domeli Rehman Rent car near PSO petrol pump', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-03 20:08:07', '2021-11-03 20:08:07'),
(131, 1, NULL, 'Ansa rubbani', NULL, 'ansa@teqholic.com', '03355761441', NULL, 'Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-08 22:21:16', '2021-11-08 22:21:16'),
(132, 8, NULL, 'Zubair', NULL, NULL, '03074215848', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 21:56:37', '2021-11-09 21:56:37'),
(133, 8, NULL, 'Gath', NULL, NULL, '03352871097', NULL, 'Sindh', 'Sindh', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:07:20', '2021-11-09 22:07:20'),
(134, 8, NULL, 'Saifullah', NULL, NULL, '03133169258', NULL, 'Hyderabad', 'Hyderabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:09:47', '2021-11-09 22:09:47'),
(135, 8, NULL, 'Mudasir Zai', NULL, NULL, '03163961627', NULL, 'Mirpur Khas', 'Mirpur Khas', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:13:05', '2021-11-09 22:13:05'),
(136, 8, NULL, 'Taha Ahmad', NULL, NULL, '03228463091', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:14:47', '2021-11-09 22:14:47'),
(137, 8, NULL, 'Asad', NULL, NULL, '03333290600', NULL, 'Sehwan Sharif', 'Sehwan Sharif', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:17:21', '2021-11-09 22:17:21'),
(138, 8, NULL, 'Ghulam Husnain', NULL, NULL, '03138214646', NULL, 'Jhang', 'Jhang', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:32:47', '2021-11-09 22:32:47'),
(139, 8, NULL, 'Shoaib Janjua', NULL, NULL, '03365337731', NULL, 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:36:42', '2021-11-09 22:36:42'),
(140, 8, NULL, 'Tehseen Ullah', NULL, NULL, '03129236125', NULL, 'Peshaawar', 'Peshaawar', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:43:12', '2021-11-09 22:43:12'),
(141, 8, NULL, 'Abid Saeed', NULL, NULL, '03167259529', NULL, 'Sialkot', 'Sialkot', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:46:50', '2021-11-09 22:46:50'),
(142, 3, NULL, 'Bilal Pa Nat wark(FKS)', NULL, NULL, '03185585997', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 22:52:54', '2021-11-16 22:27:26'),
(143, 2, NULL, 'Time Mart Kharian', NULL, NULL, NULL, NULL, 'kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-09 23:14:01', '2021-11-09 23:14:01'),
(144, 2, NULL, 'Nadeem (FKS)', NULL, NULL, '03009527648', NULL, 'U Mart Kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-10 00:30:48', '2021-11-16 21:43:45'),
(145, 3, NULL, 'FKS', NULL, NULL, '03119527649', NULL, 'dhunni', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-10 23:50:22', '2021-11-16 22:31:36'),
(146, 2, NULL, 'Abdullah Traders', 'Abdullah Traders', NULL, '03224931229', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-11 16:20:47', '2021-11-11 16:27:01'),
(147, 8, NULL, 'Subhani', NULL, NULL, '03038176091', NULL, 'Jhairanwala', 'Jhairanwala', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-12 18:56:57', '2021-11-12 18:56:57'),
(148, 2, NULL, 'SUS Traders', NULL, NULL, '03225546913', NULL, 'Gujranwala', 'Gujranwala setlelite Town', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-12 21:30:30', '2021-11-12 21:30:48'),
(149, 2, NULL, 'Alina Staff', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 20:35:41', '2021-11-13 20:35:41'),
(150, 2, NULL, 'Qasir Naqvi(Fks)g', NULL, NULL, '03009527646', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 20:57:04', '2021-11-13 20:57:04'),
(151, 2, NULL, 'Fks Home', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 21:03:07', '2021-11-13 21:03:07'),
(152, 3, NULL, 'Fks Staff (G)', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 21:18:19', '2021-11-13 21:18:19'),
(153, 3, NULL, 'Nadeem Kojqi(Fks)G', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 22:47:36', '2021-11-13 22:47:36'),
(154, 8, NULL, 'Saqib Shah', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:27:56', '2021-11-13 23:27:56'),
(155, 3, NULL, 'Maryam Staf (Fks)G', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 17:06:28', '2021-11-15 17:06:28'),
(156, 8, NULL, 'Muhmmad Taha', NULL, NULL, '03062952772', NULL, 'Sind karachi', 'Sind karachi', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 17:10:21', '2021-11-15 17:10:21'),
(157, 8, NULL, 'Abdullha Mansur', NULL, NULL, '03350495933', NULL, 'Wapda Town Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 17:13:58', '2021-11-15 17:13:58'),
(158, 3, NULL, 'Gift (7) Box (Fks)', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 17:48:12', '2021-11-15 17:48:12'),
(159, 6, NULL, 'Tahir Kayani', NULL, NULL, NULL, NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 20:55:30', '2021-11-15 20:55:30'),
(160, 6, NULL, 'Tahir Kayani Sample', NULL, NULL, NULL, NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 20:57:07', '2021-11-15 20:57:07'),
(161, 6, NULL, 'Tanveer Lahore (Sample)', NULL, NULL, NULL, NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 21:13:18', '2021-11-15 21:13:18'),
(162, 3, NULL, 'Sajwal (FKS', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 21:37:20', '2021-11-15 21:37:20'),
(163, 3, NULL, 'Sajad shah (Fks)G', NULL, NULL, NULL, NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 21:47:56', '2021-11-15 21:47:56'),
(164, 5, NULL, 'Syed Aqiab Shah', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 22:26:57', '2021-11-15 22:26:57'),
(165, 3, NULL, 'Staff(Fks) (G)', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 22:37:40', '2021-11-15 22:37:40'),
(166, 3, NULL, 'Ali Nayi(FKS)G', NULL, NULL, '0001', NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-15 22:51:58', '2021-11-16 22:19:32'),
(167, 3, NULL, '(Fks)G', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-16 15:18:28', '2021-11-16 15:18:28'),
(168, 6, NULL, 'Condis Mart (Sample) Zahid S', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-16 19:11:53', '2021-11-16 19:11:53'),
(169, 2, NULL, 'Zufqar Ali (Kotla)', NULL, NULL, NULL, NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-16 19:17:29', '2021-11-16 19:17:29'),
(170, 1, NULL, 'Tahir kayani(FKS)', NULL, NULL, '852255', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-16 22:37:38', '2021-11-16 22:37:38'),
(171, 1, NULL, 'BABAR (Gift)FKS', NULL, NULL, '254682134', NULL, 'JHelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-16 23:01:10', '2021-11-17 15:38:42'),
(172, 6, NULL, 'Zahid(sample)Gujrawala', NULL, NULL, '13236548', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 14:55:50', '2021-11-17 14:55:50'),
(173, 6, NULL, 'babar (sample)', NULL, NULL, '4569871', NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 14:57:00', '2021-11-17 14:57:00'),
(174, 6, NULL, 'Awis Lodi (Sample)', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 15:00:30', '2021-11-17 15:00:30'),
(175, 6, NULL, 'Umar Hassan (Sample)', NULL, NULL, NULL, NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 15:03:31', '2021-11-17 15:03:31'),
(176, 3, NULL, 'Ch Nadeem(FKS)G', NULL, NULL, NULL, NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 15:08:05', '2021-11-17 15:08:05'),
(177, 3, NULL, 'Fazal butt (Oun Ali Syed)G', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 15:17:17', '2021-11-17 15:17:17'),
(178, 1, NULL, 'Gelani Mart (Sample)', NULL, NULL, NULL, NULL, 'Rwp', 'Rwp', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:01:16', '2021-11-17 17:01:16'),
(179, 1, NULL, 'fajar traders sample', NULL, NULL, NULL, NULL, 'kotla', 'Kotla', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:04:58', '2021-11-17 17:04:58'),
(180, 4, NULL, 'Tik Tokar (Hamza) Sample', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:50:06', '2021-11-17 17:50:06'),
(181, 5, NULL, 'Ansa(Sample) Staff', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:54:20', '2021-11-17 17:54:20'),
(182, 6, NULL, 'Bilal & Oun Shah (Sample Mirpuar)', NULL, NULL, NULL, NULL, 'Mirpuar', 'Mirpuar', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-17 18:00:36', '2021-11-17 18:00:36'),
(183, 2, NULL, 'Nadeem Dhunni(Fks)G', NULL, NULL, NULL, NULL, 'Dhunni', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-18 20:11:22', '2021-11-18 20:11:22'),
(184, 8, NULL, 'Muhammad Yousaf', NULL, NULL, '03005348542', NULL, 'Islamabad', 'Islamabad', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-19 23:10:50', '2021-11-19 23:10:50'),
(185, 2, NULL, 'Ch Sahazad Pendori', NULL, NULL, NULL, NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-20 12:22:44', '2021-11-20 12:22:44'),
(186, 2, NULL, 'Amaada Mart', NULL, NULL, NULL, NULL, 'Mohammadi Chowk Near saif bakers', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-22 15:59:56', '2021-11-22 15:59:56'),
(187, 3, NULL, 'U Mart (Oun Shah)G', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-26 10:19:41', '2021-11-26 10:19:41'),
(188, 1, NULL, 'amada mart (1+1 offer)', 'amada mart (1+1 offer)', NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-26 10:41:13', '2021-11-26 10:41:13'),
(189, 1, NULL, 'Ajwa mart ( Sample )', 'Ajwa mart ( Sample )', NULL, '0544620002', '83581470', 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-26 10:55:15', '2022-02-22 16:12:35'),
(190, 8, NULL, 'Dr.Ghazanfar Saeed', NULL, NULL, '03457484586', NULL, 'Islampura Toba Tek Singh, Pakistan', 'Toba Tek Singh', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-26 12:08:00', '2021-11-26 12:08:00'),
(191, 6, NULL, 'H & H Traders Sample', 'H & H Traders Sample', NULL, NULL, NULL, 'Jhelum', 'JHELUM', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 09:45:42', '2021-11-27 09:45:42'),
(192, 1, NULL, 'dmart dina Sample', 'dmart dina Sample', NULL, '02505202520', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 09:49:54', '2021-12-09 16:02:31'),
(193, 6, NULL, 'al fajjar traders sample', NULL, NULL, NULL, NULL, 'kotla', 'kotla arab ali', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 09:53:31', '2021-11-27 09:53:31'),
(194, 6, NULL, 'Al mada mart jhelum', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 10:00:42', '2021-11-27 10:00:42'),
(195, 6, NULL, 'Al mada mart jhelum', NULL, NULL, NULL, NULL, 'jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 10:00:42', '2021-11-27 10:00:42'),
(196, 6, NULL, 'SUS Traders sample', 'SUS Traders Sample', NULL, '0121212121', NULL, 'Gujranwala', 'Gujranwala', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-27 10:04:10', '2021-11-27 10:10:36'),
(197, 1, NULL, 'Riffat', 'Teqholic', 'rifat@gmail.com', '000000000', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-30 17:11:23', '2021-11-30 17:15:51'),
(198, 4, NULL, 'Nadeem Sarwar Lahore (Oun shah)S', NULL, NULL, NULL, NULL, 'lahore', 'lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 13:34:50', '2021-12-01 13:34:50'),
(199, 3, NULL, 'CH Qamar(Gift)', NULL, 'bb8126006@gmail.com', NULL, NULL, 'jhelum pakistan', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 16:55:40', '2021-12-01 16:55:40'),
(200, 3, NULL, 'Mohsan sab ajwa mart (oun shah)', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-04 10:52:44', '2021-12-04 10:52:44'),
(201, 6, NULL, 'Al mada mart jhelum Sample(Z)', NULL, NULL, NULL, NULL, 'Jhelum', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-04 10:55:41', '2021-12-04 10:55:41'),
(202, 8, NULL, 'Tamoor Hassan', NULL, NULL, '03406591487', NULL, 'Gujrat', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-04 11:02:15', '2021-12-04 11:02:15'),
(203, 8, NULL, 'Qasim Bhatti', NULL, NULL, '03094400118', NULL, 'Lahore', 'lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-04 11:04:11', '2021-12-04 11:04:11'),
(204, 8, NULL, 'Umer Azam', NULL, NULL, '03086678707', NULL, 'Gujrat', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-04 11:05:45', '2021-12-04 11:05:45'),
(205, 2, NULL, 'Tanveer lahore (Panding Bill)', NULL, NULL, NULL, NULL, 'Lahore', 'lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-06 10:39:20', '2021-12-06 10:39:20'),
(206, 2, NULL, 'Tanveer Lahore (Ratran Bill)', NULL, NULL, NULL, NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-06 11:01:35', '2021-12-06 11:01:35'),
(207, 2, NULL, 'Tanveer Lahore (Return Bill)', NULL, NULL, NULL, NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-06 11:03:34', '2021-12-06 11:03:34'),
(208, 2, NULL, 'H & H Traders', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-07 11:55:25', '2021-12-07 11:55:25'),
(209, 6, NULL, 'H & H Traders (Sample)', NULL, NULL, '7777777777777', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-07 12:01:40', '2022-05-28 12:22:40'),
(210, 8, NULL, 'Danish Aslam', NULL, NULL, '03458890006', NULL, 'Karachi', 'Karachi', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-07 12:06:56', '2021-12-07 12:06:56'),
(211, 8, NULL, 'Mudassir Shahzad', NULL, NULL, '03115894029', NULL, 'Attock', 'Attock', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-11 14:36:46', '2021-12-11 14:36:46'),
(212, 2, NULL, 'Ginza Mart (Jhelum)', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-13 10:54:03', '2021-12-13 10:54:03'),
(213, 2, NULL, 'Ammada Mart', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-13 11:23:37', '2021-12-13 11:23:37'),
(214, 6, NULL, 'Ginza M (Sample)', NULL, NULL, '5555558222222', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-13 14:01:10', '2022-05-28 12:03:17'),
(215, 6, NULL, 'Ouan Shah (Sample)', NULL, NULL, NULL, NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-14 10:34:01', '2021-12-14 10:34:01'),
(216, 1, NULL, 'Pak Mart', NULL, NULL, '03210675038', 'A212167-1', 'sarai alamgir', 'sarai alamgir', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-14 16:53:59', '2022-03-22 12:56:23'),
(217, 5, NULL, 'Maryam', NULL, NULL, '03457484586', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-14 17:19:25', '2021-12-14 17:19:25'),
(218, 8, NULL, 'Adual Haleem', NULL, NULL, '03218647556', NULL, 'Gwadar', 'Gwadar', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-15 15:03:12', '2021-12-15 15:03:12'),
(219, 8, NULL, 'M.Numan Shoukat', NULL, NULL, '03019765276', NULL, 'Lahore', 'lahore', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-15 15:06:41', '2021-12-15 15:06:41'),
(220, 2, NULL, 'Leader Price Mart', 'Leader Price Mart', 'leadermarket@gmail.com', '000000000000', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 11:55:20', '2021-12-20 14:04:03'),
(221, 1, NULL, 'Standard Pharmacy & Super Mart', NULL, NULL, '0544612713', NULL, 'Shaheen Rd, Jhelum, Punjab 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-23 10:28:15', '2021-12-23 10:28:15'),
(222, 1, NULL, 'Umair Supermarket', 'Umair Supermarket', NULL, '+92 333 3302333', NULL, 'Umair departmental store, Karimpura, Lalamusa, Gujrat, Punjab, Pakistan', 'Lalamusa', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-27 10:48:32', '2021-12-27 10:48:32'),
(223, 8, NULL, 'Shahzad Ali', NULL, NULL, '923066363413', NULL, 'Shamal road Shakargarh Punjab', 'Shakargarh', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-03 10:49:11', '2022-01-03 10:49:11'),
(224, 1, NULL, 'Abbasi Color Cosmetics', NULL, NULL, NULL, NULL, 'Main Bazar, Kharian', 'kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-04 11:30:22', '2022-01-04 11:30:22'),
(225, 3, NULL, 'Haseeb Mirza', NULL, NULL, '03105566676', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-04 11:54:21', '2022-01-04 11:54:21'),
(226, 3, NULL, 'Hamza Mirza', NULL, 'saeedhamza326@gmail.com', '03495717759', NULL, 'Machine Mohallah, Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-04 11:57:15', '2022-01-04 11:57:15'),
(227, 8, NULL, 'Imran khan', NULL, NULL, '03209737798', NULL, 'Peshawar', 'Peshawar', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-10 16:34:04', '2022-01-10 16:34:04'),
(228, 12, NULL, 'CBS STORE', 'CBS STORE', NULL, '03107219516', '74140942', 'Gujrat', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-10 16:49:36', '2022-03-22 13:03:50'),
(229, 6, NULL, 'Daniyal (sample)', 'Totex', NULL, '03105582385', NULL, 'jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-12 12:19:38', '2022-02-17 11:33:02'),
(230, 12, NULL, 'Abbasi Color Cosmetics', NULL, NULL, NULL, NULL, 'Sari Alamgir', 'Sari Alamgir', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-12 21:13:53', '2022-01-12 21:13:53'),
(231, 12, NULL, 'H super mart', NULL, NULL, '03005352472', NULL, 'KDD Garden Housing scheme Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 09:21:26', '2022-05-28 10:27:14'),
(232, 12, NULL, 'Sky Chemist and Cosmetics', NULL, NULL, '0345 3461112', NULL, 'Allama Iqbal Road Mirpur', 'Mirpur Azad Kashmir', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 10:18:07', '2022-01-18 10:18:07'),
(233, 11, NULL, 'Al Shifa Medical', NULL, NULL, '03461085805', NULL, 'Allama Iqbal Road Mirpur', 'Mirpur Azad Kashmir', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 10:43:14', '2022-01-18 10:43:14'),
(234, 11, NULL, 'Shaheen Chemist', NULL, NULL, '0305 5444303', NULL, '4PXH+F3X, Sector B-3 New Mirpur City, Azad Jammu and Kashmir 10250', 'Mirpur Azad Kashmir', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 11:00:54', '2022-01-18 11:00:54'),
(235, 11, NULL, 'M Hussain G/S', NULL, NULL, '02222255588', NULL, 'M Hussain Kala Gujran Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 11:28:24', '2022-05-28 10:28:27'),
(236, 11, NULL, 'Subhan Cosmetics', NULL, NULL, NULL, NULL, 'Subhan Cosmetics Civil Lines Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-18 11:33:47', '2022-01-18 11:33:47'),
(237, 1, NULL, 'Umart kharian', 'Umart Kharian', NULL, NULL, NULL, 'Kharian Gt road', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 10:43:56', '2022-01-24 10:43:56'),
(238, 1, NULL, 'Resham General store', 'Resham General store', NULL, NULL, NULL, 'Main bazar kharian', 'Main bazar kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 11:03:59', '2022-01-24 11:03:59'),
(239, 1, NULL, 'Al madina cosmatics', 'Al madina', NULL, '000001111', NULL, 'Dina', 'Dina', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 11:18:42', '2022-05-28 10:38:39'),
(240, 1, NULL, 'Ansar', NULL, NULL, NULL, NULL, 'Duni adaa, Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 11:33:38', '2022-01-24 11:33:38'),
(241, 12, NULL, 'Kurshid General store', 'Kurshid General store', NULL, NULL, NULL, 'Gujar khan', 'Gujar khan Main bazar', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-25 11:13:24', '2022-01-25 11:13:24'),
(242, 1, NULL, 'One stop mart', 'One stop mart', NULL, NULL, NULL, 'Bhimar Road Gujrat', 'Bhimber Road Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-26 10:15:55', '2022-01-26 10:15:55'),
(243, 12, NULL, 'Paris Mart', 'Paris Mart', NULL, '03030119616', '3578645-7', 'Wazirabad', 'Wazirabad', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-26 10:35:13', '2022-03-08 12:51:29'),
(244, 1, NULL, 'D Watson Chemist', NULL, 'dwatson@gmail.com', '0513510215', NULL, 'New Barki, Gujar Khan, Rawalpindi, Punjab', 'Gujar Khan', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 12:25:41', '2022-05-28 10:56:24'),
(245, 1, NULL, 'Pothar Cash and Carry', NULL, 'potohar@gmail.com', '0302 5341012', NULL, 'Grand Trunk Rd, near al-hamra, Sohawa, Jhelum, Punjab 49230', 'Sohawa', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 12:36:15', '2022-05-28 10:54:52'),
(246, 1, NULL, 'Al Habib Bakers', NULL, 'alhabib@gmail.com', '03455558786', NULL, 'Mohalla Shaheedan Sarai Alamgir, Gujrat, Punjab', 'Sarai Alamgir', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 14:59:58', '2022-05-28 11:01:20'),
(247, 1, NULL, 'Doctor Pharamacy', NULL, 'doctorpharamacy@gmail.com', '--------', NULL, '----------', '-----------', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 15:11:19', '2022-02-01 15:11:19'),
(248, 1, NULL, 'Noor Super Store', NULL, 'noorsupermart@gmail.com', '0544626465', NULL, 'Mian Mohammad Bakhsh Rd, Machine Mohalla 3, Machine Mohalla, Old G T Rd, Machine Mohalla 3, Jhelum, Punjab 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 15:23:02', '2022-02-01 15:23:02'),
(249, 1, NULL, 'Al shifa pharmacy', NULL, 'alshifapharamacy@gmail.com', '....................', NULL, 'Main Bazar, Kala Gujran, Jhelum, Punjab 49600', 'Jhelum,', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 15:46:56', '2022-02-01 15:46:56'),
(250, 1, NULL, 'City Pharmacy / Clinic', NULL, NULL, '0544278668', NULL, 'Jadha Road, Machine Mohalla No.2 Machine Mohalla 2, Jhelum, Punjab 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-01 16:00:32', '2022-02-01 16:00:32'),
(251, 1, NULL, 'Al Makah super store', NULL, NULL, '0544646651', NULL, 'Grand Trunk Rd, Kala Gujran, Jhelum, Punjab', 'jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 12:46:34', '2022-02-05 12:46:34'),
(252, 1, NULL, 'Al Makkah superstore chak jamal', NULL, NULL, '....', NULL, 'Chak Jamal Rd, Chak Jamal, Jhelum, Punjab', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 15:36:33', '2022-02-05 15:36:33'),
(253, 1, NULL, 'Al Maz cosmetics', NULL, NULL, '0544293128', NULL, 'Civil Lines, Naya Mohalla Jhelum, Jhelum, Punjab 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 15:54:20', '2022-02-05 15:54:20'),
(254, 1, NULL, 'Fazal Din Pharmacy', NULL, NULL, '0537602313', NULL, 'Kharian Plaza, Grand Trunk Rd, near PSO Petrol Pump, Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 16:05:13', '2022-02-05 16:05:13'),
(255, 1, NULL, 'Smart Pharmacy', NULL, NULL, '0544624201', NULL, 'Machine Mohalla No.2, Jhelum, Punjab, 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 16:11:12', '2022-02-05 16:11:12'),
(256, 1, NULL, 'M D Pharmacy', NULL, NULL, '0332 5674741', NULL, 'Civil Lines Rd, Civil Lines, opposite soldier plaza, Shamali Mohalla, Jhelum, Punjab 49600', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 16:27:52', '2022-05-28 11:10:46'),
(257, 1, NULL, 'RD MART- Discount Centre', NULL, NULL, '05827443562', NULL, 'Main Nangi Rd, Sector B-3 New Mirpur City, Azad Jammu and Kashmir 10250', 'Mirpur', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-05 17:18:34', '2022-02-05 17:18:34'),
(258, 1, NULL, 'M store', NULL, NULL, '0302 8519494', NULL, 'Address: 1 Main Street, Kharian Cantt Kharian, Gujrat, Punjab 50090', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-07 09:46:11', '2022-02-07 09:46:11'),
(259, 1, NULL, 'Best Super Mart', NULL, NULL, '0333 4416842', NULL, 'khairiyah', 'khairiyah', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-07 10:02:38', '2022-05-28 10:46:15'),
(260, 1, NULL, 'Ch Khadam G/S Mirpure', NULL, NULL, '............', NULL, 'Mirpure', 'Mirpure', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-07 10:17:14', '2022-02-07 10:17:14'),
(261, 1, NULL, 'SKY Chemist & Cosmetics', NULL, NULL, '0345 3461112', NULL, 'Allama iqbal road mirpur azad kashmir Mirpur, Azad Kashmir-10250', 'Mirpur', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-07 10:44:53', '2022-02-07 10:44:53'),
(262, 1, NULL, 'Ali General Store', NULL, NULL, '05827444499', NULL, 'Main Nangi Rd, Sector B-1, Sector B, Mirpur, AJK', 'Mirpur', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-07 10:53:00', '2022-02-07 10:53:00'),
(263, 1, NULL, 'Ask SHIFA Pharmacy Jhelum CANTT', NULL, NULL, '0544670120', NULL, 'NEAR C.M.H JHELUM CANTT Jhelumabad, Punjab, Pakistan-49600', 'JHELUM CANTT', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-08 09:30:51', '2022-02-08 09:30:51'),
(264, 1, NULL, 'welfare cosmetics shop Jhelum cantt', NULL, NULL, '......', NULL, 'Jhelum cantt', 'Jhelum cantt', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-08 09:35:28', '2022-02-08 09:35:28'),
(265, 1, NULL, 'Merab cosmetics Jhelum', NULL, NULL, '03215451485', NULL, 'tehsil road jhelum, Jhelum, Punjab 49600', 'Jhelum, Punjab', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-08 09:41:55', '2022-05-28 11:02:56'),
(266, 1, NULL, 'Lidlz Mart', NULL, NULL, '.......', NULL, 'Almudassir Chowk, Panjan Kasana Village, Gujrat,', 'Gujrat', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-16 09:37:27', '2022-02-16 09:37:27'),
(267, 1, NULL, 'lahore Gift Center', NULL, NULL, '0300 1693693', NULL, 'khariyah', 'khariyah', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 15:13:10', '2022-02-21 12:44:41'),
(268, 1, NULL, 'Orange pharmacy', NULL, NULL, '03361675666', '09842004', 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 15:23:16', '2022-02-21 12:35:48'),
(269, 1, NULL, 'SNS Super Mart', NULL, NULL, '..........................', '39962229', 'SNS MART (SHOP N STOP MART) Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 15:40:04', '2022-05-28 11:23:27'),
(270, 1, NULL, 'Hash Mart', NULL, NULL, '03361500185', '0518745975', 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 15:44:26', '2022-05-28 11:13:18'),
(271, 1, NULL, 'GREEN PLUS PHARMACY', NULL, NULL, '03215220709', '3530274-7', 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 15:56:23', '2022-03-01 15:50:24'),
(272, 1, NULL, 'KHUSBOO COSMETICS', NULL, NULL, '03225128834', NULL, 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 16:02:05', '2022-02-19 16:02:05'),
(273, 1, NULL, 'GREEN LINE PLUS PHARMACY', NULL, NULL, '03338970280', '8230224765005', 'Rawalpindi', 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 16:04:31', '2022-02-21 12:37:33'),
(274, 1, NULL, 'BinDad Farmacy', NULL, NULL, '0000000', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 16:20:35', '2022-02-19 16:20:35'),
(275, 1, NULL, 'Kharian', NULL, NULL, '03016751894', NULL, 'Anmbala bakers dinga road', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 16:26:44', '2022-02-19 16:26:44'),
(276, 1, NULL, 'Alshamas bakers dinga road', NULL, NULL, '00000000', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-19 16:30:19', '2022-02-19 16:30:19'),
(277, 1, NULL, 'Anmbala bakers dinga road', NULL, NULL, '03016751894', NULL, 'Kharian', 'Kharian', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-21 10:54:04', '2022-02-21 10:54:04'),
(278, 1, NULL, 'HAFIZ MINI MART', NULL, NULL, '.............', NULL, 'KHARIAN', 'KHARIAN', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-21 11:00:51', '2022-02-21 11:00:51'),
(279, 1, NULL, 'Rehan gen store', NULL, NULL, '03156259814', NULL, 'Rehan gen store chakian Bazar near Khalid medical store, Lala Musa', 'Lala Musa', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-22 16:22:11', '2022-02-22 16:22:11'),
(280, 1, NULL, 'Khokar cosmetics shop', NULL, NULL, '03456975404', NULL, 'Khokbar cosmetics shop Nalkay wali Gali, Lala Musa', 'Lala Musa', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-22 16:22:52', '2022-03-14 11:05:30'),
(281, 1, NULL, 'Mariyam Staff', NULL, NULL, '....', NULL, 'Jhelum', 'Jhelum', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-24 11:46:05', '2022-02-24 11:46:05'),
(282, 1, NULL, 'JK Collection', 'JK Collection', NULL, '03033333661', NULL, 'Lahore', 'Lahore', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-24 12:27:38', '2022-02-24 12:27:38');
INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(283, 1, NULL, '7 Mart', '7 Mart', NULL, NULL, NULL, 'Allama Iqbal town', 'Allama Iqbal town', NULL, NULL, NULL, NULL, NULL, 1, '2022-02-24 12:29:11', '2022-02-24 12:29:11'),
(284, 1, NULL, 'shah kasmatics', NULL, NULL, '12345', NULL, 'jhelum', 'khariya', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-04 11:22:28', '2022-03-04 11:22:28'),
(285, 12, NULL, 'Mohsin Ali', 'Checkout', NULL, '0331 6330978', '4552806-8', 'G.T Road Chak, Pirana kharian, Gujrat kharian', 'Gujrat', 'Punjab', '50090', 'Pakistan', NULL, NULL, 1, '2022-03-17 10:52:47', '2022-03-17 10:52:47'),
(286, 12, NULL, 'Mohsin Ali', 'Checkout', NULL, '0331 6330978', '4552806-8', 'G.T Road, Chak, Pirana Kharian, Gujrat Kharian', 'Gujrat', 'Punjab', '50090', 'Paksitan', NULL, NULL, 0, '2022-03-17 10:55:08', '2022-03-17 10:55:36'),
(287, 12, NULL, 'Mohsin Ali', 'Checkout', NULL, '0331 6330978', '4552806-8', 'G.T Road, Chak, Pirana Kharian, Gujrat Kharian', 'Gujrat', 'Punjab', '50090', 'Paksitan', NULL, NULL, 0, '2022-03-17 10:56:57', '2022-03-17 10:57:38'),
(288, 1, NULL, 'demo customer', 'demo tech', 'demo@gmail.com', '03682465821', '8521478', 'City housing jhelum', 'jhelum', NULL, 'filer', NULL, NULL, NULL, 1, '2022-03-19 10:42:17', '2022-03-19 10:42:17'),
(289, 1, NULL, 'HNH Traders', NULL, NULL, '.......', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-03-28 17:00:54', '2022-03-28 17:00:54'),
(290, 1, NULL, 'usama sheraz (staff)', NULL, NULL, '03171495283', NULL, 'kharala jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-03-30 16:04:32', '2022-04-27 09:31:02'),
(291, 1, NULL, 'Gifts', NULL, 'Bm@shahcorporationltd.com', NULL, NULL, 'jhelum pakistan', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-04-04 10:49:00', '2022-04-04 10:49:00'),
(292, 1, NULL, 'Ali Asghar', NULL, 'aa@shahcorporationltd.com', '03313177731', NULL, 'Bahria phase 7', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-04-04 10:53:05', '2022-04-04 10:53:05'),
(293, 1, NULL, 'FSK (Hadi shah)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'filer', NULL, NULL, NULL, 1, '2022-04-16 14:18:28', '2022-04-16 14:18:28'),
(294, 1, NULL, 'FSK(Taqdas )', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'filer', NULL, NULL, NULL, 1, '2022-04-16 14:24:45', '2022-04-16 14:24:45'),
(295, 1, NULL, 'Ather Ansari (samples)', NULL, NULL, '0319 0524299', NULL, 'Shah Corporation', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-04-27 15:09:33', '2022-04-27 15:09:33'),
(296, 1, NULL, 'ms(karnal ijaz)', NULL, NULL, '03219592786', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-05-13 15:36:56', '2022-05-13 15:36:56'),
(297, 1, NULL, 'Ali Akbar', NULL, NULL, '8888888888', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-05-28 16:37:21', '2022-05-28 16:37:21'),
(298, 1, NULL, 'SFK(Sistar.Saqib shah)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-06 16:37:47', '2022-06-06 16:37:47'),
(299, 1, NULL, 'Hamza Seead', NULL, NULL, 'koi ni', NULL, 'jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-14 16:24:22', '2022-06-14 16:24:22'),
(300, 1, NULL, 'Hamza saeed (satff)', NULL, NULL, 'koi ni', NULL, 'jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-14 16:27:35', '2022-06-14 16:27:35'),
(301, 1, NULL, 'Hamza saeed (satff)', NULL, NULL, '03495717759', NULL, 'jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-14 16:29:12', '2022-06-14 16:29:12'),
(302, 1, NULL, 'adnan salesman(sampal)', NULL, NULL, '0306-5908279', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-17 17:22:40', '2022-06-17 17:22:40'),
(303, 1, NULL, 'ali raza', NULL, NULL, '03036202253', NULL, 'SKB Camp Mianwali Road Bilabad Talagang', 'Talagang', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-20 10:33:37', '2022-06-20 10:37:22'),
(304, 1, NULL, 'Paradies Malik', NULL, NULL, '+971528984642', NULL, 'Rohtas Road Dina Dhar Faisal Town Gali No-3 House No-15', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-21 16:47:12', '2022-06-21 16:47:12'),
(305, 1, NULL, 'Shabbir Hussain', NULL, NULL, '0305-5148501', NULL, 'Bawli Sharif', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-23 17:25:55', '2022-06-23 17:25:55'),
(306, 1, NULL, 'Hadiqa Habib (staff)', NULL, NULL, '0332 9397068', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-24 17:10:22', '2022-06-24 17:10:22'),
(307, 1, NULL, 'Baqir Qureshi', NULL, NULL, '0317-1970547', NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-25 11:58:32', '2022-06-25 11:58:32'),
(308, 1, NULL, 'Ahmed (Barbar)', NULL, NULL, '03157708567', NULL, 'gujrawala', 'gujrawala', NULL, 'none', NULL, NULL, NULL, 1, '2022-06-27 17:56:40', '2022-06-27 17:56:40'),
(309, 1, NULL, 'Adnan Hafeez', NULL, 'online', '03008633364', NULL, 'Multan', 'Multan', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-01 12:44:08', '2022-07-01 12:44:08'),
(310, 1, NULL, 'Zahid Mahmood (Manshester Hairn Salon)', NULL, NULL, '03481510819', NULL, 'Sarai Alamgir', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-04 11:33:43', '2022-07-04 11:33:43'),
(311, 1, NULL, 'Mohammad  Aslam(Europe Hair Salon Dinga Road Kharian)', NULL, NULL, '03107739847', NULL, 'kharian', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-04 11:39:15', '2022-07-04 11:39:15'),
(312, 1, NULL, 'Ghulam Jafar', NULL, NULL, '03099706358', NULL, 'City Housing Jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 11:27:17', '2022-07-06 11:27:17'),
(313, 1, NULL, 'Barbar Shop Dina', NULL, NULL, '03009575309', NULL, 'Main Bazar Data Rood Dina', 'Dina', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 11:29:31', '2022-07-06 11:29:31'),
(314, 1, NULL, 'Barbar Shop Main Data Rood Dina', NULL, NULL, '03009575309', NULL, 'Dina', 'Dina', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 11:33:12', '2022-07-06 11:33:12'),
(315, 1, NULL, 'Bilal Zamir (Daraz)', NULL, NULL, '03134693737', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 16:09:03', '2022-07-06 16:09:03'),
(316, 1, NULL, 'Bilal Zamir (Daraz)', NULL, NULL, '03134693737', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 16:09:04', '2022-07-06 16:09:04'),
(317, 1, NULL, 'Zubair(Daraz)', NULL, NULL, '03009639408', NULL, 'Multan', 'Multan', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 16:12:24', '2022-07-06 16:12:24'),
(318, 1, NULL, 'FKS (Gifat)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-06 16:14:50', '2022-07-06 16:14:50'),
(319, 1, NULL, 'Muhammad Awis Daraz', NULL, NULL, '03487976951', NULL, 'Dadyal', 'Azad Kashmir', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-13 11:06:11', '2022-07-13 11:06:11'),
(320, 1, NULL, 'Ammad Daraz', NULL, NULL, '03472831864', NULL, 'Sindh', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-13 11:08:24', '2022-07-13 11:08:24'),
(321, 1, NULL, 'Faizan Umar Daraz', NULL, NULL, '03459010338', NULL, 'Khyber', 'Peshawar', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-13 11:10:06', '2022-07-13 11:10:06'),
(322, 1, NULL, 'Nisar Haider', NULL, 'nisar@gmail.com', '+447476518173', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-16 14:28:49', '2022-07-16 14:31:12'),
(323, 1, NULL, 'VIP Barber', NULL, NULL, '03495339224', NULL, 'Dinga City Kharian', 'Dinga City Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-20 09:42:18', '2022-07-20 09:45:36'),
(324, 1, NULL, 'Shazia Hair Salon', NULL, NULL, '03175375412', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-21 14:38:42', '2022-07-21 14:38:42'),
(325, 1, NULL, 'Haider salon City Housaing', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-21 14:43:45', '2022-07-21 14:43:45'),
(326, 1, NULL, 'Revive Salon (Khaliq Sab Gift)', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-21 14:49:07', '2022-07-21 14:49:07'),
(327, 1, NULL, 'FKS (Gifat) Atif', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-21 14:51:59', '2022-07-21 14:51:59'),
(328, 1, NULL, 'Tahir Ali(Daraz)', NULL, NULL, '03451995204', NULL, 'Sindh', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-21 15:07:44', '2022-07-21 15:07:44'),
(329, 1, NULL, 'Safie jamel', NULL, NULL, '03464170118', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-22 10:21:23', '2022-07-22 10:21:23'),
(330, 1, NULL, 'Wajhatt Hussain(Daraz)', NULL, NULL, '03062646223', NULL, 'Sheikhupura', 'Sheikhupura', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-23 14:58:58', '2022-07-23 14:58:58'),
(331, 1, NULL, 'Nabeel (Al Sadeeq Hair Salon', NULL, NULL, '03126732996', NULL, 'jhelum', 'jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-25 10:24:37', '2022-07-25 10:24:37'),
(332, 1, NULL, 'Gulam(Holy Wood Hair Salon)', NULL, NULL, '03005450028', NULL, 'Dina', 'Dina', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-25 10:30:50', '2022-07-25 10:30:50'),
(333, 1, NULL, 'Adeel Raheem(Daraz)', NULL, NULL, '03341414141', NULL, 'Islamabad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-26 12:35:53', '2022-07-26 12:35:53'),
(334, 1, NULL, 'Shahzad Furqan', NULL, NULL, '03343655962', NULL, 'Sindh', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-27 17:26:44', '2022-07-27 17:26:44'),
(335, 1, NULL, 'AmmarA(Daraz)', NULL, NULL, '03334333136', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-27 17:27:37', '2022-07-27 17:27:37'),
(336, 1, NULL, 'Amir Ideel(online)', NULL, NULL, '03212944179', NULL, 'Sindh', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-29 11:08:30', '2022-07-29 11:08:30'),
(337, 1, NULL, 'Mohammad  Umer(Online)', NULL, NULL, '03005410576', NULL, 'kharian', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-29 12:34:49', '2022-07-29 12:34:49'),
(338, 1, NULL, 'Hizbullah(Al Buraq Mart)', NULL, NULL, '03430006780', '7579858-4', 'Bahria Town Islamabad', 'Islamabad', NULL, 'filer', NULL, NULL, NULL, 1, '2022-07-30 11:08:55', '2022-07-30 11:08:55'),
(339, 1, NULL, 'Mr.Ayaz(Empire Mart)', NULL, NULL, '03229924640', '7068534-6', 'Iqbal Road Civic Centre Airport Rawalpindi', 'Rawalpindi', NULL, 'filer', NULL, NULL, NULL, 1, '2022-07-30 11:16:52', '2022-07-30 11:16:52'),
(340, 1, NULL, 'Mr.Haris(Pak One Mart)', NULL, NULL, '03105531518', NULL, 'Sowan Camp', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-07-30 13:56:46', '2022-07-30 13:56:46'),
(341, 1, NULL, 'Syed Ali Hassan(Online)', NULL, NULL, '03098205202', NULL, 'kotla Arab Ali Khan', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-01 13:30:48', '2022-08-01 13:30:48'),
(342, 1, NULL, 'Adeel Raheem(Online)', NULL, NULL, '03341414141', NULL, 'Park Road Chak Shahzad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-02 11:37:50', '2022-08-02 11:37:50'),
(343, 1, NULL, 'Ali Asghar (Sent Extra Stick)', NULL, NULL, '03313177731', NULL, 'Islamabad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-04 14:11:30', '2022-08-04 14:11:30'),
(344, 1, NULL, 'Dani Gay', NULL, NULL, NULL, NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-05 10:33:56', '2022-08-05 10:33:56'),
(345, 1, NULL, 'Kamran Miraj', NULL, NULL, '03218127749', NULL, 'Kohsar Colony Kexila Phase 2 Near Ameeri Hamza masjid Punjab Taxila Pakistan', 'Taxila', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-06 09:37:46', '2022-08-06 09:37:46'),
(346, 1, NULL, 'Danial Amjad', NULL, NULL, '0347598928', NULL, 'Kala gujran', 'Kala gujran', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-06 15:11:56', '2022-08-06 15:11:56'),
(347, 1, NULL, 'Kashif  Mushtaq', NULL, NULL, '03349047993', NULL, 'Pashwar', 'Pashwar', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-15 09:56:47', '2022-08-15 09:56:47'),
(348, 1, NULL, 'Nisar Shah', NULL, NULL, '03143882799', NULL, 'Sarai Alamgir', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-17 16:38:13', '2022-08-17 16:38:13'),
(349, 1, NULL, 'SFK(Sukhat)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-18 09:25:50', '2022-08-18 09:25:50'),
(350, 1, NULL, 'SFK (MamaMunwar)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-23 11:50:18', '2022-08-23 11:50:18'),
(351, 1, NULL, 'SFK(Qadeer Shah Uk)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-23 11:53:43', '2022-08-23 11:53:43'),
(352, 1, NULL, 'SFK(Tuqeer)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-23 15:11:59', '2022-08-23 15:11:59'),
(353, 1, NULL, 'Abid Khan (Daraz)', NULL, NULL, '03422013196', NULL, 'Swat Khyber', 'Pakhtunkhwa', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-23 16:16:08', '2022-08-23 16:16:08'),
(354, 1, NULL, 'Muhammad Haris', NULL, 'haris@gmail.com', '923356110132', NULL, 'Khan House number 821, street 32 Islamabad -G- 15 Sector 1 Pakistan Islamabad-G-15', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-24 16:17:40', '2022-08-24 16:17:40'),
(355, 1, NULL, 'Sampal (Video MirPar)', NULL, NULL, NULL, NULL, 'Mirpar', 'Mirpar', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-25 15:43:27', '2022-08-25 15:43:27'),
(356, 1, NULL, 'Amaada Mart', NULL, NULL, 'invoice No 042350', NULL, 'Jhelum', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-26 16:15:10', '2022-08-26 16:15:10'),
(357, 1, NULL, 'New Office Isamabad', NULL, NULL, '03313177731', NULL, 'Islamabad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-08-31 12:12:42', '2022-08-31 12:12:42'),
(358, 1, NULL, 'Euro Mart', NULL, NULL, '03125030893', NULL, 'Gujar Khan', 'Gujar Khan', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-03 08:53:26', '2022-09-03 08:53:26'),
(359, 1, NULL, 'Adnan Staff', NULL, NULL, '03419607984', NULL, 'Dina', 'Dina', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-03 09:04:04', '2022-09-03 09:04:04'),
(360, 1, NULL, 'Nisar Ahmed', NULL, NULL, '03370348959', NULL, 'Sinad', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-05 14:51:43', '2022-09-05 14:51:43'),
(361, 1, NULL, 'Afaq Khan (Daraz)', NULL, NULL, '03018977716', NULL, 'Khyber', 'Pakhtunkhwa', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-05 14:53:47', '2022-09-05 14:53:47'),
(362, 1, NULL, 'Asad Ullah(Daraz)', NULL, NULL, '03499356487', NULL, 'Khyber', 'Pakhtunkhwa', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-06 09:11:10', '2022-09-06 09:11:10'),
(363, 1, NULL, 'Asad Ullah(Daraz)', NULL, NULL, '03499356487', NULL, 'Khyber', 'Pakhtunkhwa', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-06 09:11:45', '2022-09-06 09:11:45'),
(364, 1, NULL, 'Mehak Soomro (Zaraz)', NULL, NULL, '03337762472', NULL, 'Karachi', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-08 10:39:36', '2022-09-08 10:39:36'),
(365, 1, NULL, 'Malik Faisal(Daraz)', NULL, NULL, '03085781207', NULL, 'Mianwali', 'Mianwali', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 11:26:30', '2022-09-10 11:26:30'),
(366, 1, NULL, 'ARSLAN IJAZ (Daraz)', NULL, 'ijazarslan372@gmail.com', '03059489539', NULL, 'Dhok Gangal Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 12:40:04', '2022-09-10 12:40:04'),
(367, 1, NULL, 'Taj Pharmacy', NULL, NULL, '03115053228', NULL, 'Gulshan Abad Adyala', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 16:16:17', '2022-09-10 16:16:17'),
(368, 1, NULL, 'Neison Pharmacy', NULL, NULL, '03265082311', NULL, 'Mall Road Saddar', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 17:05:44', '2022-09-10 17:05:44'),
(369, 1, NULL, 'Nalson', NULL, NULL, NULL, NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 17:06:47', '2022-09-10 17:06:47'),
(370, 1, NULL, 'Nelson Pharmacy', NULL, NULL, '03265082311', NULL, 'Mall Road Saddar', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-10 17:08:10', '2022-09-10 17:08:10'),
(371, 1, NULL, 'Umair Jamshed(Daraz)', NULL, NULL, NULL, '03244902563', 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-12 14:57:39', '2022-09-12 14:57:39'),
(372, 1, NULL, 'Euro Mart', NULL, NULL, '03125030893', '8863498-1', 'Gujar Khan', 'Gujar Khan', NULL, 'filer', NULL, NULL, NULL, 1, '2022-09-13 09:16:43', '2022-09-13 09:16:43'),
(373, 1, NULL, 'Rizwan Mughal(Daraz)', NULL, NULL, '03347263775', NULL, 'Sialkot', 'Sialkot', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-13 10:14:09', '2022-09-13 10:14:09'),
(374, 1, NULL, 'Arslan Ijaz(Daraz)', NULL, NULL, '03059489539', NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-13 10:16:30', '2022-09-13 10:16:30'),
(375, 1, NULL, 'Saha Coporation Rawalpindi Office-No-1(Ali)', NULL, NULL, '03313177731', NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-16 16:05:27', '2022-09-16 16:05:27'),
(376, 1, NULL, 'Saha Corporation Rawalpindi Office-No-1(Ali)', NULL, NULL, '03313177731', NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-16 16:08:45', '2022-09-16 16:08:45'),
(377, 1, NULL, 'Syed Waqar Haider', NULL, NULL, '03143704545', NULL, 'Hijra Shah Muqeem', 'Hijra Shah Muqeem', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-17 11:17:54', '2022-09-17 11:17:54'),
(378, 1, NULL, 'FKS(camran )', NULL, NULL, NULL, NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-21 13:52:41', '2022-09-21 13:52:41'),
(379, 1, NULL, 'AP Traders(CSD)', NULL, NULL, '03143882799', NULL, 'Saray Alamgir', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-09-28 09:20:21', '2022-09-28 09:20:21'),
(380, 1, NULL, 'Muneeb Raza(Daraz)', NULL, NULL, '03313337337', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-03 13:22:27', '2022-10-03 13:22:27'),
(381, 1, NULL, 'Hilal Zaman(Daraz)', NULL, NULL, '03149246531', NULL, 'Khybar Pakhtunkhwa', 'Swabi', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-04 12:35:28', '2022-10-04 12:35:28'),
(382, 1, NULL, 'Syed Jibran Khalil(Daraz)', NULL, NULL, '03345532447', NULL, 'Rawalpindi', 'Rawalpindi', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-04 12:36:59', '2022-10-04 12:36:59'),
(383, 1, NULL, 'Muhammad Taha', NULL, NULL, '03062952772', NULL, 'Karachi', 'Karachi', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-11 09:37:19', '2022-10-11 09:37:19'),
(384, 1, NULL, 'Camran Cidique(Marketing)', NULL, NULL, NULL, NULL, 'islamabad', 'islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-12 10:37:11', '2022-10-12 10:37:11'),
(385, 1, NULL, 'Imran (Hair Salon)', NULL, NULL, NULL, NULL, 'Kala Gujra', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-14 17:23:07', '2022-10-14 17:23:07'),
(386, 1, NULL, 'Isteqlal Aziz(Daraz)', NULL, NULL, '03077233390', NULL, 'Khybar Pakhtunkhwa', 'Peshawar', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-19 09:17:34', '2022-10-19 09:17:34'),
(387, 1, NULL, 'Hassan(Daraz)', NULL, NULL, '03238481214', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-19 09:30:21', '2022-10-19 09:30:21'),
(388, 1, NULL, '(Gulf Salons)', NULL, NULL, '03215408865', NULL, 'M M 3', 'Jhelum', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-20 13:13:47', '2022-10-20 13:13:47'),
(389, 1, NULL, 'Damage - Lost', NULL, NULL, '03459512786', NULL, 'Dhunni', 'Kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-21 13:10:12', '2022-10-21 13:10:12'),
(390, 1, NULL, 'Muhammad Abdullah (Daraz)', NULL, NULL, '03334389560', NULL, 'Lahore', 'Lahore', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-26 11:07:42', '2022-10-26 11:07:42'),
(391, 1, NULL, 'Zulfiqar Ali Wagan', NULL, NULL, '03133384742', NULL, 'Tando Jam', 'Hyderabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-27 15:07:36', '2022-10-27 15:07:36'),
(392, 1, NULL, 'Sadiq Mustafa', NULL, NULL, '03194568008', NULL, 'Islamabad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-10-31 14:10:02', '2022-10-31 14:10:02'),
(393, 1, NULL, 'Danish Kumar', NULL, NULL, '03451330931', NULL, 'Umarkot', 'Umarkot', NULL, 'none', NULL, NULL, NULL, 1, '2022-11-01 13:02:54', '2022-11-01 13:02:54'),
(394, 1, NULL, 'Nouman Taraders', NULL, NULL, '03246106493', NULL, 'Lahai Bazar Malik Saeed Market Sialkot', 'Sialkot', NULL, 'none', NULL, NULL, NULL, 1, '2022-11-01 16:25:52', '2022-11-01 16:25:52'),
(395, 1, NULL, 'Mama Asghar(FKS)', NULL, NULL, '03009527646', NULL, 'Dhunni', 'kharian', NULL, 'none', NULL, NULL, NULL, 1, '2022-11-05 10:11:08', '2022-11-05 10:11:08'),
(396, 1, NULL, 'Muhammad Babar Ali Daraz', NULL, NULL, '03225268139', NULL, 'Samundari', 'Samundari', NULL, 'none', NULL, NULL, NULL, 1, '2022-11-12 13:02:34', '2022-11-12 13:02:34'),
(397, 1, NULL, 'Muhammad Haris Daraz', NULL, NULL, '03103208837', NULL, 'Hyderabad', 'Hyderabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-11-12 13:04:24', '2022-11-12 13:04:24'),
(398, 1, NULL, 'Shah Corporation Rawalpindi-No-1(Ali)', NULL, NULL, '03313177731', NULL, 'Islamabad', 'Islamabad', NULL, 'none', NULL, NULL, NULL, 1, '2022-12-15 14:39:33', '2022-12-15 14:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Walk-in', '0', 1, '2021-08-28 23:37:00', '2021-09-07 17:08:16'),
(2, 'Distributor', '0', 1, '2021-09-12 22:08:01', '2021-09-30 18:17:48'),
(3, 'Gift', '0', 1, '2021-09-29 16:58:13', '2021-09-29 16:58:13'),
(4, 'Salesperson', '0', 1, '2021-09-29 17:22:41', '2021-09-29 17:22:41'),
(5, 'Staff', '0', 1, '2021-09-30 18:17:09', '2021-09-30 18:17:09'),
(6, 'Sample', '0', 1, '2021-09-30 21:40:04', '2021-10-14 22:09:21'),
(7, 'Staff Gift', '0', 1, '2021-09-30 21:45:46', '2021-09-30 21:45:46'),
(8, 'online', '0', 1, '2021-10-01 22:49:01', '2021-10-01 22:49:01'),
(9, 'Daraz', '0', 1, '2022-01-07 12:49:20', '2022-01-07 12:49:20'),
(10, 'Saraakuch', '0', 1, '2022-01-07 12:49:35', '2022-01-07 12:49:35'),
(11, 'Shop', '0', 1, '2022-01-07 12:50:49', '2022-01-07 12:50:49'),
(12, 'Mart', '0', 1, '2022-01-07 12:51:46', '2022-01-07 12:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `image_thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pizza', NULL, '1683615600.jpg', '1', '2023-02-27 10:45:32', '2023-05-09 13:00:00'),
(2, 'Omlate', NULL, '1683627007.webp', '1', '2023-02-28 09:43:57', '2023-05-09 16:10:07'),
(4, 'Ice Cream', NULL, '1683615745.jpg', '1', '2023-04-16 14:04:35', '2023-05-09 13:02:25'),
(5, 'Shawarma', NULL, '1683615968.webp', '1', '2023-05-05 16:43:41', '2023-05-09 13:06:29'),
(6, 'Shami Burger', NULL, '1683617284.jpg', '1', '2023-05-06 18:13:39', '2023-05-09 13:28:04'),
(7, 'Alo Parata', NULL, '1683887895.jpg', '1', '2023-05-12 05:38:15', '2023-05-12 05:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `dish_images`
--

CREATE TABLE `dish_images` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_images`
--

INSERT INTO `dish_images` (`id`, `dish_id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Image 1', '1677512780.jpg', '2023-02-27 10:46:20', '2023-02-27 10:46:20'),
(2, 1, 'Image 2', '1677512813.jpg', '2023-02-27 10:46:53', '2023-02-27 10:46:53'),
(3, 2, 'Omelet small', '1677595508.png', '2023-02-28 09:45:08', '2023-02-28 09:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `dish_recipes`
--

CREATE TABLE `dish_recipes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `dish_type_id` int UNSIGNED DEFAULT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `base_unit_amount_cooked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_unit_amount_cooked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_recipes`
--

INSERT INTO `dish_recipes` (`id`, `dish_id`, `dish_type_id`, `item_id`, `base_unit_amount_cooked`, `child_unit_amount_cooked`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 28, '.7', '700', '2023-02-27 10:50:19', '2023-02-27 10:50:19'),
(2, 2, 3, 29, '1', '3', '2023-02-28 09:48:29', '2023-02-28 09:48:29'),
(3, 2, 3, 28, '.2', '200', '2023-02-28 09:48:52', '2023-02-28 09:48:52'),
(4, 2, 4, 28, '1', '1000', '2023-02-28 09:49:24', '2023-02-28 09:49:24'),
(5, 1, 2, 29, '2', '6', '2023-03-01 10:11:12', '2023-03-01 10:11:12'),
(6, 1, 1, 29, '0.5', '6', '2023-03-20 06:56:37', '2023-03-20 06:56:37'),
(7, 1, 8, 28, '1', '1000', '2023-05-02 23:12:21', '2023-05-02 23:12:21'),
(8, 1, 8, 29, '1.5', '18', '2023-05-02 23:13:09', '2023-05-02 23:13:09'),
(9, 7, 13, 28, '2', '2000', '2023-05-12 05:38:15', '2023-05-12 05:38:15'),
(10, 7, 13, 29, '2', '24', '2023-05-12 05:38:15', '2023-05-12 05:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `dish_tables`
--

CREATE TABLE `dish_tables` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_tables`
--

INSERT INTO `dish_tables` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Take Away', '2023-03-09 11:27:02', '2023-03-09 11:27:02'),
(2, 'Table 01', '2023-03-09 11:27:02', '2023-03-09 11:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `dish_types`
--

CREATE TABLE `dish_types` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_types`
--

INSERT INTO `dish_types` (`id`, `dish_id`, `type`, `price`, `image`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Small', '10', 'small_pizza.jpg', 'RES-11111', '2023-02-27 10:45:50', '2023-02-27 10:45:50'),
(2, 1, 'Medium', '20', 'large_pizza.jpg', 'RES-22222', '2023-02-27 10:45:59', '2023-02-27 10:45:59'),
(3, 2, 'Small', '10', 'small_omelate.jpg', 'RES-os1111', '2023-02-28 09:44:26', '2023-02-28 09:44:26'),
(4, 2, 'Medium', '20', 'medium_omelate.jpg', 'RES-om1111', '2023-02-28 09:44:34', '2023-02-28 09:44:34'),
(5, 2, 'Large', '30', 'large_omelate.jpg', 'RES-ol1111', '2023-02-28 09:44:41', '2023-02-28 09:44:41'),
(7, 4, '1/3', '1000', '1683615916.jpg', 'RES-34', '2023-04-16 14:04:55', '2023-05-09 13:05:16'),
(8, 1, 'Large', '30', '1683615624.jpg', 'RES-65438', '2023-05-02 23:11:38', '2023-05-09 13:00:24'),
(12, 6, '1/3', '250', '1683617454.jpg', 'RES-12345', '2023-05-09 13:30:54', '2023-05-09 13:30:54'),
(10, 5, '1', '120', '1683617185.jpg', 'RES-123456', '2023-05-09 13:26:25', '2023-05-09 13:26:25'),
(11, 6, '1/5', '3000', '1683617406.jpg', 'RES-4567854', '2023-05-09 13:30:06', '2023-05-09 13:30:06'),
(13, 7, 'Alo Parata', '400', '1683887895.jpg', 'RES-40109222', '2023-05-12 05:38:15', '2023-05-12 05:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `estimate_detail`
--

CREATE TABLE `estimate_detail` (
  `EstimateDetailID` int NOT NULL,
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
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
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
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
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_detail`
--

CREATE TABLE `expense_detail` (
  `ExpenseDetailID` int NOT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
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
  `ExpenseMasterID` int NOT NULL,
  `ExpenseNo` varchar(55) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
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
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `dish_type_id` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(10,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(50,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`InvoiceDetailID`, `InvoiceMasterID`, `dish_id`, `dish_type_id`, `InvoiceNo`, `ItemID`, `Description`, `SupplierID`, `PartyID`, `Qty`, `Rate`, `TaxPer`, `Tax`, `Discount`, `DiscountType`, `DiscountAmountItem`, `Gross`, `Total`) VALUES
(1, 1, 1, 1, 'POS-00001', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 1, 'POS-00001', 29, 'Egg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 1, 1, 'POS-00002', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, 1, 'POS-00002', 29, 'Egg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 4, 1, 8, 'POS-00004', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 4, 1, 8, 'POS-00004', 29, 'Egg', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 6, NULL, NULL, 'POS-00005', 25, '16mm Silver', NULL, 1, 1, 36.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 36.00),
(10, 7, 1, 1, 'POS-00006', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 7, 1, 1, 'POS-00006', 29, 'Egg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 7, 1, 2, 'POS-00006', 29, 'Egg', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 7, 1, 8, 'POS-00006', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 7, 1, 8, 'POS-00006', 29, 'Egg', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 8, 1, 2, 'POS-00007', 29, 'Egg', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 8, 1, 1, 'POS-00007', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 8, 1, 1, 'POS-00007', 29, 'Egg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 9, 1, 1, 'POS-00008', 28, 'Chicken', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 9, 1, 1, 'POS-00008', 29, 'Egg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 5, NULL, NULL, 'BILL-00001', 25, NULL, NULL, NULL, 100, 42.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 4200.00),
(22, 5, NULL, NULL, 'BILL-00001', 23, NULL, NULL, NULL, 200, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 1100000.00),
(23, 10, NULL, NULL, 'BILL-00002', 22, NULL, 1002, NULL, 200, 80.00, 5.00, 800.00, NULL, NULL, NULL, NULL, 16800.00),
(24, 10, NULL, NULL, 'BILL-00002', 22, NULL, 1002, NULL, 200, 80.00, 5.00, 800.00, NULL, NULL, NULL, NULL, 16800.00),
(25, 11, NULL, NULL, 'BILL-00003', 22, NULL, 1002, NULL, 500, 80.00, 5.00, 2000.00, NULL, NULL, NULL, NULL, 42000.00),
(26, 11, NULL, NULL, 'BILL-00003', 25, NULL, 1002, NULL, 500, 42.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 21000.00),
(27, 12, NULL, NULL, 'POS-00009', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(28, 13, NULL, NULL, 'POS-000010', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(29, 13, NULL, NULL, 'POS-000010', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(30, 14, NULL, NULL, 'POS-000011', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(31, 15, NULL, NULL, 'POS-000012', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(32, 15, NULL, NULL, 'POS-000012', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(33, 16, NULL, NULL, 'POS-000013', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(34, 16, NULL, NULL, 'POS-000013', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(35, 17, NULL, NULL, 'POS-000014', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(36, 17, NULL, NULL, 'POS-000014', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(37, 18, NULL, NULL, 'POS-000015', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(38, 19, NULL, NULL, 'POS-000016', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(39, 19, NULL, NULL, 'POS-000016', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(40, 20, NULL, NULL, 'POS-000017', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(41, 20, NULL, NULL, 'POS-000017', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00),
(42, 21, NULL, NULL, 'Wout-00001', 25, 'Camera', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 22, NULL, NULL, 'Win-00001', 25, 'Camera', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 23, NULL, NULL, 'POS-000018', 23, 'Key Board', NULL, 1, 1, 5500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5500.00),
(45, 23, NULL, NULL, 'POS-000018', 22, 'Mouse', NULL, 1, 2, 100.00, 5.00, 10.00, NULL, NULL, NULL, NULL, 210.00),
(46, 24, NULL, NULL, 'POS-000019', 25, 'Camera', NULL, 1, 4, 36.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 144.00),
(47, 25, NULL, NULL, 'BILL-00004', 32, NULL, 1002, NULL, 10, 80.00, 5.00, 40.00, NULL, NULL, NULL, NULL, 840.00),
(48, 26, NULL, NULL, 'POS-000020', 22, 'Mouse', NULL, 1, 2, 100.00, 5.00, 10.00, NULL, NULL, NULL, NULL, 210.00),
(49, 27, NULL, NULL, 'POS-000021', 22, 'Mouse', NULL, 1, 1, 100.00, 5.00, 5.00, NULL, NULL, NULL, NULL, 105.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail_ssss`
--

CREATE TABLE `invoice_detail_ssss` (
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `JobType` varchar(99) DEFAULT '',
  `Mode` varchar(255) DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `BL_AWB` varchar(255) DEFAULT '',
  `FCL_LCL` varchar(75) DEFAULT NULL,
  `ETA` date DEFAULT NULL,
  `DeliveryPerson` varchar(75) DEFAULT NULL,
  `Status` varchar(75) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `GrossAmount` double(12,2) DEFAULT NULL,
  `VATRate` double(12,2) DEFAULT NULL,
  `VATAmount` double(12,2) DEFAULT NULL,
  `AmountAfterVAT` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_dish_details`
--

CREATE TABLE `invoice_dish_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_master_id` int UNSIGNED DEFAULT NULL,
  `dish_id` int UNSIGNED DEFAULT NULL,
  `dish_type_id` int DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_dish_details`
--

INSERT INTO `invoice_dish_details` (`id`, `invoice_master_id`, `dish_id`, `dish_type_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5, '1', '30', '2023-05-02 23:14:32', '2023-05-02 23:14:32'),
(2, 1, 1, 1, '2', '10', '2023-05-02 23:14:33', '2023-05-02 23:14:33'),
(3, 2, 1, 1, '1', '10', '2023-05-04 17:53:52', '2023-05-04 17:53:52'),
(4, 3, 2, 5, '1', '30', '2023-05-05 16:41:51', '2023-05-05 16:41:51'),
(5, 4, 1, 8, '12', '30', '2023-05-05 16:53:08', '2023-05-05 16:53:08'),
(6, 7, 1, 1, '1', '10', '2023-05-07 11:11:28', '2023-05-07 11:11:28'),
(7, 7, 1, 2, '1', '20', '2023-05-07 11:11:28', '2023-05-07 11:11:28'),
(8, 7, 1, 8, '1', '30', '2023-05-07 11:11:28', '2023-05-07 11:11:28'),
(9, 7, 6, 9, '1', '20', '2023-05-07 11:11:28', '2023-05-07 11:11:28'),
(10, 8, 1, 2, '1', '20', '2023-05-07 11:11:58', '2023-05-07 11:11:58'),
(11, 8, 1, 1, '1', '10', '2023-05-07 11:11:58', '2023-05-07 11:11:58'),
(12, 9, 1, 1, '1', '10', '2023-05-08 16:49:35', '2023-05-08 16:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE `invoice_master` (
  `InvoiceMasterID` int NOT NULL,
  `WarehouseID` int DEFAULT NULL,
  `otherWareHouseID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `DishTableID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `TaxType` varchar(55) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(10,2) DEFAULT NULL,
  `DiscountModel` enum('number','percentage') NOT NULL DEFAULT 'percentage',
  `DiscountPer` double(10,2) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL,
  `TotalQty` double DEFAULT NULL,
  `DiscountAmount` double(10,2) DEFAULT NULL,
  `TaxPer` double(10,2) DEFAULT NULL,
  `Tax` double(10,2) DEFAULT NULL,
  `Shipping` double(10,2) DEFAULT NULL,
  `GrandTotal` double(10,2) DEFAULT NULL,
  `Paid` double(10,2) DEFAULT NULL,
  `Balance` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_master`
--

INSERT INTO `invoice_master` (`InvoiceMasterID`, `WarehouseID`, `otherWareHouseID`, `InvoiceNo`, `InvoiceType`, `Date`, `DueDate`, `PartyID`, `DishTableID`, `WalkinCustomerName`, `SupplierID`, `ReferenceNo`, `UserID`, `PaymentMode`, `PaymentDetails`, `Subject`, `TaxType`, `DescriptionNotes`, `CustomerNotes`, `SubTotal`, `DiscountModel`, `DiscountPer`, `Total`, `TotalQty`, `DiscountAmount`, `TaxPer`, `Tax`, `Shipping`, `GrandTotal`, `Paid`, `Balance`) VALUES
(1, 2, NULL, 'POS-00001', NULL, '2023-05-02', '2023-05-02', 1, NULL, 'Walkin Customer', NULL, '051432', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 50.00, 'percentage', 25.00, 20.75, 3, 50.00, 17.00, 4.25, NULL, 25.00, 25.00, 0.00),
(2, 2, NULL, 'POS-00002', NULL, '2023-05-04', '2023-05-04', 1, NULL, 'Walkin Customer', NULL, '115352', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 10.00, 'percentage', 0.00, 8.30, 1, NULL, 17.00, 1.70, NULL, 10.00, 10.00, 0.00),
(3, 2, NULL, 'POS-00003', NULL, '2023-05-05', '2023-05-05', 1, NULL, 'Walkin Customer', NULL, '104151', 14, 'Credit Card', NULL, NULL, NULL, NULL, NULL, 30.00, 'percentage', 0.00, 24.90, 1, NULL, 17.00, 5.10, NULL, 30.00, 30.00, 70.00),
(4, 2, NULL, 'POS-00004', NULL, '2023-05-05', '2023-05-05', 1, NULL, 'Walkin Customer', NULL, '105308', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 360.00, 'percentage', 0.00, 298.80, 12, NULL, 17.00, 61.20, NULL, 360.00, 360.00, 640.00),
(5, 2, NULL, 'BILL-00001', NULL, '2023-05-05', '2023-05-05', NULL, NULL, '0', 1002, '44141', 1, 'Cash', NULL, 'fghf', NULL, NULL, 'Thanks for your business.', 1104200.00, 'percentage', 0.00, 1104200.00, NULL, 0.00, 0.00, 0.00, 0.00, 1104200.00, 0.00, NULL),
(6, 2, NULL, 'POS-00005', NULL, '2023-05-06', '2023-05-06', 1, 1, 'Walkin Customer', NULL, '120439', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 36.00, 'percentage', 1.80, 28.39, 1, 5.00, 17.00, 5.81, 10.00, 44.20, 44.20, 0.00),
(7, 2, NULL, 'POS-00006', NULL, '2023-05-07', '2023-05-07', 1, 2, 'Walkin Customer', NULL, '051128', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 80.00, 'number', 3.40, 76.60, 4, 3.40, 17.00, 13.02, NULL, 89.62, 89.62, 0.00),
(8, 2, NULL, 'POS-00007', NULL, '2023-05-07', '2023-05-07', 1, NULL, 'Walkin Customer', NULL, '051158', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 30.00, 'percentage', 0.00, 24.90, 2, NULL, 17.00, 5.10, NULL, 30.00, 30.00, 0.00),
(9, 2, NULL, 'POS-00008', NULL, '2023-05-08', '2023-05-08', 1, NULL, 'Walkin Customer', NULL, '104935', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 10.00, 'percentage', 0.00, 8.30, 1, NULL, 17.00, 1.70, NULL, 10.00, 10.00, 0.00),
(10, 1, NULL, 'BILL-00002', NULL, '2023-05-12', '2023-05-12', NULL, NULL, '0', 1002, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, 'Thanks for your business.', 33600.00, 'percentage', 0.00, 33600.00, NULL, 0.00, 0.00, 1600.00, 0.00, 33600.00, 0.00, NULL),
(11, 2, NULL, 'BILL-00003', NULL, '2023-05-15', '2023-05-15', NULL, NULL, '0', 1002, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, 'Thanks for your business.', 63000.00, 'percentage', 0.00, 63000.00, NULL, 0.00, 0.00, 2000.00, 0.00, 63000.00, 0.00, NULL),
(12, 2, NULL, 'POS-00009', NULL, '2023-05-15', '2023-05-15', 1, NULL, 'Walkin Customer', NULL, '031940', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 105.00, 'percentage', 0.00, 87.15, 1, NULL, 17.00, 17.85, NULL, 105.00, 105.00, 0.00),
(13, 2, NULL, 'POS-000010', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '053619', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'percentage', 0.00, 4652.15, 2, NULL, 17.00, 952.85, NULL, 5605.00, 5605.00, 0.00),
(14, 2, NULL, 'POS-000011', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '065710', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 105.00, 'percentage', 0.00, 87.15, 1, NULL, 17.00, 17.85, NULL, 105.00, 105.00, 395.00),
(15, 2, NULL, 'POS-000012', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '072259', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'percentage', 0.00, 4652.15, 2, NULL, 17.00, 952.85, NULL, 5605.00, 5605.00, 0.00),
(16, 2, NULL, 'POS-000013', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '080939', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'percentage', 0.00, 4652.15, 2, NULL, 17.00, 952.85, NULL, 5605.00, 5605.00, 0.00),
(17, 2, NULL, 'POS-000014', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '101651', 14, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'percentage', 0.00, 4652.15, 2, NULL, 17.00, 952.85, NULL, 5605.00, 5605.00, 0.00),
(18, 2, NULL, 'POS-000015', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '103846', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 105.00, 'percentage', 0.00, 87.15, 1, NULL, 17.00, 17.85, NULL, 105.00, 105.00, 0.00),
(19, 2, NULL, 'POS-000016', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '104631', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'percentage', 560.50, 4186.93, 2, 10.00, 17.00, 857.57, NULL, 5044.50, 5044.50, 0.00),
(20, 2, NULL, 'POS-000017', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '104737', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5605.00, 'number', 1000.00, 3822.15, 2, 1000.00, 17.00, 782.85, NULL, 4605.00, 4605.00, 0.00),
(21, 2, 3, 'Wout-00001', NULL, '2023-05-16', '2023-05-16', NULL, NULL, NULL, NULL, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, NULL, NULL, 'percentage', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 3, 2, 'Win-00001', NULL, '2023-05-16', '2023-05-16', NULL, NULL, NULL, NULL, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, NULL, NULL, 'percentage', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 2, NULL, 'POS-000018', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '124231', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 5710.00, 'percentage', 0.00, 4739.30, 3, NULL, 17.00, 970.70, NULL, 5710.00, 5710.00, 0.00),
(24, 2, NULL, 'POS-000019', NULL, '2023-05-16', '2023-05-16', 1, NULL, 'Walkin Customer', NULL, '013605', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 144.00, 'percentage', 0.00, 119.52, 4, NULL, 17.00, 24.48, NULL, 144.00, 144.00, 0.00),
(25, 6, NULL, 'BILL-00004', NULL, '2023-05-16', '2023-05-16', NULL, NULL, '0', 1002, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, 'Thanks for your business.', 840.00, 'percentage', 0.00, 840.00, NULL, 0.00, 0.00, 40.00, 0.00, 840.00, 0.00, NULL),
(26, 2, NULL, 'POS-000020', NULL, '2023-05-19', '2023-05-19', 1, NULL, 'Walkin Customer', NULL, '074711', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 210.00, 'percentage', 0.00, 174.30, 2, NULL, 17.00, 35.70, NULL, 210.00, 210.00, 0.00),
(27, 2, NULL, 'POS-000021', NULL, '2023-05-19', '2023-05-19', 1, NULL, 'Walkin Customer', NULL, '074731', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 105.00, 'percentage', 10.50, 78.44, 1, 10.00, 17.00, 16.07, NULL, 94.50, 94.50, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master_ssss`
--

CREATE TABLE `invoice_master_ssss` (
  `InvoiceMasterID` int NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
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
  `InvoiceTypeID` int NOT NULL,
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
  `ItemID` int NOT NULL,
  `ItemCategoryID` int DEFAULT NULL,
  `BrandID` int DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `UnitID` int UNSIGNED DEFAULT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCode` varchar(255) DEFAULT NULL,
  `ItemImage` varchar(255) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `TaxMethod` int DEFAULT '1',
  `TotalQty` double DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int DEFAULT NULL,
  `SellingDescription` varchar(255) DEFAULT NULL,
  `IsFeatured` tinyint DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemCategoryID`, `BrandID`, `WarehouseID`, `UnitID`, `ItemType`, `ItemCode`, `ItemImage`, `ItemName`, `UnitName`, `Taxable`, `TaxMethod`, `TotalQty`, `Percentage`, `CostPrice`, `CostChartofAccountID`, `CostDescription`, `SellingPrice`, `SellingChartofAccountID`, `SellingDescription`, `IsFeatured`, `IsActive`) VALUES
(22, 1, 5, 1, 4, 'Goods', 'RES-4567890', '1683625451.jpg', 'Mouse', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 100.00, 110000, NULL, 1, 1),
(23, 1, 5, 1, 4, 'Goods', '23', '1683625478.jpg', 'Key Board', NULL, 'No', 1, NULL, NULL, 5000.00, 110000, NULL, 5500.00, 110000, NULL, 1, 1),
(24, 1, 5, 1, 4, 'Goods', '24', '1683625548.jpg', 'Monitor', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 1, 1),
(25, 1, 5, 1, 4, 'Goods', '25', '1683625627.jpg', 'Camera', NULL, 'No', 1, NULL, NULL, 42.00, 110000, NULL, 36.00, 110000, NULL, 1, 1),
(26, 1, 5, 1, 1, 'Goods', '26', '1683625658.jpg', 'Hands Free', NULL, 'No', 1, NULL, NULL, 42.00, 110000, NULL, 36.00, 110000, NULL, 1, 1),
(28, NULL, NULL, NULL, 1, 'Restaurant', '789865445', '1683625774.webp', 'Chicken', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 0),
(29, NULL, NULL, NULL, 3, 'Restaurant', NULL, '1683625836.webp', 'Egg', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 0),
(31, NULL, 6, NULL, 1, 'Goods', '234', '1683626044.jpg', 'Dirham Perfume', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 1),
(32, 1, 5, NULL, 1, 'Goods', '4325', '1683626127.jpg', 'Mobile', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 1),
(33, 2, 6, NULL, 4, 'Goods', '24541', '1683626192.jpg', 'Maagi', NULL, 'Yes', 1, NULL, 5.00, 80900.00, 110000, NULL, 804677.00, 110000, NULL, 0, 1),
(34, 4, 6, NULL, 4, 'Goods', '1239876', '1683627674.jpg', 'Office Equipments', NULL, 'Yes', 1, NULL, NULL, 8054.00, 110000, NULL, 8054.00, 110000, NULL, 0, 1),
(35, 5, 6, NULL, 4, 'Goods', '12359734', '1683627744.jpg', 'sfghsd', NULL, 'Yes', 1, NULL, NULL, 8054.00, 110000, NULL, 9000.00, 110000, NULL, 0, 1),
(36, 1, 5, NULL, 1, 'Goods', '120937019283', '1683627252.jpg', 'Paper cutting machine', NULL, 'Yes', 1, NULL, 10000.00, 80.00, 110000, NULL, 90.00, 110000, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `ItemCategoryID` int NOT NULL,
  `ParentID` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ItemCategoryID`, `ParentID`, `title`, `image`, `type`, `IsActive`) VALUES
(1, NULL, 'Electronics', '1683618238.jpg', 'POS', 1),
(2, NULL, 'Food Items', '1683617833.png', 'POS', 1),
(4, NULL, 'Office Accessories', '1683617978.jpg', 'POS', 1),
(5, 1, 'Mobiles', '1683617777.jpg', 'POS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item__`
--

CREATE TABLE `item__` (
  `ItemID` int NOT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCode` varchar(5) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int DEFAULT NULL,
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
  `JournalID` int NOT NULL,
  `VHNO` varchar(15) DEFAULT NULL,
  `JournalType` varchar(10) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `PettyMstID` int DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Dr` double(10,2) DEFAULT NULL,
  `Cr` double(10,2) DEFAULT NULL,
  `Trace` decimal(10,0) DEFAULT NULL,
  `BankReconcile` varchar(15) DEFAULT NULL,
  `ReconcileDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`JournalID`, `VHNO`, `JournalType`, `ChartOfAccountID`, `PartyID`, `SupplierID`, `VoucherMstID`, `PettyMstID`, `InvoiceMasterID`, `ExpenseMasterID`, `PaymentMasterID`, `PurchasePaymentMasterID`, `Narration`, `Date`, `Dr`, `Cr`, `Trace`, `BankReconcile`, `ReconcileDate`) VALUES
(7, 'TAX-00003', NULL, 110400, 1023, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'test', '2023-02-02', 5875.00, NULL, '123', NULL, NULL),
(8, 'TAX-00003', NULL, 410100, 1023, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'test', '2023-02-02', NULL, 5600.00, '12345', NULL, NULL),
(9, 'TAX-00003', NULL, 210300, 1023, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'test', '2023-02-02', NULL, 275.00, '12346', NULL, NULL),
(10, 'BILL-00001', NULL, 510102, NULL, 1002, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-02-12', 533400.00, NULL, '111', NULL, NULL),
(11, 'BILL-00001', NULL, 210100, NULL, 1002, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-02-12', NULL, 533400.00, '11114', NULL, NULL),
(12, 'BILL-00001', NULL, 510102, NULL, 1002, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-02-14', 550410.00, NULL, '111', NULL, NULL),
(13, 'BILL-00001', NULL, 210100, NULL, 1002, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-02-14', NULL, 550410.00, '11114', NULL, NULL),
(14, 'TAX-00001', NULL, 110400, 1002, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-15', 525.00, NULL, '123', NULL, NULL),
(15, 'TAX-00001', NULL, 410100, 1002, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-15', NULL, 500.00, '12345', NULL, NULL),
(16, 'TAX-00001', NULL, 210300, 1002, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-15', NULL, 25.00, '12346', NULL, NULL),
(17, 'TAX-00002', NULL, 110400, 1002, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2023-02-15', 1050.00, NULL, '123', NULL, NULL),
(18, 'TAX-00002', NULL, 410100, 1002, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2023-02-15', NULL, 1000.00, '12345', NULL, NULL),
(19, 'TAX-00002', NULL, 210300, 1002, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2023-02-15', NULL, 50.00, '12346', NULL, NULL),
(20, 'PC23050001', 'PC', 110100, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'abc (CASH ACCOUNT) ', '2023-05-05', NULL, 1550.00, NULL, NULL, NULL),
(21, 'PC23050001', 'PC', 110100, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'abc', '2023-05-05', 1550.00, NULL, NULL, NULL, NULL),
(22, 'JV23050001', 'JV', 510104, 1, NULL, 7, NULL, NULL, NULL, NULL, NULL, 'Discount allowed', '2023-05-05', 1265.00, NULL, NULL, NULL, NULL),
(23, 'JV23050001', 'JV', 110400, 1, NULL, 7, NULL, NULL, NULL, NULL, NULL, 'Discount allowed', '2023-05-05', NULL, 1265.00, NULL, NULL, NULL),
(26, 'BILL-00001', NULL, 510102, NULL, 1002, NULL, NULL, 5, NULL, NULL, NULL, 'fghf', '2023-05-05', 1104200.00, NULL, '111', NULL, NULL),
(27, 'BILL-00001', NULL, 210100, NULL, 1002, NULL, NULL, 5, NULL, NULL, NULL, 'fghf', '2023-05-05', NULL, 1104200.00, '11114', NULL, NULL),
(28, 'BILL-00002', NULL, 510102, NULL, 1002, NULL, NULL, 10, NULL, NULL, NULL, NULL, '2023-05-12', 33600.00, NULL, '111', NULL, NULL),
(29, 'BILL-00002', NULL, 210100, NULL, 1002, NULL, NULL, 10, NULL, NULL, NULL, NULL, '2023-05-12', NULL, 33600.00, '11114', NULL, NULL),
(30, 'BILL-00003', NULL, 510102, NULL, 1002, NULL, NULL, 11, NULL, NULL, NULL, NULL, '2023-05-15', 63000.00, NULL, '111', NULL, NULL),
(31, 'BILL-00003', NULL, 210100, NULL, 1002, NULL, NULL, 11, NULL, NULL, NULL, NULL, '2023-05-15', NULL, 63000.00, '11114', NULL, NULL),
(32, 'BILL-00004', NULL, 510102, NULL, 1002, NULL, NULL, 25, NULL, NULL, NULL, NULL, '2023-05-16', 840.00, NULL, '111', NULL, NULL),
(33, 'BILL-00004', NULL, 210100, NULL, 1002, NULL, NULL, 25, NULL, NULL, NULL, NULL, '2023-05-16', NULL, 840.00, '11114', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_10_10_143303_create_attendances_table', 1),
(2, '2023_02_25_095423_create_units_table', 2),
(3, '2023_02_25_110407_create_dishes_table', 3),
(4, '2023_02_27_101155_add_unit_id_to_item', 4),
(5, '2023_02_26_110251_create_dish_recipes_table', 5),
(6, '2023_02_26_105746_create_dish_types_table', 6),
(7, '2023_02_25_110937_create_dish_images_table', 7),
(8, '2023_03_02_103212_create_invoice_dish_details_table', 8),
(9, '2023_03_02_103916_add_type_to_item_category', 9),
(10, '2023_03_08_162122_add_dish_type_id_to_invoice_dish_detail', 10),
(11, '2023_03_08_162200_add_cols_to_invoice_detail', 11),
(12, '2023_03_09_091758_create_dish_tables_table', 12),
(13, '2023_03_09_091933_add_dish_table_id_to_invoice_master', 13),
(14, '2023_03_14_172529_add_quantity_to_invoice_dish_details', 14),
(15, '2023_03_21_073307_add_price_to_invoice_dish_details', 15),
(16, '2023_05_10_093958_add_supplier_id_to_pos_setting', 16),
(17, '2023_05_19_112007_add_is_super_admin_to_user', 17);

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `PartyID` int NOT NULL,
  `CustomerGroupID` int DEFAULT NULL,
  `PartyName` text,
  `TRN` varchar(150) DEFAULT '',
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(175) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Deposit` double DEFAULT NULL,
  `Expense` double DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`PartyID`, `CustomerGroupID`, `PartyName`, `TRN`, `Address`, `City`, `Mobile`, `Phone`, `Email`, `Website`, `Deposit`, `Expense`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, NULL, 'Walkin Customer', '1234', '000000', NULL, '0000', '00000', '00000', '0000', NULL, NULL, 'Yes', 0, '2022-07-08 04:12:14'),
(1002, NULL, 'kashif mushtaq', '6789', 'Kashif House, Khyber colony No 1, Tehkal Payan', 'Peshawar', '+923349047993', '+923349047993', 'kashif@inu.edu.pk', 'teqholic.com', NULL, NULL, 'No', 5, '2022-01-16 17:59:43'),
(1012, NULL, 'SAJID SB PAK', '1256', 'Kashif House, Khyber colony No 1, Tehkal Payan', NULL, NULL, '+923349047993', 'kashif@inu.edu.pk', NULL, NULL, NULL, 'Yes', 90, '2022-01-16 17:59:49'),
(1023, NULL, 'LIGHT SPEED', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:58'),
(1044, NULL, 'MALIK MAQSOOD AGENT', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:20'),
(1053, NULL, 'SADAF TRAVELS', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:46'),
(1576, NULL, 'COZMO  TRAVEL', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:23'),
(1680, NULL, 'KSA', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:58:55'),
(1700, NULL, 'MESSZAN TRV', '1256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 17:59:34'),
(2213, NULL, 'Kamal Mehmood', '1256', 'Kashif House, Khyber colony No 1, Tehkal Payan', NULL, NULL, '+923349047993', 'kashif@inu.edu.pk', NULL, NULL, NULL, 'Yes', NULL, '2022-03-06 04:14:26'),
(2214, NULL, 'xyz', '0232165', 'fplekfpok', 'abc', '062644', '155999', NULL, NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:37:13'),
(2215, 1, 'Farhan Ahmad', '', 'Al badda Masjid Satwa Dubai', NULL, '0521359799', '0521359799', 'farhanaqil474@gmail.com', NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:37:43'),
(2216, NULL, '21345768965342', '4567865', '456785', '76588458', '567588', 'uytfghiugy', 'abc@xyz.com', 'nhlkjhlkj', NULL, NULL, 'Yes', 5, '2023-05-05 10:38:10'),
(2217, NULL, 'yuilygfhkj', '6579865568', '987965890876', '78965790658', '789657970868', '7igyihgjhkgjcjg', 'jhgfkjhgfjg', 'khgfuhgjhfgk', NULL, NULL, 'Yes', 6, '2023-05-05 10:38:47'),
(2218, NULL, '849798hfrfrhnvj', '328744444444444444444444444444444', NULL, '7897879', 'gvfgevf', 'vfvd dv', 'efrefcdsec', 'edfcsdcds', NULL, NULL, 'Yes', 100, '2023-05-06 11:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` bigint UNSIGNED NOT NULL,
  `PaymentReference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceMasterID` int NOT NULL,
  `PartyID` int NOT NULL DEFAULT '0',
  `UserID` int NOT NULL,
  `Amount` double(8,2) NOT NULL,
  `Change` double(8,2) NOT NULL,
  `PayingMethod` enum('Cash','Gift Card','Credit Card','Cheque','Paypal','Deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `PaymentNote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `PaymentReference`, `InvoiceMasterID`, `PartyID`, `UserID`, `Amount`, `Change`, `PayingMethod`, `PaymentNote`, `created_at`, `updated_at`) VALUES
(1, 'spr-20230131-053714', 2, 1, 1, 315.00, 0.00, 'Cash', NULL, '2023-01-31 00:37:14', '2023-01-31 00:37:14'),
(2, 'spr-20230131-054921', 3, 1, 1, 420.00, 0.00, 'Cash', NULL, '2023-01-31 00:49:21', '2023-01-31 00:49:21'),
(3, 'spr-20230131-012434', 4, 1, 1, 420.00, 0.00, 'Cash', NULL, '2023-01-31 08:24:34', '2023-01-31 08:24:34'),
(4, 'spr-20230131-021458', 5, 1, 1, 525.00, 0.00, 'Cash', NULL, '2023-01-31 09:14:58', '2023-01-31 09:14:58'),
(5, 'spr-20230131-021559', 6, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-01-31 09:15:59', '2023-01-31 09:15:59'),
(6, 'spr-20230131-021645', 7, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-01-31 09:16:45', '2023-01-31 09:16:45'),
(7, 'spr-20230131-031429', 8, 1, 1, 5580.00, 0.00, 'Cash', NULL, '2023-01-31 10:14:29', '2023-01-31 10:14:29'),
(8, 'spr-20230131-031718', 9, 1, 1, 5500.00, 0.00, 'Cash', NULL, '2023-01-31 10:17:18', '2023-01-31 10:17:18'),
(9, 'spr-20230202-050732', 10, 1, 1, 180.00, 0.00, 'Cash', NULL, '2023-02-02 00:07:32', '2023-02-02 00:07:32'),
(10, 'spr-20230202-051034', 11, 1, 1, 80.00, 0.00, 'Cash', NULL, '2023-02-02 00:10:34', '2023-02-02 00:10:34'),
(11, 'spr-20230202-022011', 13, 1, 1, 90.00, 0.00, 'Cash', NULL, '2023-02-02 09:20:11', '2023-02-02 09:20:11'),
(12, 'spr-20230202-022119', 14, 1, 1, 5500.00, 0.00, 'Cash', NULL, '2023-02-02 09:21:19', '2023-02-02 09:21:19'),
(13, 'spr-20230202-022451', 15, 1, 1, 162.00, 0.00, 'Cash', NULL, '2023-02-02 09:24:51', '2023-02-02 09:24:51'),
(14, 'spr-20230205-031906', 16, 1, 1, 94.50, 0.00, 'Cash', NULL, '2023-02-05 10:19:06', '2023-02-05 10:19:06'),
(15, 'spr-20230209-061130', 17, 1, 1, 11000.00, 0.00, 'Cash', NULL, '2023-02-09 01:11:30', '2023-02-09 01:11:30'),
(16, 'spr-20230210-114445', 1, 1, 1, 5580.00, 0.00, 'Cash', NULL, '2023-02-10 06:44:45', '2023-02-10 06:44:45'),
(17, 'spr-20230213-051921', 3, 1, 1, 11000.00, 0.00, 'Cash', NULL, '2023-02-13 00:19:21', '2023-02-13 00:19:21'),
(18, 'spr-20230214-113531', 2, 1, 1, 6261.00, 0.00, 'Cash', NULL, '2023-02-14 06:35:31', '2023-02-14 06:35:31'),
(19, 'spr-20230215-030015', 5, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-02-15 10:00:15', '2023-02-15 10:00:15'),
(20, 'spr-20230411-070516', 9, 1, 1, 5721.00, 309.00, 'Cash', NULL, '2023-04-11 13:05:16', '2023-04-11 13:05:16'),
(21, 'spr-20230411-072154', 10, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-04-11 13:21:54', '2023-04-11 13:21:54'),
(22, 'spr-20230412-100515', 11, 1, 1, 420.00, 580.00, 'Credit Card', NULL, '2023-04-12 16:05:15', '2023-04-12 16:05:15'),
(23, 'spr-20230426-030018', 12, 1, 1, 11105.00, 0.00, 'Cash', NULL, '2023-04-26 21:00:18', '2023-04-26 21:00:18'),
(24, 'spr-20230428-050304', 13, 1, 14, 115.00, 0.00, 'Cash', NULL, '2023-04-28 11:03:04', '2023-04-28 11:03:04'),
(25, 'spr-20230429-053838', 14, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-04-29 11:38:38', '2023-04-29 11:38:38'),
(26, 'spr-20230501-023710', 15, 1, 1, 135.00, 0.00, 'Cash', NULL, '2023-05-01 20:37:10', '2023-05-01 20:37:10'),
(27, 'spr-20230502-051432', 1, 1, 1, 25.00, 0.00, 'Cash', NULL, '2023-05-02 23:14:32', '2023-05-02 23:14:32'),
(28, 'spr-20230504-115352', 2, 1, 1, 10.00, 0.00, 'Cash', NULL, '2023-05-04 17:53:52', '2023-05-04 17:53:52'),
(29, 'spr-20230505-104151', 3, 1, 1, 30.00, 70.00, 'Credit Card', NULL, '2023-05-05 16:41:51', '2023-05-05 16:41:51'),
(30, 'spr-20230505-105308', 4, 1, 14, 360.00, 640.00, 'Cash', NULL, '2023-05-05 16:53:08', '2023-05-05 16:53:08'),
(31, 'spr-20230506-120439', 6, 1, 1, 44.20, 0.00, 'Cash', NULL, '2023-05-06 18:04:39', '2023-05-06 18:04:39'),
(32, 'spr-20230507-051128', 7, 1, 1, 89.62, 0.00, 'Cash', NULL, '2023-05-07 11:11:28', '2023-05-07 11:11:28'),
(33, 'spr-20230507-051158', 8, 1, 1, 30.00, 0.00, 'Cash', NULL, '2023-05-07 11:11:58', '2023-05-07 11:11:58'),
(34, 'spr-20230508-104935', 9, 1, 1, 10.00, 0.00, 'Cash', NULL, '2023-05-08 16:49:35', '2023-05-08 16:49:35'),
(35, 'spr-20230515-031940', 12, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-05-15 10:19:40', '2023-05-15 10:19:40'),
(36, 'spr-20230516-053619', 13, 1, 1, 5605.00, 0.00, 'Cash', NULL, '2023-05-16 00:36:19', '2023-05-16 00:36:19'),
(37, 'spr-20230516-065710', 14, 1, 1, 105.00, 395.00, 'Cash', NULL, '2023-05-16 01:57:10', '2023-05-16 01:57:10'),
(38, 'spr-20230516-072259', 15, 1, 1, 5605.00, 0.00, 'Cash', NULL, '2023-05-16 02:22:59', '2023-05-16 02:22:59'),
(39, 'spr-20230516-080939', 16, 1, 1, 5605.00, 0.00, 'Cash', NULL, '2023-05-16 03:09:39', '2023-05-16 03:09:39'),
(40, 'spr-20230516-101651', 17, 1, 1, 5605.00, 0.00, 'Cash', NULL, '2023-05-16 05:16:51', '2023-05-16 05:16:51'),
(41, 'spr-20230516-103846', 18, 1, 1, 105.00, 0.00, 'Cash', NULL, '2023-05-16 05:38:46', '2023-05-16 05:38:46'),
(42, 'spr-20230516-104631', 19, 1, 1, 5044.50, 0.00, 'Cash', NULL, '2023-05-16 05:46:31', '2023-05-16 05:46:31'),
(43, 'spr-20230516-104737', 20, 1, 1, 4605.00, 0.00, 'Cash', NULL, '2023-05-16 05:47:37', '2023-05-16 05:47:37'),
(44, 'spr-20230516-124231', 23, 1, 1, 5710.00, 0.00, 'Cash', NULL, '2023-05-16 07:42:31', '2023-05-16 07:42:31'),
(45, 'spr-20230516-013605', 24, 1, 1, 144.00, 0.00, 'Cash', NULL, '2023-05-16 08:36:05', '2023-05-16 08:36:05'),
(46, 'spr-20230519-074711', 26, 1, 1, 210.00, 0.00, 'Cash', NULL, '2023-05-19 14:47:11', '2023-05-19 14:47:11'),
(47, 'spr-20230519-074731', 27, 1, 1, 94.50, 0.00, 'Cash', NULL, '2023-05-19 14:47:31', '2023-05-19 14:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `PaymentDetailID` int NOT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE `payment_master` (
  `PaymentMasterID` int NOT NULL,
  `PartyID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
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
  `ID` int NOT NULL,
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
  `PettyDetID` int NOT NULL,
  `PettyMstID` int DEFAULT NULL,
  `PettyVoucher` varchar(12) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Invoice` varchar(35) DEFAULT NULL,
  `RefNo` varchar(35) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `FromChOfAcc` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pettycash_detail`
--

INSERT INTO `pettycash_detail` (`PettyDetID`, `PettyMstID`, `PettyVoucher`, `SupplierID`, `Date`, `ChOfAcc`, `Narration`, `Invoice`, `RefNo`, `Debit`, `FromChOfAcc`) VALUES
(1, 1, 'PC23050001', NULL, '2023-05-05', 110100, 'abc', '598', '9595', 1550.00, 110100);

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
  `PettyMstID` int NOT NULL,
  `PettyVoucher` varchar(11) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pettycash_master`
--

INSERT INTO `pettycash_master` (`PettyMstID`, `PettyVoucher`, `ChOfAcc`, `Date`, `Narration`, `Credit`) VALUES
(1, 'PC23050001', 110100, '2023-05-05', NULL, 1550.00);

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `biller_id` int NOT NULL,
  `product_number` int NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_dish_enabled` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `supplier_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `is_dish_enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 3, 0, 'pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB', 'sk_test_TtQQaawhEYRwa3mU9CzttrEy', 1, '2018-09-02 03:17:04', '2023-01-19 08:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `sale_unit_id` int NOT NULL,
  `cost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint DEFAULT NULL,
  `promotion_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `tax_method` int DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint DEFAULT NULL,
  `product_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `batch_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_batches`
--

INSERT INTO `product_batches` (`id`, `product_id`, `batch_no`, `expired_date`, `qty`, `created_at`, `updated_at`) VALUES
(1, 8, 'ttx01', '2022-12-01', 0, '2021-09-03 23:14:54', '2022-06-28 09:39:06'),
(2, 113, '500', '2022-08-31', 0, '2022-08-22 16:25:13', '2022-08-25 16:15:38'),
(3, 113, '600', '2022-09-10', 0, '2022-08-22 16:26:49', '2022-08-25 16:15:07'),
(4, 113, '13359', '2025-12-10', 0, '2022-11-03 11:47:30', '2022-11-16 17:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `position` int NOT NULL,
  `item_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int UNSIGNED NOT NULL,
  `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(12, '22', NULL, NULL, 2, 100, NULL, '2021-09-06 19:06:08', '2023-02-07 11:31:24'),
(13, '23', NULL, NULL, 2, 32, NULL, '2021-09-06 19:06:08', '2023-02-13 00:19:21'),
(14, '24', NULL, NULL, 2, 58, NULL, '2021-09-06 19:06:08', '2023-02-10 06:44:59'),
(15, '25', NULL, NULL, 2, 14, NULL, '2021-09-06 19:06:08', '2023-01-20 08:11:10'),
(16, '26', NULL, NULL, 2, 25, NULL, '2021-09-06 19:06:08', '2023-01-16 01:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_detail`
--

CREATE TABLE `purchasepayment_detail` (
  `PurchasePaymentDetailID` int NOT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_master`
--

CREATE TABLE `purchasepayment_master` (
  `PurchasePaymentMasterID` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
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
  `PurchaseOrderDetailID` int NOT NULL,
  `PurchaseOrderMasterID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
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

--
-- Dumping data for table `purchase_order_detail`
--

INSERT INTO `purchase_order_detail` (`PurchaseOrderDetailID`, `PurchaseOrderMasterID`, `Date`, `ItemID`, `Description`, `Rate`, `Qty`, `Unit`, `DiscountPer`, `Discount`, `Tax`, `TaxPer`, `Amount`, `Remarks`) VALUES
(1, 1, '2023-02-12', 22, NULL, 100.00, '100', NULL, NULL, NULL, 500.00, 5.00, 10500.00, NULL),
(2, 1, '2023-02-12', 23, NULL, 5500.00, '100', NULL, NULL, NULL, 27500.00, 5.00, 577500.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_master`
--

CREATE TABLE `purchase_order_master` (
  `PurchaseOrderMasterID` int NOT NULL,
  `PON` varchar(10) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `PONotes` varchar(255) DEFAULT NULL,
  `DeliveryNotes` longtext,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_master`
--

INSERT INTO `purchase_order_master` (`PurchaseOrderMasterID`, `PON`, `SupplierID`, `ReferenceNo`, `Date`, `DeliveryDate`, `PONotes`, `DeliveryNotes`, `UserID`, `Subject`, `DiscountPer`, `Discount`, `Tax`, `SubTotal`, `GrandTotal`, `eDate`) VALUES
(1, 'PON-00001', 1002, NULL, '2023-02-12', '2023-02-12', 'Thanks for your business.', NULL, 1, NULL, NULL, NULL, 28000.00, NULL, NULL, '2023-02-12 13:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int NOT NULL,
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
  `id` int NOT NULL,
  `value` int DEFAULT NULL
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
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int UNSIGNED NOT NULL,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `extra_tax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `daraz_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `extra_tax`, `order_tax_rate`, `order_tax`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `daraz_amount`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(22, '025824', 1, 4, 3, 2, 1, 43, 172, 69668.4, 0, 162559.6, 162559.6, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 81000, NULL, NULL, '2021-09-25 19:58:24', '2021-12-08 17:19:08'),
(23, '031941', 1, 4, 2, 2, 2, 39, 138, 35910, 0, 143652, 143652, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 143652, NULL, NULL, '2021-09-25 20:19:41', '2022-12-24 11:17:25'),
(26, '012114', 1, 4, 7, 2, 2, 12, 12, 0, 0, 17338, 17338, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 17338, NULL, NULL, '2021-09-28 18:21:14', '2022-11-18 16:56:45'),
(27, '012602', 1, 4, 8, 2, 2, 10, 12, 0, 0, 15388, 15388, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 15388, NULL, NULL, '2021-09-28 18:26:02', '2022-11-18 17:08:40'),
(28, '051734', 1, 4, 9, 2, 2, 6, 6, 0, 0, 8544, 8544, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 8544, 'Gift Pack', NULL, '2021-09-28 22:17:34', '2022-11-18 17:06:51'),
(31, '111333', 1, 4, 12, 2, 2, 1, 1, 0, 0, 1749, 1948, NULL, 0, 0, 0, NULL, NULL, 199, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-09-29 16:13:33', '2021-09-29 16:26:07'),
(32, '120442', 1, 4, 13, 2, 2, 13, 13, 0, 0, 17987, 17987, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 17987, NULL, NULL, '2021-09-29 17:04:42', '2022-11-18 17:08:55'),
(33, '121217', 1, 4, 167, 2, 2, 14, 18, 0, 0, 25982, 25982, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 25982, NULL, NULL, '2021-09-29 17:12:17', '2022-11-18 17:06:35'),
(34, '121437', 1, 4, 15, 2, 2, 6, 6, 0, 0, 8694, 8694, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 8694, NULL, NULL, '2021-09-29 17:14:37', '2022-11-18 17:08:18'),
(35, '121707', 1, 4, 167, 2, 2, 13, 13, 0, 0, 17887, 17887, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 17887, NULL, NULL, '2021-09-29 17:17:07', '2022-11-18 17:09:12'),
(36, '122127', 1, 4, 16, 2, 2, 13, 13, 0, 0, 18587, 18587, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 18587, NULL, NULL, '2021-09-29 17:21:27', '2022-11-18 17:09:28'),
(37, '122511', 1, 4, 17, 2, 2, 3, 3, 0, 0, 4497, 4497, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-09-29 17:25:11', '2021-09-29 17:25:11'),
(38, '015310', 1, 4, 18, 2, 2, 2, 2, 0, 0, 2748, 2473, NULL, 0, 0, 275, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-09-29 18:53:10', '2021-09-29 18:55:58'),
(39, '055535', 1, 4, 19, 2, 2, 20, 109, 39709.85, 0, 526388.9, 526388.9, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 226000, NULL, NULL, '2021-09-29 22:55:35', '2022-11-26 15:28:59'),
(40, '062537', 1, 4, 11, 2, 2, 43, 172, 69668.4, 0, 162559.6, 162559.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 50000, NULL, NULL, '2021-09-29 23:25:37', '2021-11-10 16:33:33'),
(42, '043727', 1, 4, 21, 2, 2, 14, 14, 0, 0, 18136, 18136, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, 'Umer Hassan to Sh. Awaiz', '2021-09-30 21:37:27', '2021-09-30 21:37:27'),
(43, '044504', 1, 4, 23, 2, 2, 13, 13, 0, 0, 16837, 16837, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-09-30 21:45:04', '2021-09-30 21:45:04'),
(44, '044906', 1, 4, 165, 2, 2, 6, 41, 0, 0, 55009, 55009, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 55009, NULL, NULL, '2021-09-30 21:49:06', '2022-11-18 17:09:46'),
(45, '045313', 1, 4, 25, 2, 2, 7, 7, 0, 0, 9493, 9493, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 9493, NULL, NULL, '2021-09-30 21:53:13', '2022-11-18 17:08:04'),
(46, '045914', 1, 4, 26, 2, 2, 7, 9, 0, 0, 12091, 8464, NULL, 0, 0, 3627, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-09-30 21:59:14', '2021-09-30 21:59:14'),
(47, '050707', 1, 4, 27, 2, 2, 8, 8, 0, 0, 11792, 8255, NULL, 0, 0, 3537, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-09-30 22:07:07', '2021-09-30 22:07:07'),
(48, '051358', 1, 4, 28, 2, 2, 7, 7, 0, 0, 9293, 9293, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, 'Given by Oun Ali Syed', '2021-09-30 22:13:58', '2021-11-15 22:58:59'),
(49, '052852', 1, 4, 29, 2, 2, 3, 3, 0, 0, 3497, 3497, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 'Given by Baber', '2021-09-30 22:28:52', '2021-09-30 22:28:52'),
(50, '053204', 1, 4, 171, 2, 2, 3, 3, 0, 0, 3547, 3547, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 3547, NULL, 'Gift given', '2021-09-30 22:32:04', '2022-11-18 17:06:02'),
(51, '061635', 1, 4, 151, 2, 2, 6, 7, 0, 0, 9043, 9043, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 9043, NULL, NULL, '2021-09-30 23:16:35', '2022-11-18 17:07:07'),
(52, '061907', 1, 4, 17, 2, 2, 1, 5, 1245, 0, 5000, 5000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, 'Delivered by Zahid Sb.', '2021-09-30 23:19:07', '2021-09-30 23:19:07'),
(53, '062333', 1, 4, 31, 2, 2, 3, 5, 0, 0, 6245, 6245, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-09-30 23:23:33', '2021-09-30 23:23:33'),
(54, '105957', 1, 4, 32, 2, 2, 20, 20, 0, 0, 27430, 27430, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 27430, NULL, 'gift by SKF', '2021-10-01 15:59:57', '2022-11-18 17:07:32'),
(56, '035702', 1, 4, 33, 2, 2, 27, 62, 0, 0, 79988, 79988, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 79988, NULL, NULL, '2021-10-01 20:57:02', '2022-11-18 17:07:47'),
(57, '042233', 1, 4, 170, 2, 2, 9, 12, 0, 0, 16738, 16738, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 16738, NULL, NULL, '2021-10-01 21:22:33', '2022-11-18 17:06:19'),
(58, '055341', 1, 4, 35, 2, 2, 2, 2, 0, 0, 3248, 2923.2, NULL, 0, 0, 324.8, NULL, NULL, NULL, NULL, 1, 4, NULL, 2923.2, NULL, NULL, '2021-10-01 22:53:41', '2021-10-01 23:26:58'),
(59, '064448', 1, 4, 7, 2, 2, 43, 43, 0, 0, 58057, 58057, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 58057, NULL, 'Sample given', '2021-10-01 23:44:48', '2022-11-18 17:05:42'),
(60, '103126', 1, 4, 167, 2, 2, 18, 88, 0, 0, 122212, 122212, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 122212, NULL, 'For Home', '2021-10-02 15:31:26', '2022-11-18 17:05:26'),
(61, '103815', 1, 4, 167, 2, 2, 10, 33, 0, 0, 41767, 41767, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 41767, NULL, NULL, '2021-10-02 15:38:15', '2022-11-18 17:05:08'),
(62, '113403', 1, 4, 30, 2, 2, 5, 5, 0, 0, 6395, 6395, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, 'Sample given', '2021-10-02 16:34:03', '2021-10-02 16:34:03'),
(63, '113820', 1, 4, 17, 2, 2, 3, 4, 0, 0, 5746, 4596, NULL, 0, 0, 1150, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-02 16:38:20', '2021-10-02 16:38:20'),
(65, '020259', 1, 4, 37, 2, 2, 37, 388, 153040.8, 0, 34719.24, 34719.24, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 384000, NULL, NULL, '2021-10-02 19:02:59', '2022-11-10 09:59:46'),
(66, '052258', 1, 4, 38, 2, 2, 2, 2, 0, 0, 3248, 2273, NULL, 0, 0, 975, NULL, NULL, NULL, NULL, 1, 4, NULL, 2273, NULL, NULL, '2021-10-02 22:22:58', '2021-10-13 19:42:35'),
(67, '053345', 1, 4, 39, 2, 2, 1, 1, 0, 0, 1249, 1448, NULL, 0, 0, 0, NULL, NULL, 199, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-02 22:33:45', '2021-10-02 22:36:08'),
(69, '015119', 1, 4, 37, 2, 2, 4, 96, 41371.2, 0, 96532.8, 96532.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 96532.8, NULL, NULL, '2021-10-04 18:51:19', '2021-10-14 18:58:45'),
(71, '043258', 1, 4, 17, 2, 2, 4, 4, 1199.2, 0, 4796.8, 4796.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-04 21:32:58', '2021-10-04 21:32:58'),
(73, '050101', 1, 4, 41, 2, 2, 1, 1, 0, 0, 1249, 1249, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1249, NULL, NULL, '2021-10-04 22:01:01', '2021-10-13 19:34:02'),
(74, '052339', 1, 4, 42, 2, 2, 1, 1, 0, 0, 1249, 1249, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1249, NULL, NULL, '2021-10-04 22:23:39', '2021-10-13 19:33:02'),
(75, '052811', 1, 4, 43, 2, 2, 1, 1, 0, 0, 1249, 1249, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1249, NULL, NULL, '2021-10-04 22:28:11', '2021-10-13 19:36:56'),
(76, '015754', 1, 4, 22, 2, 2, 27, 27, 7194.6, 0, 28778.4, 28778.4, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, 'for Door-to-door selling', NULL, '2021-10-05 18:57:54', '2021-10-05 19:24:43'),
(77, '052326', 1, 4, 44, 2, 2, 6, 12, 0, 0, 17488, 17488, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 17488, NULL, NULL, '2021-10-05 22:23:26', '2022-11-18 17:04:51'),
(78, '052749', 1, 4, 44, 2, 2, 8, 8, 0, 0, 11092, 11092, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 11092, NULL, NULL, '2021-10-05 22:27:49', '2022-11-18 17:04:33'),
(79, '053215', 1, 4, 44, 2, 2, 7, 7, 0, 0, 9793, 9793, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 9793, 'Gift', NULL, '2021-10-05 22:32:15', '2022-11-18 17:04:10'),
(80, '101949', 1, 4, 45, 2, 2, 6, 6, 0, 0, 7194, 5036, NULL, 0, 0, 2158, NULL, NULL, NULL, NULL, 1, 4, NULL, 5036, NULL, NULL, '2021-10-06 15:19:49', '2021-10-13 19:43:09'),
(81, '102924', 1, 4, 46, 2, 2, 1, 1, 0, 0, 1249, 875, NULL, 0, 0, 374, NULL, NULL, NULL, NULL, 1, 4, NULL, 875, NULL, NULL, '2021-10-06 15:29:24', '2021-10-13 19:42:06'),
(82, '110747', 1, 4, 2, 2, 2, 16, 72, 0, 0, 97428, 68200, NULL, 0, 0, 29228, NULL, NULL, 0, NULL, 1, 4, NULL, 68200, NULL, 'Delivered by Zahid', '2021-10-06 16:07:47', '2021-11-10 16:17:41'),
(89, '013744', 1, 4, 53, 2, 2, 3, 3, 0, 0, 4497, 4497, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 18:37:44', '2021-10-06 18:57:38'),
(90, '015338', 1, 4, 54, 2, 2, 2, 2, 0, 0, 2498, 1748, NULL, 0, 0, 750, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 18:53:38', '2021-11-24 10:21:04'),
(91, '015516', 1, 4, 55, 2, 2, 1, 1, 0, 0, 1249, 1249, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 18:55:16', '2021-10-06 18:56:52'),
(92, '015943', 1, 4, 56, 2, 2, 4, 6, 0, 0, 7294, 6564, NULL, 0, 0, 730, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 18:59:43', '2021-10-06 23:27:58'),
(93, '032339', 1, 4, 22, 2, 2, 1, 2, 0, 0, 3198, 3198, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 20:23:39', '2021-10-06 20:23:39'),
(94, '035840', 1, 4, 57, 2, 2, 2, 2, 0, 0, 3198, 2550, NULL, 0, 0, 648, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-06 20:58:40', '2021-10-06 20:58:40'),
(95, '035848', 1, 4, 3, 2, 2, 5, 16, 6415.2, 0, 14968.8, 14968.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 14968.8, NULL, NULL, '2021-10-07 20:58:48', '2021-10-13 19:39:56'),
(96, '032937', 1, 4, 60, 2, 2, 1, 1, 175, 0, 1574, 1574, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1574, NULL, NULL, '2021-10-08 20:29:37', '2021-10-13 19:34:43'),
(98, '034943', 1, 4, 61, 2, 2, 1, 1, 0, 0, 999, 1098, NULL, 0, 0, 100, NULL, NULL, 199, NULL, 1, 2, NULL, 900, NULL, NULL, '2021-10-08 20:49:43', '2021-10-13 19:36:00'),
(99, '035756', 1, 4, 62, 2, 2, 1, 1, 0, 0, 799, 918, NULL, 0, 0, 80, NULL, NULL, 199, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-08 20:57:56', '2021-10-08 20:57:56'),
(100, '040430', 1, 4, 63, 2, 2, 1, 1, 0, 0, 799, 918, NULL, 0, 0, 80, NULL, NULL, 199, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-08 21:04:30', '2021-10-08 21:04:30'),
(103, '055141', 1, 4, 65, 2, 2, 1, 1, 30, 0, 1119.3, 1119.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1119.3, NULL, NULL, '2021-10-08 22:51:41', '2021-10-13 19:32:05'),
(104, '055512', 1, 4, 66, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-08 22:55:12', '2021-10-13 19:31:09'),
(106, '112230', 1, 4, 178, 2, 2, 43, 43, 645, 0, 49348.45, 49348.45, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-09 16:22:30', '2021-11-17 17:02:18'),
(107, '113942', 1, 4, 179, 2, 2, 43, 43, 645, 0, 49348.45, 49348.45, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-09 16:39:42', '2022-03-14 10:47:29'),
(109, '034402', 1, 4, 71, 2, 2, 1, 1, 20, 0, 999.2, 999.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999.2, NULL, NULL, '2021-10-09 20:44:02', '2021-10-13 19:29:32'),
(110, '053812', 1, 4, 73, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-09 22:38:12', '2021-10-13 19:28:56'),
(111, '054336', 1, 4, 74, 2, 2, 1, 1, 449, 0, 1300, 1300, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1300, NULL, NULL, '2021-10-09 22:43:36', '2021-10-09 22:43:36'),
(112, '060242', 1, 4, 17, 2, 2, 1, 1, 20, 0, 1199.2, 1199.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-09 23:02:42', '2021-10-13 21:16:29'),
(114, '031229', 1, 4, 79, 2, 2, 1, 1, 10, 0, 899.1, 999.1, NULL, 0, 0, NULL, NULL, NULL, 100, NULL, 1, 4, NULL, 999.1, NULL, NULL, '2021-10-11 20:12:29', '2021-10-13 20:53:02'),
(115, '031720', 1, 4, 75, 2, 2, 1, 1, 10, 0, 1439.1, 1639.1, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-11 20:17:20', '2021-10-11 20:17:20'),
(116, '031927', 1, 4, 76, 2, 2, 1, 1, 0, 0, 799, 799, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-11 20:19:27', '2021-10-11 20:19:27'),
(117, '032047', 1, 4, 77, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-11 20:20:47', '2021-10-13 19:27:23'),
(118, '032344', 1, 4, 78, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-11 20:23:44', '2021-10-13 19:26:19'),
(119, '092618', 1, 4, 80, 2, 2, 14, 14, 0, 0, 19836, 19836, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 19836, NULL, NULL, '2021-10-12 14:26:18', '2022-11-18 17:03:53'),
(121, '111924', 1, 4, 81, 2, 2, 1, 1, 30, 0, 1119.3, 1119.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1119.3, NULL, NULL, '2021-10-12 16:19:24', '2021-10-13 19:28:04'),
(124, '125503', 1, 4, 82, 2, 2, 2, 2, 20, 0, 2563.2, 2563.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2563.2, NULL, NULL, '2021-10-12 17:55:03', '2021-10-13 20:52:17'),
(125, '011134', 1, 4, 84, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2021-10-12 18:11:34', '2021-10-12 18:11:34'),
(128, '012217', 1, 4, 41, 2, 2, 1, 1, 15, 0, 1359.15, 1359.15, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 1359.15, NULL, NULL, '2021-10-12 18:22:17', '2021-10-15 14:23:37'),
(130, '020916', 1, 4, 86, 2, 2, 4, 4, 0, 0, 5896, 5896, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 5896, NULL, NULL, '2021-10-12 19:09:16', '2022-11-18 17:03:35'),
(131, '025423', 1, 4, 167, 2, 2, 1, 3, 0, 0, 4797, 4797, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 4797, NULL, NULL, '2021-10-12 19:54:23', '2022-11-18 17:03:20'),
(132, '092353', 1, 4, 167, 2, 2, 5, 20, 0, 0, 27980, 27980, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 27980, NULL, NULL, '2021-10-13 14:23:53', '2022-11-18 17:03:02'),
(133, '102222', 1, 4, 90, 2, 2, 2, 2, 60, 0, 1993.6, 1993.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1993.6, NULL, NULL, '2021-10-13 15:22:22', '2021-10-13 20:53:52'),
(134, '102454', 1, 4, 92, 2, 2, 1, 1, 10, 0, 1100.7, 1100.7, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1100.7, NULL, NULL, '2021-10-13 15:24:54', '2021-10-13 20:53:25'),
(135, '102635', 1, 4, 91, 2, 2, 1, 1, 10, 0, 1439.1, 1639.1, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-13 15:26:35', '2021-10-13 15:26:35'),
(136, '125949', 1, 4, 93, 2, 2, 1, 1, 10, 0, 899.1, 899.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 899.1, NULL, NULL, '2021-10-13 17:59:49', '2021-10-13 19:24:27'),
(137, '110840', 1, 4, 94, 2, 2, 4, 4, 100, 0, 4497, 4497, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4497, NULL, NULL, '2021-10-14 16:08:40', '2021-12-09 16:21:24'),
(138, '114143', 1, 4, 95, 2, 2, 1, 1, 10, 0, 1124.1, 1124.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1124.1, NULL, NULL, '2021-10-14 16:41:43', '2021-10-14 21:58:30'),
(139, '122100', 1, 4, 96, 2, 2, 3, 3, 0, 0, 3947, 3947, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 3947, NULL, NULL, '2021-10-14 17:21:00', '2022-11-18 17:02:40'),
(140, '014706', 1, 4, 3, 2, 2, 8, 20, 600, 0, 18676, 18676, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 18676, NULL, NULL, '2021-10-14 18:47:06', '2021-12-09 15:57:56'),
(141, '052832', 1, 4, 100, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-14 22:28:32', '2021-10-14 22:28:32'),
(142, '054031', 1, 4, 98, 2, 2, 11, 11, 0, 0, 15239, 15239, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-14 22:40:31', '2021-10-14 22:40:31'),
(143, '060842', 1, 4, 101, 2, 2, 1, 1, 10, 0, 1439.1, 1439.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-14 23:08:42', '2021-10-14 23:08:42'),
(144, '061610', 1, 4, 102, 2, 2, 2, 2, 20, 0, 2338.2, 2338.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-14 23:16:10', '2021-10-14 23:16:10'),
(145, '062106', 1, 4, 103, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-14 23:21:06', '2021-10-14 23:21:06'),
(146, '063824', 1, 4, 104, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-14 23:38:24', '2021-10-14 23:38:24'),
(147, '035343', 1, 4, 105, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2021-10-15 20:53:43', '2021-10-15 20:53:43'),
(148, '040759', 1, 4, 167, 2, 2, 5, 5, 0, 0, 6895, 6895, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 6895, NULL, NULL, '2021-10-15 21:07:59', '2022-11-18 17:02:21'),
(149, '103050', 1, 4, 107, 2, 2, 1, 1, 10, 0, 1124.1, 1124.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-16 15:30:50', '2021-10-16 15:30:50'),
(150, '103513', 1, 4, 108, 2, 2, 1, 1, 10, 0, 719.1, 719.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-16 15:35:13', '2021-10-16 15:35:13'),
(151, '112829', 1, 4, 110, 2, 2, 12, 14, 0, 0, 19036, 19036, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 19036, NULL, NULL, '2021-10-18 16:28:29', '2022-11-18 17:02:07'),
(152, '043221', 1, 4, 111, 2, 2, 1, 1, 25, 0, 1199.25, 1199.25, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-18 21:32:21', '2021-12-04 17:10:22'),
(153, '043412', 1, 4, 112, 2, 2, 1, 1, 20, 0, 999.2, 999.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-18 21:34:12', '2021-10-18 21:34:12'),
(154, '043929', 1, 4, 113, 2, 2, 2, 2, 0, 0, 3348, 3348, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-18 21:39:29', '2021-10-18 21:39:29'),
(157, '034236', 1, 4, 115, 2, 2, 1, 1, 100, 0, 1499, 1499, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-21 20:42:36', '2021-10-21 20:42:36'),
(158, '034552', 1, 4, 116, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-21 20:45:52', '2021-10-21 20:50:24'),
(159, '034752', 1, 4, 117, 2, 2, 1, 1, 10, 0, 1349.1, 1349.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-21 20:47:52', '2021-10-21 20:47:52'),
(160, '010944', 1, 4, 167, 2, 2, 5, 5, 0, 0, 7695, 7695, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 7695, NULL, NULL, '2021-10-22 18:09:44', '2022-11-18 17:01:50'),
(161, '012956', 1, 4, 119, 2, 2, 2, 2, 0, 0, 2598, 2598, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-22 18:29:56', '2021-10-22 18:29:56'),
(162, '033157', 1, 4, 120, 2, 2, 31, 132, 0, 0, 182868, 182868, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 182868, NULL, NULL, '2021-10-22 20:31:57', '2022-11-18 17:01:36'),
(163, '034159', 1, 4, 121, 2, 2, 10, 10, 0, 0, 14890, 14890, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-10-22 20:41:59', '2021-10-22 20:41:59'),
(164, '041934', 1, 4, 122, 2, 2, 1, 1, 10, 0, 899.1, 899.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 899.1, NULL, NULL, '2021-10-22 21:19:34', '2021-11-27 15:10:53'),
(165, '093538', 1, 4, 123, 2, 2, 17, 27, 0, 0, 36723, 36723, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 36723, NULL, NULL, '2021-10-23 14:35:38', '2022-11-18 17:01:20'),
(166, '094907', 1, 4, 37, 2, 2, 6, 228, 7980, 0, 186271.8, 186271.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 150230, NULL, NULL, '2021-10-23 14:49:07', '2022-06-07 12:22:32'),
(167, '120143', 1, 4, 169, 2, 2, 5, 9, 0, 0, 12791, 12791, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 12791, NULL, NULL, '2021-10-23 17:01:43', '2022-02-21 18:14:42'),
(168, '112311', 1, 4, 124, 2, 2, 1, 1, 10, 0, 899.1, 899.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-25 16:23:11', '2021-10-25 16:23:11'),
(170, '125144', 1, 4, 127, 2, 2, 1, 1, 10, 0, 1574.1, 1574.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1450, NULL, NULL, '2021-10-26 17:51:44', '2021-11-08 17:15:05'),
(171, '011427', 1, 4, 128, 2, 2, 1, 1, 149, 0, 1100, 1300, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-10-26 18:14:27', '2021-10-26 18:14:27'),
(172, '011537', 1, 4, 128, 2, 2, 1, 1, 10, 0, 1124.1, 1324.1, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 2, NULL, 1200.1, NULL, NULL, '2021-10-26 18:15:37', '2021-11-08 17:23:52'),
(174, '105916', 1, 4, 129, 2, 2, 1, 1, 10, 0, 1349.1, 1349.1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1349.1, NULL, NULL, '2021-10-27 15:59:16', '2021-11-08 17:18:04'),
(175, '055848', 1, 4, 121, 2, 2, 3, 3, 75, 0, 3447.75, 3447.75, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3447.75, NULL, NULL, '2021-10-29 22:58:48', '2021-11-03 15:36:22'),
(176, '032017', 1, 4, 101, 2, 2, 1, 1, 10, 0, 1574.1, 1774.1, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-11-02 20:20:17', '2021-11-02 20:20:17'),
(177, '040311', 1, 4, 1, 2, 2, 3, 6, 270, 0, 4396.7, 4396.7, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-11-02 21:03:11', '2021-11-02 21:22:57'),
(178, '112952', 1, 4, 113, 2, 2, 25, 43, 0, 0, 53557, 37489.9, NULL, 0, 0, 16067.1, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-11-03 16:29:52', '2021-11-03 16:29:52'),
(179, '031004', 1, 4, 130, 2, 2, 1, 1, 0, 0, 1249, 1449, NULL, 0, 0, NULL, NULL, NULL, 200, NULL, 1, 4, NULL, 1449, NULL, NULL, '2021-11-03 20:10:04', '2021-11-03 20:10:04'),
(180, '115212', 1, 4, 3, 2, 2, 8, 26, 660, 0, 26120.6, 26120.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 26120.6, NULL, NULL, '2021-11-06 16:52:12', '2021-12-09 15:57:39'),
(181, '042214', 1, 4, 131, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2021-11-08 22:22:14', '2021-11-08 22:22:14'),
(183, '040342', 1, 4, 132, 2, 2, 1, 1, 0, 0, 819, 819, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 819, NULL, NULL, '2021-11-09 22:03:42', '2022-01-07 12:44:07'),
(185, '041049', 1, 4, 134, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:10:49', '2021-11-09 22:10:49'),
(186, '041532', 1, 4, 136, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:15:32', '2021-11-09 22:15:32'),
(188, '042634', 1, 4, 133, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 819, NULL, NULL, '2021-11-09 22:26:34', '2022-01-07 11:49:30'),
(189, '042731', 1, 4, 135, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:27:31', '2021-11-09 22:27:31'),
(193, '044104', 1, 4, 139, 2, 2, 1, 1, 0, 0, 799, 799, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:41:04', '2021-11-09 22:41:04'),
(194, '044449', 1, 4, 140, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:44:49', '2021-11-09 22:44:49'),
(195, '044746', 1, 4, 141, 2, 2, 1, 1, 0, 0, 1599, 1599, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-09 22:47:46', '2021-11-09 22:47:46'),
(196, '045354', 1, 4, 142, 2, 2, 2, 2, 0, 0, 2998, 2998, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2998, NULL, NULL, '2021-11-09 22:53:54', '2022-11-18 17:01:04'),
(197, '050751', 1, 4, 2, 2, 2, 16, 78, 2340, 0, 81005.4, 81005.4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 81005.4, NULL, NULL, '2021-11-09 23:07:51', '2022-06-07 12:39:54'),
(202, '055339', 1, 4, 167, 2, 2, 7, 7, 0, 0, 10243, 10243, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 10243, NULL, NULL, '2021-11-10 23:53:39', '2022-11-18 17:00:43'),
(204, '125047', 1, 4, 147, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-12 18:50:47', '2021-11-12 18:57:57'),
(206, '023751', 1, 4, 149, 2, 2, 2, 2, 60, 0, 1993.6, 1993.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1993.6, NULL, NULL, '2021-11-13 20:37:51', '2021-11-15 16:40:14'),
(207, '025937', 1, 4, 150, 2, 2, 4, 4, 0, 0, 5996, 5996, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 5996, NULL, NULL, '2021-11-13 20:59:37', '2022-11-18 17:00:26'),
(208, '030857', 1, 4, 151, 2, 2, 12, 18, 0, 0, 26032, 26032, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 26032, NULL, NULL, '2021-11-13 21:08:57', '2022-11-18 17:00:09'),
(209, '044916', 1, 4, 153, 2, 2, 6, 7, 0, 0, 9993, 9993, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 9993, NULL, NULL, '2021-11-13 22:49:16', '2022-11-18 16:59:46'),
(210, '052849', 1, 4, 154, 2, 2, 1, 1, 30, 0, 699.3, 699.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 699.3, NULL, NULL, '2021-11-13 23:28:49', '2021-11-13 23:28:49'),
(211, '102704', 1, 4, 34, 2, 2, 25, 100, 0, 0, 140900, 140900, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-15 16:27:04', '2021-11-15 16:39:05'),
(212, '110750', 1, 4, 155, 2, 2, 1, 1, 0, 0, 1249, 1249, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1249, NULL, NULL, '2021-11-15 17:07:50', '2022-11-18 16:58:19'),
(213, '111125', 1, 4, 156, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2021-11-15 17:11:25', '2021-11-15 17:11:25'),
(214, '111504', 1, 4, 157, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2021-11-15 17:15:04', '2021-11-15 17:15:04'),
(215, '030639', 1, 4, 160, 2, 2, 25, 50, 0, 0, 70450, 70450, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-15 21:06:39', '2021-11-15 21:06:39'),
(216, '032458', 1, 4, 161, 2, 2, 30, 30, 0, 0, 38520, 38520, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-15 21:24:58', '2021-11-15 21:24:58'),
(217, '033910', 1, 4, 162, 2, 2, 8, 7, 0, 0, 8693, 8693, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 8693, NULL, NULL, '2021-11-15 21:39:10', '2022-06-07 12:41:16'),
(231, '034902', 1, 4, 163, 2, 2, 3, 3, 0, 0, 3747, 3747, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 3747, NULL, NULL, '2021-11-15 21:49:02', '2022-11-18 16:59:30'),
(232, '040104', 1, 4, 158, 2, 2, 10, 70, 0, 0, 96530, 96530, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 96530, NULL, NULL, '2021-11-15 22:01:04', '2022-11-18 16:59:14'),
(235, '045410', 1, 4, 166, 2, 2, 8, 8, 0, 0, 10192, 10192, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 10192, NULL, NULL, '2021-11-15 22:54:10', '2022-11-18 16:58:54'),
(236, '011340', 1, 4, 168, 2, 2, 4, 4, 0, 0, 5396, 5396, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-16 19:13:40', '2021-11-16 19:16:06'),
(237, '085806', 1, 4, 173, 2, 2, 3, 3, 0, 0, 3297, 3297, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 14:58:06', '2021-11-17 14:58:06'),
(238, '090213', 1, 4, 174, 2, 2, 9, 9, 0, 0, 12191, 12191, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 15:02:13', '2021-11-17 15:02:13'),
(239, '090551', 1, 4, 175, 2, 2, 9, 9, 0, 0, 12191, 12191, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 15:05:51', '2021-11-17 15:05:51'),
(240, '091057', 1, 4, 176, 2, 2, 3, 3, 0, 0, 3547, 3547, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3547, NULL, NULL, '2021-11-17 15:10:57', '2022-11-18 16:58:35'),
(241, '091425', 1, 4, 172, 2, 2, 16, 20, 0, 0, 26980, 26980, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 15:14:25', '2021-11-17 15:14:25'),
(242, '091827', 1, 4, 177, 2, 2, 4, 4, 0, 0, 5596, 5596, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 15:18:27', '2021-11-17 15:18:27'),
(243, '115256', 1, 4, 180, 2, 2, 16, 17, 0, 0, 22033, 22033, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 17:52:56', '2021-11-17 17:52:56'),
(244, '115602', 1, 4, 181, 2, 2, 5, 5, 0, 0, 6395, 6395, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 17:56:02', '2021-11-17 17:56:02'),
(245, '120110', 1, 4, 182, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-17 18:01:10', '2021-11-17 18:03:19'),
(246, '123103', 1, 4, 3, 2, 2, 11, 26, 780, 0, 26371.8, 26371.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 26371.8, NULL, NULL, '2021-11-18 18:31:03', '2021-11-23 14:19:12'),
(247, '021211', 1, 4, 183, 2, 2, 22, 22, 660, 0, 21789.6, 21789.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 21789.6, NULL, NULL, '2021-11-18 20:12:11', '2022-11-18 16:49:24'),
(249, '122307', 1, 4, 185, 2, 2, 6, 16, 0, 0, 21284, 21284, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 21284, NULL, NULL, '2021-11-20 12:23:07', '2022-11-18 16:51:44'),
(251, '042905', 1, 4, 188, 2, 2, 7, 21, 0, 0, 31479, 31479, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-22 16:29:05', '2021-12-13 11:45:43'),
(252, '104820', 1, 4, 37, 2, 2, 12, 318, 11130, 0, 284704.22, 284704.22, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 300000, NULL, NULL, '2021-11-25 10:48:20', '2022-09-30 15:29:11'),
(253, '102040', 1, 4, 187, 2, 2, 3, 3, 0, 0, 4147, 4147, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4147, NULL, NULL, '2021-11-26 10:20:40', '2022-11-18 17:20:07'),
(254, '105736', 1, 4, 189, 2, 2, 19, 19, 0, 0, 25581, 25581, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 25581, NULL, NULL, '2021-11-26 10:57:36', '2022-06-07 12:38:01'),
(255, '120904', 1, 4, 190, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1749, NULL, NULL, '2021-11-26 12:09:04', '2022-11-19 11:13:55'),
(256, '094840', 1, 4, 7, 2, 2, 27, 27, 0, 0, 36573, 36573, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 36573, NULL, NULL, '2021-11-27 09:48:40', '2022-11-18 16:57:16'),
(257, '095102', 1, 4, 192, 2, 2, 29, 29, 0, 0, 39371, 39371, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-11-27 09:51:02', '2021-11-27 09:57:03'),
(258, '095538', 1, 4, 193, 2, 2, 39, 40, 0, 0, 54260, 54260, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2021-11-27 09:55:38', '2022-11-10 10:06:39'),
(263, '110221', 1, 4, 2, 2, 2, 15, 68, 2040, 0, 59312.4, 59312.4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 59312.4, NULL, NULL, '2021-11-29 11:02:21', '2022-02-09 18:38:06'),
(264, '110956', 1, 4, 208, 2, 2, 15, 97, 2910, 0, 80758.69, 80758.69, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2021-11-29 11:09:56', '2022-10-14 12:33:34'),
(265, '111233', 1, 4, 3, 2, 2, 7, 20, 600, 0, 19201, 19201, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 19201, NULL, NULL, '2021-11-29 11:12:33', '2021-12-09 15:57:00'),
(266, '050548', 1, 4, 197, 2, 2, 2, 2, 60, 0, 1993.6, 1993.6, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 1993.6, NULL, NULL, '2021-11-30 17:05:48', '2021-12-02 16:34:21'),
(267, '013143', 1, 4, 97, 2, 2, 2, 2, 0, 0, 3148, 3148, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-01 13:31:43', '2021-12-01 13:31:43'),
(268, '021434', 1, 4, 198, 2, 2, 4, 4, 0, 0, 6096, 6096, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 6096, NULL, NULL, '2021-12-01 14:14:34', '2022-11-19 11:12:18'),
(269, '034036', 1, 4, 153, 2, 2, 6, 12, 420, 0, 11562.2, 11562.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 11562.2, NULL, NULL, '2021-12-01 15:40:36', '2021-12-01 15:40:36'),
(270, '045949', 1, 4, 199, 2, 2, 5, 5, 500, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 0, NULL, NULL, '2021-12-01 16:59:49', '2021-12-01 16:59:49'),
(271, '105428', 1, 4, 200, 2, 2, 5, 5, 0, 0, 7545, 7545, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7545, NULL, NULL, '2021-12-04 10:54:28', '2022-06-07 12:36:30'),
(273, '110253', 1, 4, 202, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2021-12-04 11:02:53', '2022-11-19 11:13:20'),
(274, '110435', 1, 4, 203, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-04 11:04:35', '2021-12-04 11:04:35'),
(275, '110610', 1, 4, 204, 2, 2, 1, 3, 0, 0, 2997, 2997, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 2332, NULL, NULL, '2021-12-04 11:06:10', '2022-01-04 10:51:10'),
(276, '111146', 1, 4, 207, 2, 2, 17, 66, 0, 0, 89384, 89384, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-06 11:11:46', '2021-12-06 11:11:46'),
(277, '120013', 1, 4, 208, 2, 2, 1, 5, 150, 0, 5596.5, 5596.5, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-07 12:00:13', '2021-12-07 12:00:13'),
(278, '120322', 1, 4, 209, 2, 2, 4, 4, 0, 0, 6146, 6146, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2021-12-07 12:03:22', '2022-10-12 15:32:24'),
(279, '120733', 1, 4, 210, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-07 12:07:33', '2021-12-07 12:07:33'),
(281, '110445', 1, 4, 37, 2, 2, 4, 24, 840, 0, 20264.4, 20264.4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-09 11:04:45', '2021-12-09 11:04:45'),
(282, '015335', 1, 4, 3, 2, 2, 5, 23, 690, 0, 17623.9, 17623.9, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 17623.9, NULL, NULL, '2021-12-09 13:53:35', '2022-02-22 14:58:05'),
(284, '111333', 1, 4, 212, 2, 2, 39, 149, 5215, 0, 129350.65, 129350.65, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 129350.65, NULL, NULL, '2021-12-13 11:13:33', '2022-05-28 12:04:03'),
(287, '021241', 1, 4, 214, 2, 2, 4, 4, 0, 0, 5896, 5896, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-13 14:12:41', '2021-12-13 14:12:41'),
(290, '045531', 1, 4, 121, 2, 2, 3, 3, 1149.25, 0, 3447.75, 3447.75, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 3447.75, NULL, NULL, '2021-12-13 16:55:31', '2021-12-14 09:56:22'),
(291, '103824', 1, 4, 215, 2, 2, 18, 18, 0, 0, 21732, 21732, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 21732, NULL, NULL, '2021-12-14 10:38:24', '2022-11-18 17:29:00'),
(293, '052035', 1, 4, 217, 2, 2, 1, 1, 35, 0, 811.85, 811.85, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 811.85, NULL, NULL, '2021-12-14 17:20:35', '2021-12-15 16:37:26'),
(294, '030357', 1, 4, 218, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2021-12-15 15:03:57', '2021-12-15 15:04:30'),
(296, '112050', 1, 4, 216, 2, 2, 39, 140, 4900, 0, 118794, 118794, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 90171, NULL, NULL, '2021-12-18 11:20:50', '2022-06-07 12:28:35'),
(298, '122458', 1, 4, 220, 2, 2, 39, 118, 4479.16, 0, 115871.04, 115871.04, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 10000, NULL, NULL, '2021-12-20 12:24:58', '2022-02-22 13:54:03'),
(300, '105436', 1, 4, 2, 2, 2, 9, 33, 990, 0, 31231.9, 31231.9, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 31231.9, NULL, NULL, '2021-12-23 10:54:36', '2022-02-09 18:37:26'),
(304, '060325', 1, 4, 14, 2, 2, 1, 2, 0, 0, 3498, 3498, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 3498, 'KHS', NULL, '2021-12-28 18:03:25', '2022-11-18 16:58:02'),
(305, '050640', 1, 4, 20, 2, 2, 38, 152, 5320, 0, 133801.2, 133801.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 133801.2, NULL, NULL, '2021-12-29 17:06:40', '2022-09-05 10:52:38'),
(307, '110658', 1, 4, 223, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 819, NULL, NULL, '2022-01-03 11:06:58', '2022-01-07 12:23:21'),
(308, '113546', 1, 4, 1, 2, 2, 7, 7, 175, 0, 7832.25, 7832.25, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7832.25, NULL, NULL, '2022-01-04 11:35:46', '2022-11-18 16:48:03'),
(309, '115517', 1, 4, 225, 2, 2, 1, 1, 0, 0, 1499, 1499, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-01-04 11:55:17', '2022-01-04 11:55:17'),
(310, '115750', 1, 4, 226, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-01-04 11:57:50', '2022-01-04 12:06:53'),
(311, '085436', 1, 4, 97, 2, 2, 5, 5, 0, 0, 6295, 6295, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-01-05 08:54:36', '2022-01-05 08:54:36'),
(312, '054011', 1, 4, 8, 2, 2, 1, 4, 180, 0, 3517.8, 3517.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3517.8, NULL, NULL, '2022-01-06 17:40:11', '2022-01-06 17:40:11'),
(313, '125837', 1, 4, 216, 2, 2, 2, 18, 630, 0, 12841.53, 12841.53, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1, 4, NULL, 12841.53, NULL, NULL, '2022-01-08 12:58:37', '2022-06-07 12:27:23'),
(314, '094409', 1, 4, 14, 2, 2, 3, 4, 0, 0, 5946, 5946, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 5946, NULL, NULL, '2022-01-10 09:44:09', '2022-11-18 16:57:46'),
(315, '043503', 1, 4, 227, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2022-01-10 16:35:03', '2022-11-18 16:48:59'),
(316, '044640', 1, 4, 228, 2, 2, 38, 152, 4410, 0, 148327.1, 148327.1, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 53000.1, NULL, NULL, '2022-01-10 16:46:40', '2022-06-11 17:39:34'),
(318, '122210', 1, 4, 1, 2, 2, 10, 10, 0, 0, 13340, 13340, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 13340, NULL, NULL, '2022-01-12 12:22:10', '2022-08-31 10:34:38'),
(320, '091726', 1, 4, 224, 2, 2, 7, 7, 175, 0, 7832.25, 7832.25, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 7832.25, NULL, NULL, '2022-01-12 21:17:26', '2022-06-21 15:10:48'),
(321, '053624', 1, 4, 11, 2, 2, 1, 3, 90, 0, 2622.9, 2622.9, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-01-14 17:36:24', '2022-01-14 17:36:24'),
(322, '093407', 1, 4, 231, 2, 2, 21, 23, 575, 0, 23795.25, 23795.25, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 19500, NULL, NULL, '2022-01-18 09:34:07', '2022-10-15 11:59:50'),
(323, '103138', 1, 4, 232, 2, 2, 14, 34, 612, 0, 33940.98, 33940.98, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 27979, NULL, NULL, '2022-01-18 10:31:38', '2022-08-26 12:00:09'),
(324, '104619', 1, 4, 233, 2, 2, 3, 3, 45, 0, 2547.45, 2547.45, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1500, NULL, NULL, '2022-01-18 10:46:19', '2022-01-18 19:03:28'),
(325, '110701', 1, 4, 234, 2, 2, 9, 14, 210, 0, 18135.6, 18135.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-01-18 11:07:01', '2022-01-18 11:07:01'),
(326, '113052', 1, 4, 235, 2, 2, 5, 5, 125, 0, 5058.75, 5058.75, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 5058.75, NULL, NULL, '2022-01-18 11:30:52', '2022-06-21 10:47:20'),
(327, '115546', 1, 4, 236, 2, 2, 14, 14, 350, 0, 13714.5, 13714.5, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 3000, NULL, NULL, '2022-01-18 11:55:46', '2022-02-22 13:00:24'),
(328, '123432', 1, 4, 212, 2, 2, 9, 32, 1120, 0, 29749.2, 29749.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 29749.2, NULL, NULL, '2022-01-18 12:34:32', '2022-02-22 14:03:55'),
(329, '105854', 1, 4, 237, 2, 2, 4, 11, 330, 0, 9792.3, 9792.3, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 9792.3, NULL, NULL, '2022-01-24 10:58:54', '2022-11-18 16:46:26'),
(330, '111439', 1, 4, 238, 2, 2, 18, 24, 720, 0, 21123.2, 21123.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 7000, NULL, NULL, '2022-01-24 11:14:39', '2022-06-21 14:53:57'),
(331, '112413', 1, 4, 239, 2, 2, 6, 8, 200, 0, 9294, 9294, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 4000, NULL, NULL, '2022-01-24 11:24:13', '2022-05-28 10:39:32'),
(332, '113534', 1, 4, 240, 2, 2, 7, 7, 0, 0, 9643, 9643, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 9643, NULL, NULL, '2022-01-24 11:35:34', '2022-11-19 13:44:42'),
(333, '113111', 1, 4, 1, 2, 2, 19, 22, 550, 0, 23346, 23346, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 23346, NULL, NULL, '2022-01-25 11:31:11', '2022-11-18 16:44:44'),
(334, '101028', 1, 4, 2, 2, 2, 13, 51, 1530, 0, 48264.3, 48264.3, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 48264.3, NULL, NULL, '2022-01-26 10:10:28', '2022-02-22 13:08:58'),
(336, '105037', 1, 4, 243, 2, 2, 41, 200, 8000, 0, 160680, 160680, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 80000, NULL, NULL, '2022-01-26 10:50:37', '2022-03-18 10:51:50'),
(337, '123348', 1, 4, 244, 2, 2, 22, 51, 1530, 0, 49874.3, 49874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 10000, NULL, NULL, '2022-02-01 12:33:48', '2022-06-22 17:47:17'),
(338, '124354', 1, 4, 245, 2, 2, 22, 51, 1785, 0, 46311.85, 46311.85, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-02-01 12:43:54', '2022-02-01 12:43:54'),
(340, '031629', 1, 4, 247, 2, 2, 10, 11, 220, 0, 11391.2, 11391.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 2847, NULL, NULL, '2022-02-01 15:16:29', '2022-02-22 13:04:15'),
(341, '033301', 1, 4, 248, 2, 2, 20, 23, 575, 0, 22070.25, 22070.25, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-02-01 15:33:01', '2022-02-01 15:54:11'),
(349, '042313', 1, 4, 255, 2, 2, 3, 3, 75, 0, 2810.25, 2810.25, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-02-05 16:23:13', '2022-05-31 11:29:13'),
(350, '050107', 1, 4, 146, 2, 2, 4, 6, 180, 0, 5245.8, 5245.8, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 5245.8, 'This amount is expense taken by Zahid sab salesman', 'This amount is expense taken by Zahid sab salesman', '2022-02-05 17:01:07', '2022-06-07 12:34:25'),
(351, '054020', 1, 4, 257, 2, 2, 28, 56, 1400, 0, 56133, 56133, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 5633, NULL, NULL, '2022-02-05 17:40:20', '2022-05-28 10:10:52'),
(352, '095819', 1, 4, 258, 2, 2, 27, 27, 675, 0, 26792.25, 26792.25, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 5000, NULL, NULL, '2022-02-07 09:58:19', '2022-02-21 18:21:24'),
(353, '101428', 1, 4, 259, 2, 2, 29, 54, 1620, 0, 50817.2, 50817.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 5000, NULL, NULL, '2022-02-07 10:14:28', '2022-02-21 18:17:40'),
(354, '102352', 1, 4, 260, 2, 2, 1, 1, 20, 0, 655.36, 655.36, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-02-07 10:23:52', '2022-06-21 16:19:28'),
(355, '105059', 1, 4, 232, 2, 2, 10, 19, 342, 0, 28858.48, 28858.48, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 5000, NULL, NULL, '2022-02-07 10:50:59', '2022-07-01 16:14:09'),
(356, '105931', 1, 4, 262, 2, 2, 1, 1, 25, 0, 468.19, 468.19, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 468.19, NULL, NULL, '2022-02-07 10:59:31', '2022-08-31 10:28:04'),
(357, '111648', 1, 4, 216, 2, 2, 6, 22, 770, 0, 21988.2, 21988.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 21988.2, NULL, NULL, '2022-02-07 11:16:48', '2022-06-07 12:27:12'),
(358, '114424', 1, 4, 37, 2, 2, 10, 111, 3885, 0, 100645.35, 100645.35, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 100645.35, NULL, NULL, '2022-02-07 11:44:24', '2022-03-18 10:25:19'),
(359, '093334', 1, 4, 263, 2, 2, 7, 14, 0, 0, 17986, 17986, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 17986, NULL, NULL, '2022-02-08 09:33:34', '2022-11-18 16:43:36'),
(360, '093705', 1, 4, 1, 2, 2, 3, 6, 108, 0, 4915.08, 4915.08, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4915.08, NULL, NULL, '2022-02-08 09:37:05', '2022-08-31 10:24:12'),
(361, '094744', 1, 4, 265, 2, 2, 8, 16, 352, 0, 12467.52, 12467.52, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-02-08 09:47:44', '2022-02-08 09:47:44'),
(363, '012718', 1, 4, 2, 2, 2, 7, 29, 870, 0, 24269.7, 24269.7, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 24269.7, NULL, NULL, '2022-02-14 13:27:18', '2022-06-07 12:40:36'),
(365, '113009', 1, 4, 14, 2, 2, 16, 21, 0, 0, 28929, 28929, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 28929, NULL, NULL, '2022-02-17 11:30:09', '2022-11-18 16:57:29'),
(366, '113826', 1, 4, 229, 2, 2, 6, 6, 0, 0, 7294, 7294, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7294, NULL, NULL, '2022-02-17 11:38:26', '2022-11-18 16:45:19'),
(367, '121249', 1, 4, 14, 2, 2, 4, 4, 0, 0, 5196, 5196, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 5196, NULL, NULL, '2022-02-17 12:12:49', '2022-02-17 12:12:49'),
(368, '113822', 1, 4, 1, 2, 2, 1, 3, 90, 0, 3672.9, 3672.9, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3672.9, NULL, NULL, '2022-02-19 11:38:22', '2022-02-19 11:38:22'),
(370, '033816', 1, 4, 268, 2, 2, 17, 21, 525, 0, 21396.75, 21396.75, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1500, NULL, NULL, '2022-01-19 15:38:16', '2022-03-18 11:31:42'),
(371, '035529', 1, 4, 269, 2, 2, 30, 89, 2225, 0, 91433.25, 91433.25, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-02-19 15:55:29', '2022-02-28 16:10:22'),
(373, '040348', 1, 4, 271, 2, 2, 17, 36, 720, 0, 38291.2, 38291.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 14658, NULL, NULL, '2022-01-19 16:03:48', '2022-09-23 14:48:59'),
(374, '041216', 1, 4, 273, 2, 2, 30, 60, 1500, 0, 61830, 61830, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-02-19 16:12:16', '2022-02-19 16:12:16'),
(375, '042533', 1, 4, 272, 2, 2, 9, 20, 448, 0, 22348.76, 22348.76, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 7911, NULL, NULL, '2022-02-19 16:25:33', '2022-06-21 16:08:00'),
(378, '043619', 1, 4, 276, 2, 2, 2, 2, 36, 0, 1372.98, 1372.98, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 1372.98, 'Expense is taken by Zahid sab S/M', 'Expense is taken by Zahid sab S/M', '2022-02-19 16:36:19', '2022-06-07 12:06:04'),
(380, '110404', 1, 4, 278, 2, 2, 1, 1, 15, 0, 734.53, 734.53, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 734.53, 'Expense is taken by Zahid sab S/M', 'Expense is taken by Zahid sab S/M', '2022-02-21 11:04:04', '2022-06-21 17:22:58'),
(393, '032127', 1, 4, 1, 2, 2, 7, 8, 0, 0, 9492, 9492, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 9492, NULL, NULL, '2022-02-22 15:21:27', '2022-08-31 10:24:29'),
(394, '035912', 1, 4, 270, 2, 2, 29, 86, 2580, 0, 83169.8, 83169.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-02-22 15:40:45', '2022-05-28 11:14:42'),
(396, '043058', 1, 4, 280, 2, 2, 3, 15, 300, 0, 20388, 20388, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 6000, NULL, NULL, '2022-02-22 16:30:58', '2022-09-30 11:33:23'),
(397, '123856', 1, 4, 282, 2, 2, 1, 10, 0, 0, 10000, 10000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-02-24 12:38:56', '2022-02-24 12:38:56'),
(398, '125146', 1, 4, 281, 2, 2, 3, 3, 120, 0, 2758.2, 2758.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2758.2, NULL, NULL, '2022-02-24 12:51:46', '2022-08-31 10:25:54'),
(399, '051507', 1, 4, 24, 2, 2, 2, 96, 4320, 0, 92347.2, 92347.2, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 92347.2, NULL, NULL, '2022-03-01 17:15:07', '2022-11-18 16:57:02'),
(404, '122823', 1, 4, 146, 2, 2, 28, 128, 3570, 0, 129522.7, 129492.7, NULL, 0, 0, 30, NULL, NULL, 0, '0.00', 1, 2, NULL, 5000, NULL, NULL, '2022-03-05 12:28:23', '2022-07-30 16:02:59'),
(405, '124355', 1, 4, 243, 2, 2, 14, 108, 4320, 0, 100855.2, 100855.2, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 100000, NULL, NULL, '2022-03-08 12:43:55', '2022-06-11 17:26:36'),
(407, '114220', 1, 4, 37, 2, 2, 3, 94, 2820, 0, 74883.9, 74883.9, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 29335, NULL, NULL, '2022-03-15 11:42:20', '2022-09-30 15:27:29'),
(409, '050041', 1, 4, 14, 2, 2, 9, 9, 0, 0, 12691, 12691, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 12691, NULL, NULL, '2022-03-16 17:00:41', '2022-11-18 16:56:23'),
(410, '050327', 1, 4, 14, 2, 2, 14, 14, 0, 0, 20036, 20036, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 20036, 'Aamir bhai Gift', NULL, '2022-03-16 17:03:27', '2022-11-18 16:56:05'),
(411, '050541', 1, 4, 229, 2, 2, 6, 6, 0, 0, 7244, 7244, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, 'Exchange amount Pending', 'Adnan bhai give to Danayal', '2022-03-16 17:05:41', '2022-03-16 17:05:41'),
(412, '050754', 1, 4, 14, 2, 2, 8, 10, 0, 0, 15690, 15690, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 15690, 'ALI Asghar gift', NULL, '2022-03-16 17:07:54', '2022-11-18 16:55:51'),
(414, '123935', 1, 4, 285, 2, 2, 40, 375, 6750, 0, 413587.5, 351549.38, NULL, 0, 0, 15, NULL, NULL, 0, '0.00', 1, 2, NULL, 175000, NULL, NULL, '2022-03-17 12:39:35', '2022-03-18 10:42:47'),
(430, '115727', 1, 4, 33, 2, 2, 2, 2, 0, 0, 3498, 3498, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 3498, NULL, NULL, '2022-03-21 11:57:27', '2022-11-18 16:55:37'),
(435, '045233', 1, 4, 216, 2, 2, 3, 20, 600, 0, 17486, 17486, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 17486, NULL, NULL, '2022-03-21 16:52:33', '2022-06-07 12:26:57'),
(436, '104151', 1, 4, 2, 2, 2, 4, 38, 1140, 0, 37493.4, 38961.936, '104151', 0, 0, 30, NULL, NULL, 0, '0.00', 1, 2, NULL, 38961.94, NULL, NULL, '2022-03-24 10:41:51', '2022-06-07 12:40:11'),
(438, '025342', 1, 4, 19, 2, 2, 4, 38, 1140, 0, 15691.12, 15691.12, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2022-03-26 14:53:42', '2022-11-26 15:30:06');
INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `extra_tax`, `order_tax_rate`, `order_tax`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `daraz_amount`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(439, '042148', 1, 4, 19, 2, 2, 1, 12, 360, 0, 8391.6, 8391.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-03-26 16:21:48', '2022-03-26 16:21:48'),
(443, '051545', 1, 4, 208, 2, 2, 15, 50, 1980, 0, 29660.47, 29660.47, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-03-28 17:15:45', '2022-10-13 16:27:44'),
(446, '040545', 1, 4, 290, 2, 2, 1, 1, 30, 0, 699.3, 699.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 699.3, NULL, NULL, '2022-03-30 16:05:45', '2022-09-02 09:17:52'),
(447, '111352', 1, 4, 243, 2, 2, 12, 89, 0, 0, 127861, 76716.6, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 2, NULL, 69550, NULL, NULL, '2022-04-01 11:13:52', '2022-05-11 10:44:35'),
(448, '104754', 1, 4, 24, 2, 2, 7, 10, 0, 0, 14190, 14190, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 14190, NULL, NULL, '2022-04-04 10:47:54', '2022-11-18 16:55:20'),
(449, '105111', 1, 4, 291, 2, 2, 6, 7, 0, 0, 9993, 9993, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 9993, NULL, NULL, '2022-04-04 10:51:11', '2022-11-18 17:26:48'),
(450, '105632', 1, 4, 398, 2, 2, 24, 48, 0, 0, 66902, 66902, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2022-04-04 10:56:32', '2022-12-16 10:58:23'),
(451, '013139', 1, 4, 19, 2, 2, 3, 6, 0, 0, 7494, 7449, NULL, 0, 0, 45, NULL, NULL, 0, '0.00', 1, 2, NULL, 0, NULL, NULL, '2022-04-16 13:31:39', '2022-10-14 11:44:45'),
(452, '013852', 1, 4, 222, 2, 2, 7, 8, 0, 0, 12092, 8222.56, NULL, 0, 0, 32, NULL, NULL, NULL, NULL, 1, 4, NULL, 8222.56, NULL, NULL, '2022-04-16 13:38:52', '2022-05-11 10:42:47'),
(453, '022522', 1, 4, 294, 2, 2, 5, 5, 0, 0, 6495, 6495, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-04-16 14:25:22', '2022-04-16 14:25:22'),
(454, '024552', 1, 4, 221, 2, 2, 5, 5, 0, 0, 5195, 5195, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 5195, 'Sample given by Zahid sab S/M', 'Sample given by Zahid sab S/M', '2022-04-16 14:45:52', '2022-06-07 12:13:31'),
(456, '031016', 1, 4, 295, 2, 2, 12, 12, 0, 0, 17488, 17488, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, 'Samples to Ansari sahab', 'Samples to Ansari sahab', '2022-04-27 15:10:16', '2022-04-27 15:10:16'),
(457, '031210', 1, 4, 14, 2, 2, 1, 2, 0, 0, 3498, 3498, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3498, 'gift to ferqan shah', 'gift to ferqan shah', '2022-04-27 15:12:10', '2022-11-18 16:55:07'),
(461, '102802', 1, 4, 243, 2, 2, 5, 66, 2640, 0, 82796.4, 82796.4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 75000, NULL, NULL, '2022-05-07 10:28:02', '2022-08-23 12:07:07'),
(462, '021311', 1, 4, 151, 2, 2, 1, 3, 0, 0, 4797, 4797, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4797, NULL, NULL, '2022-05-09 14:13:11', '2022-11-18 16:54:51'),
(466, '050026', 1, 4, 14, 2, 2, 3, 10, 0, 0, 20346, 20346, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 20346, 'amir(uk)', NULL, '2022-05-20 17:00:26', '2022-05-20 17:00:26'),
(467, '050159', 1, 4, 33, 2, 2, 2, 2, 80, 0, 2549.4, 2549.4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2549.4, NULL, NULL, '2022-05-20 17:01:59', '2022-06-21 10:55:27'),
(468, '043825', 1, 4, 297, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-05-28 16:38:25', '2022-06-11 16:57:22'),
(469, '114151', 1, 4, 37, 2, 2, 2, 66, 1980, 0, 62953.8, 62953.8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 62953.8, NULL, NULL, '2022-05-31 11:41:51', '2022-06-07 12:19:08'),
(470, '022757', 1, 4, 37, 2, 2, 6, 84, 2520, 0, 124723.2, 124723.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 124723.2, NULL, NULL, '2022-06-02 14:27:57', '2022-06-07 12:18:21'),
(471, '014705', 1, 4, 298, 2, 2, 5, 5, 0, 0, 8647, 8647, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 8647, NULL, NULL, '2022-06-06 13:47:05', '2022-11-18 17:20:37'),
(472, '124101', 1, 4, 97, 2, 2, 1, 1, 30, 0, 1750, 1750, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1750, NULL, NULL, '2022-06-10 12:41:01', '2022-06-11 16:55:34'),
(473, '043012', 1, 4, 301, 2, 2, 2, 2, 20, 0, 4500, 4500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4500, NULL, NULL, '2022-06-14 16:30:12', '2022-06-14 16:34:12'),
(474, '052539', 1, 4, 302, 2, 2, 7, 7, 0, 0, 11495, 11495, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 11495, NULL, NULL, '2022-06-17 17:25:39', '2022-11-18 16:42:36'),
(478, '054126', 1, 4, 20, 2, 2, 5, 36, 1080, 0, 54591.6, 54591.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 20468, NULL, NULL, '2022-06-21 17:41:26', '2022-12-24 10:59:24'),
(479, '052722', 1, 4, 305, 2, 2, 1, 1, 20, 0, 2000, 2000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2000, NULL, NULL, '2022-06-23 17:27:22', '2022-06-23 17:27:22'),
(480, '051757', 1, 4, 306, 2, 2, 1, 1, 30, 0, 1750, 1750, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1750, NULL, NULL, '2022-06-24 17:17:57', '2022-07-06 16:29:36'),
(483, '061927', 1, 4, 308, 2, 2, 41, 776, 23280, 0, 794061.8, 794061.8, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 290000, NULL, NULL, '2022-06-27 18:19:27', '2022-09-22 10:05:57'),
(484, '041821', 1, 4, 37, 2, 2, 9, 74, 2220, 0, 65398.2, 65398.2, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 65398.2, NULL, NULL, '2022-06-28 16:18:21', '2022-12-02 19:02:00'),
(485, '042122', 1, 4, 308, 2, 2, 4, 360, 10800, 0, 327348, 327348, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 100000, NULL, NULL, '2022-06-28 16:21:22', '2022-08-26 13:00:09'),
(491, '110548', 1, 4, 32, 2, 2, 6, 7, 0, 0, 11696, 11696, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 11696, NULL, NULL, '2022-07-01 11:05:48', '2022-11-18 16:54:33'),
(492, '125258', 1, 4, 309, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, 0, NULL, NULL, 1150, '1150', 1, 2, NULL, 0, 'Darz Online', NULL, '2022-07-01 12:52:58', '2022-07-01 14:34:17'),
(493, '041743', 1, 4, 151, 2, 2, 4, 8, 0, 0, 14096, 14096, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 14096, NULL, NULL, '2022-07-01 16:17:43', '2022-11-18 16:54:18'),
(495, '120926', 1, 4, 311, 2, 2, 2, 2, 100, 0, 2150, 2150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2150, NULL, NULL, '2022-07-04 12:09:26', '2022-07-05 14:39:12'),
(497, '032213', 1, 4, 310, 2, 2, 1, 1, 50, 0, 900, 900, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 900, NULL, NULL, '2022-07-05 15:22:13', '2022-07-05 15:22:13'),
(499, '114518', 1, 4, 314, 2, 2, 1, 1, 50, 0, 900, 900, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-06 11:45:18', '2022-07-06 11:45:18'),
(500, '041008', 1, 4, 316, 2, 2, 1, 1, 0, 0, 1309, 1309, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1309, NULL, NULL, '2022-07-06 16:10:08', '2022-11-18 17:11:35'),
(501, '041310', 1, 4, 317, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-06 16:13:10', '2022-11-18 16:50:06'),
(503, '043732', 1, 4, 318, 2, 2, 5, 5, 0, 0, 8496, 8496, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 8496, NULL, NULL, '2022-07-06 16:37:32', '2022-11-18 16:50:34'),
(505, '040132', 1, 4, 318, 2, 2, 6, 10, 0, 0, 17094, 17094, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 17094, NULL, NULL, '2022-07-07 16:01:32', '2022-11-18 16:54:01'),
(506, '111108', 1, 4, 321, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-13 11:11:08', '2022-11-18 17:12:43'),
(507, '111157', 1, 4, 320, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-13 11:11:57', '2022-11-18 17:13:05'),
(508, '112413', 1, 4, 319, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 999, NULL, NULL, '2022-07-13 11:24:13', '2022-11-18 17:13:27'),
(509, '022947', 1, 4, 322, 2, 2, 1, 1, 30, 0, 874.3, 874.3, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 874.3, NULL, NULL, '2022-07-16 14:29:47', '2022-07-16 14:29:47'),
(510, '024956', 1, 4, 2, 2, 2, 7, 33, 825, 0, 45141, 45141, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 45141, NULL, NULL, '2022-07-18 14:49:56', '2022-08-26 11:16:00'),
(512, '111812', 1, 4, 20, 2, 2, 7, 50, 1400, 0, 47791.01, 47791.01, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 50000, NULL, NULL, '2022-07-19 11:18:12', '2022-10-28 15:08:50'),
(513, '094315', 1, 4, 323, 2, 2, 1, 1, 20, 0, 2000, 2000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2000, NULL, NULL, '2022-07-20 09:43:15', '2022-11-18 17:26:27'),
(515, '021820', 1, 4, 318, 2, 2, 7, 8, 0, 0, 12525, 12525, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 12525, NULL, NULL, '2022-07-21 14:18:20', '2022-11-18 16:53:42'),
(516, '024048', 1, 4, 324, 2, 2, 3, 3, 150, 0, 3174.5, 3174.5, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1000, NULL, NULL, '2022-07-21 14:40:48', '2022-07-21 14:40:48'),
(517, '024435', 1, 4, 325, 2, 2, 1, 1, 50, 0, 900, 900, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 900, NULL, NULL, '2022-07-21 14:44:35', '2022-07-21 14:44:35'),
(518, '024549', 1, 4, 318, 2, 2, 1, 2, 0, 0, 3498, 10893, NULL, 0, 0, 0, NULL, NULL, 7395, '0.00', 1, 4, NULL, 10893, NULL, NULL, '2022-07-21 14:45:49', '2022-11-18 16:53:31'),
(520, '025051', 1, 4, 326, 2, 2, 7, 7, 0, 0, 11795, 11795, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-21 14:50:51', '2022-07-21 14:50:51'),
(521, '025401', 1, 4, 327, 2, 2, 9, 9, 0, 0, 13292, 13292, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 13292, NULL, NULL, '2022-07-21 14:54:01', '2022-11-18 16:53:19'),
(522, '030851', 1, 4, 328, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-21 15:08:51', '2022-11-18 17:13:43'),
(524, '103829', 1, 4, 329, 2, 2, 1, 1, 44, 0, 1008, 1008, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1008, NULL, NULL, '2022-07-22 10:38:29', '2022-07-22 10:38:29'),
(525, '030014', 1, 4, 330, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-23 15:00:14', '2022-11-18 17:13:57'),
(526, '102835', 1, 4, 331, 2, 2, 1, 1, 20, 0, 2000, 2000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-25 10:28:35', '2022-07-25 10:28:35'),
(527, '103244', 1, 4, 332, 2, 2, 1, 1, 50, 0, 900, 900, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 900, NULL, NULL, '2022-07-25 10:32:44', '2022-11-18 16:41:38'),
(528, '123326', 1, 4, 89, 2, 2, 1, 1, 0, 0, 999, 999, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 999, NULL, NULL, '2022-07-26 12:33:26', '2022-11-18 16:50:58'),
(529, '123650', 1, 4, 333, 2, 2, 1, 2, 0, 0, 2300, 2300, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 2300, NULL, NULL, '2022-07-26 12:36:50', '2022-11-18 17:14:14'),
(530, '052832', 1, 4, 334, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-27 17:28:32', '2022-11-18 17:25:57'),
(531, '052929', 1, 4, 335, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-07-27 17:29:29', '2022-11-18 17:14:28'),
(532, '110919', 1, 4, 336, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 1150, NULL, NULL, '2022-07-29 11:09:19', '2022-11-18 17:18:36'),
(533, '123557', 1, 4, 337, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 1150, NULL, NULL, '2022-07-29 12:35:57', '2022-11-18 17:18:53'),
(534, '042457', 1, 4, 298, 2, 2, 3, 15, 0, 0, 14985, 14985, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-29 16:24:57', '2022-07-29 16:24:57'),
(535, '013326', 1, 4, 338, 2, 2, 28, 84, 2100, 0, 102240, 102240, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-30 13:33:26', '2022-07-30 13:33:26'),
(536, '014435', 1, 4, 339, 2, 2, 28, 112, 2800, 0, 136320, 136320, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-07-30 13:44:35', '2022-07-30 13:44:35'),
(537, '020056', 1, 4, 340, 2, 2, 4, 12, 240, 0, 19080, 19080, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-07-30 14:00:56', '2022-08-04 14:07:12'),
(539, '013359', 1, 4, 341, 2, 2, 1, 1, 35.5, 0, 1128.11, 1128.11, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1128.11, NULL, NULL, '2022-08-01 13:33:59', '2022-11-18 17:19:06'),
(540, '114121', 1, 4, 342, 2, 2, 1, 2, 20, 0, 2070, 2070, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2070, NULL, NULL, '2022-08-02 11:41:21', '2022-11-18 17:19:22'),
(542, '021839', 1, 4, 398, 2, 2, 16, 359, 10770, 0, 220579.66, 220579.66, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-08-04 14:18:39', '2022-12-16 10:32:37'),
(543, '103443', 1, 4, 344, 2, 2, 1, 1, 20, 0, 2000, 2000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2000, NULL, NULL, '2022-08-05 10:34:43', '2022-08-05 10:34:43'),
(544, '094052', 1, 4, 345, 2, 2, 1, 1, 0, 0, 1190, 1190, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1190, NULL, NULL, '2022-08-06 09:40:52', '2022-11-18 17:25:24'),
(545, '113607', 1, 4, 344, 2, 2, 1, 1, 20, 0, 2000, 2000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2000, NULL, NULL, '2022-08-06 11:36:07', '2022-08-06 11:36:07'),
(546, '031254', 1, 4, 346, 2, 2, 2, 2, 40, 0, 2360, 2360, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2360, NULL, NULL, '2022-08-06 15:12:54', '2022-08-06 15:12:54'),
(547, '095047', 1, 4, 2, 2, 2, 4, 12, 300, 0, 10350, 10350, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 10350, NULL, NULL, '2022-08-15 09:50:47', '2022-09-30 14:50:07'),
(548, '095903', 1, 4, 347, 2, 2, 2, 2, 60, 0, 2205, 2205, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-08-15 09:59:03', '2022-08-15 09:59:03'),
(549, '043938', 1, 4, 348, 2, 2, 1, 2, 60, 0, 3500, 3500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3500, NULL, NULL, '2022-08-17 16:39:38', '2022-08-20 14:47:37'),
(550, '092619', 1, 4, 349, 2, 2, 1, 1, 0, 0, 2500, 2500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 2500, NULL, NULL, '2022-08-18 09:26:19', '2022-11-18 17:24:32'),
(551, '023906', 1, 4, 151, 2, 2, 1, 2, 0, 0, 5000, 5000, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 5000, NULL, NULL, '2022-08-20 14:39:06', '2022-11-18 16:53:06'),
(552, '112526', 1, 4, 37, 2, 2, 2, 60, 1800, 0, 91812, 91812, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 43400, NULL, NULL, '2022-08-23 11:25:26', '2022-10-19 16:33:40'),
(554, '115239', 1, 4, 350, 2, 2, 3, 3, 0, 0, 5999, 5999, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 5999, NULL, NULL, '2022-08-23 11:52:39', '2022-11-18 17:24:53'),
(555, '115421', 1, 4, 351, 2, 2, 1, 3, 0, 0, 7500, 7500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7500, NULL, NULL, '2022-08-23 11:54:21', '2022-11-18 17:24:02'),
(556, '031229', 1, 4, 352, 2, 2, 1, 3, 0, 0, 7500, 7500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7500, NULL, NULL, '2022-08-23 15:12:29', '2022-11-18 17:23:38'),
(557, '041956', 1, 4, 353, 2, 2, 1, 1, 10, 0, 1035, 1035, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1035, NULL, NULL, '2022-08-23 16:19:56', '2022-11-18 17:14:47'),
(558, '041938', 1, 4, 354, 2, 2, 1, 1, 0, 0, 1194, 1194, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 1194, 'Daraz order', NULL, '2022-08-24 16:19:38', '2022-11-18 17:23:06'),
(560, '034408', 1, 4, 355, 2, 2, 3, 3, 0, 0, 4898, 4898, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 4898, NULL, NULL, '2022-08-25 15:44:08', '2022-11-18 16:40:20'),
(562, '045128', 1, 4, 20, 2, 2, 10, 63, 1764, 0, 63768.96, 63768.96, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 62347, NULL, NULL, '2022-08-26 16:51:28', '2022-11-18 15:21:48'),
(563, '101427', 1, 4, 356, 2, 2, 41, 152, 4612.15, 0, 147066.34, 147066.34, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 147066.34, NULL, NULL, '2022-08-27 10:14:27', '2022-11-18 17:22:34'),
(564, '122253', 1, 4, 398, 2, 2, 10, 154, 3900, 0, 139516.18, 139516.18, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-08-31 12:22:53', '2022-12-16 11:00:21'),
(565, '085754', 1, 4, 358, 2, 2, 8, 190, 8550, 0, 108220.76, 108220.76, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, 30000, NULL, NULL, '2022-09-03 08:57:54', '2022-11-11 15:32:02'),
(566, '090251', 1, 4, 33, 2, 2, 1, 1, 30, 0, 1400, 1400, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1400, NULL, NULL, '2022-09-03 09:02:51', '2022-11-18 16:52:53'),
(567, '090504', 1, 4, 359, 2, 2, 1, 2, 60, 0, 3500, 3500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 3500, NULL, NULL, '2022-09-03 09:05:04', '2022-09-03 09:05:04'),
(568, '025518', 1, 4, 360, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-05 14:55:18', '2022-11-18 16:51:17'),
(569, '025605', 1, 4, 361, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-05 14:56:05', '2022-11-18 17:15:08'),
(570, '043628', 1, 4, 2, 2, 2, 9, 54, 2430, 0, 35636.7, 35636.7, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 35636.7, NULL, NULL, '2022-09-05 16:36:28', '2022-10-15 11:59:16'),
(571, '091243', 1, 4, 363, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-06 09:12:43', '2022-11-18 17:15:24'),
(572, '090317', 1, 4, 151, 2, 2, 1, 3, 0, 0, 7500, 7500, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 7500, NULL, NULL, '2022-09-08 09:03:17', '2022-11-18 16:52:34'),
(573, '104032', 1, 4, 364, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 1749, NULL, NULL, '2022-09-08 10:40:32', '2022-11-18 17:21:27'),
(577, '025808', 1, 4, 371, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-12 14:58:08', '2022-11-18 17:15:41'),
(578, '090819', 1, 4, 358, 2, 2, 5, 58, 1624, 0, 72653.88, 72653.88, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 72653.88, NULL, NULL, '2022-09-13 09:08:19', '2022-11-18 15:21:13'),
(581, '101658', 1, 4, 374, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-13 10:16:58', '2022-11-18 17:15:54'),
(582, '101742', 1, 4, 373, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1749, NULL, NULL, '2022-09-13 10:17:42', '2022-11-18 17:16:14'),
(583, '112012', 1, 4, 308, 2, 2, 7, 118, 5310, 0, 112338.6, 112338.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 90000, NULL, NULL, '2022-09-14 11:20:12', '2022-12-01 17:12:48'),
(584, '111850', 1, 4, 377, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-09-17 11:18:50', '2022-11-18 17:21:47'),
(587, '092132', 1, 4, 379, 2, 2, 5, 5, 0, 0, 10049, 10049, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-09-28 09:21:32', '2022-09-28 09:21:32'),
(588, '103724', 1, 4, 37, 2, 2, 1, 12, 360, 0, 14691.6, 14691.6, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 14691.6, NULL, NULL, '2022-09-29 10:37:24', '2022-12-02 19:01:47'),
(589, '041241', 1, 4, 398, 2, 2, 23, 678, 20340, 0, 662392.5, 662392.5, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 2, NULL, NULL, NULL, NULL, '2022-09-30 16:12:41', '2022-12-16 10:52:09'),
(590, '012339', 1, 4, 380, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-03 13:23:39', '2022-11-18 17:16:29'),
(591, '123737', 1, 4, 381, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-04 12:37:37', '2022-11-18 17:16:47'),
(592, '123846', 1, 4, 382, 2, 2, 1, 1, 0, 0, 1749, 1749, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1749, NULL, NULL, '2022-10-04 12:38:46', '2022-11-18 17:17:00'),
(593, '093824', 1, 4, 383, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-11 09:38:24', '2022-11-18 17:22:03'),
(594, '104339', 1, 4, 151, 2, 2, 4, 4, 0, 0, 6298, 6298, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 6298, NULL, NULL, '2022-10-12 10:43:39', '2022-11-18 16:52:23'),
(595, '104917', 1, 4, 384, 2, 2, 21, 36, 0, 0, 63180, 63180, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 63180, NULL, NULL, '2022-10-12 10:49:17', '2022-11-18 17:20:58'),
(596, '094102', 1, 4, 151, 2, 2, 2, 3, 0, 0, 5749, 5749, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 5749, NULL, NULL, '2022-10-14 09:41:02', '2022-11-18 16:52:08'),
(599, '114502', 1, 4, 37, 2, 2, 8, 186, 0, 0, 184075, 184075, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 184075, NULL, NULL, '2022-10-17 11:45:02', '2022-10-19 16:32:33'),
(602, '091830', 1, 4, 386, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-19 09:18:30', '2022-11-18 17:17:10'),
(603, '093054', 1, 4, 387, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-19 09:30:54', '2022-11-18 17:17:23'),
(604, '044405', 1, 4, 358, 2, 2, 6, 40, 1200, 0, 49532, 49532, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 49532, NULL, NULL, '2022-10-19 16:44:05', '2022-12-01 17:16:18'),
(605, '011523', 1, 4, 388, 2, 2, 3, 3, 150, 0, 2449, 2449, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-10-20 13:15:23', '2022-10-20 13:15:23'),
(606, '011053', 1, 4, 389, 2, 2, 1, 24, 0, 0, 41976, 41976, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 41976, NULL, NULL, '2022-10-21 13:10:53', '2022-11-18 16:39:20'),
(607, '024602', 1, 4, 347, 2, 2, 1, 1, 30, 0, 980, 980, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-10-22 14:46:02', '2022-10-22 14:46:02'),
(608, '091412', 1, 4, 308, 2, 2, 4, 642, 38520, 0, 359263.2, 359263.2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 180000, NULL, NULL, '2022-10-26 09:14:12', '2022-11-07 10:53:55'),
(609, '110820', 1, 4, 390, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2022-10-26 11:08:20', '2022-11-18 17:17:45'),
(610, '030811', 1, 4, 391, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-10-27 15:08:11', '2022-10-27 15:08:11'),
(611, '021036', 1, 4, 392, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-10-31 14:10:36', '2022-10-31 14:10:36'),
(612, '124612', 1, 4, 37, 2, 2, 11, 360, 10800, 0, 359856, 359856, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 305556, NULL, NULL, '2022-11-01 12:46:12', '2022-12-02 19:02:43'),
(613, '010354', 1, 4, 393, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-11-01 13:03:54', '2022-11-01 13:03:54'),
(614, '112916', 1, 4, 394, 2, 2, 33, 732, 21960, 0, 730485, 730485, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 40000, NULL, NULL, '2022-11-02 11:29:16', '2022-12-13 14:22:31'),
(616, '012747', 1, 4, 243, 2, 2, 12, 144, 5760, 0, 166032, 166032, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-11-02 13:27:47', '2022-11-02 13:27:47'),
(617, '114917', 1, 4, 37, 2, 2, 3, 18, 540, 0, 9355.5, 9355.5, NULL, 0, 0, 0, NULL, NULL, 0, '0.00', 1, 4, NULL, 9355.5, NULL, NULL, '2022-11-03 11:49:17', '2022-12-02 19:01:27'),
(618, '012146', 1, 4, 395, 2, 2, 12, 12, 0, 0, 27177, 27177, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 27177, NULL, NULL, '2022-11-05 13:21:46', '2022-11-18 17:10:13'),
(619, '010525', 1, 4, 397, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-11-12 13:05:25', '2022-11-12 13:05:25'),
(620, '010616', 1, 4, 396, 2, 2, 1, 1, 0, 0, 1150, 1150, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '2022-11-12 13:06:16', '2022-11-12 13:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `SalesmanID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`SalesmanID`, `name`, `contact`, `email`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 'Ahmad', '123456', 'ahmad@email.com', '2022-12-16 05:48:03', '2022-12-16 05:48:03'),
(2, 'Ali', '3232223', 'ali@email.com', '2022-12-16 05:48:03', '2022-12-16 05:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `sticker`
--

CREATE TABLE `sticker` (
  `stickerid` int NOT NULL,
  `itemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `edate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(150) DEFAULT NULL,
  `TRN` varchar(75) DEFAULT NULL COMMENT 'tax regsitration no',
  `Address` varchar(75) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
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
(2213, 'DD', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-04-11 06:55:00'),
(2214, 'c;', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:40:37'),
(2215, 'adfqcacx', 'asasfqaxx', 'ZXasxad', 'qdasdax', 'axaaxaxax', 'xadasxa', 'xaxdax', 'Yes', 131654, '2023-05-05 10:41:02'),
(2216, ';svmv;m; lm', 'svs', NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:46:00'),
(2217, ';svmv;m; lm', 'svsv/', NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:46:00'),
(2218, ';svmv;m; lm', 'svsv/s/v', NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2023-05-05 10:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `SupplierCatID` int NOT NULL,
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
  `TaxID` int NOT NULL,
  `TaxPer` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Section` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Inclusive', 17, 1, '2021-09-02 19:15:07', '2021-09-02 19:15:07'),
(2, 'Exclusive', 17, 1, '2021-09-02 19:15:34', '2021-09-02 19:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int NOT NULL,
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
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `base_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `base_unit`, `child_unit`, `unit_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KG', 'Gram', '1000', '1', '2023-02-27 10:48:22', '2023-02-27 10:48:22'),
(2, 'Darzon', 'Quter', '3', '1', '2023-02-28 09:46:46', '2023-02-28 09:46:46'),
(3, 'Doz', 'Item', '12', '1', '2023-03-20 06:55:20', '2023-03-20 06:55:20'),
(4, 'PCs', 'PCs', '1', '1', '2023-04-18 12:25:53', '2023-04-18 12:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `FullName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `UserType` varchar(25) DEFAULT NULL,
  `Address` text,
  `Mobile` varchar(255) DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` varchar(5) DEFAULT 'N',
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FullName`, `Email`, `Password`, `UserType`, `Address`, `Mobile`, `WarehouseID`, `eDate`, `Active`, `isSuperAdmin`) VALUES
(1, 'Extensive Accounting', 'demo@extbooks.com', '123456', 'Admin', 'adress', '44564545645', 1, '2023-05-12 11:41:46', 'Yes', 0),
(14, 'Biller Staff', 'biller1@gmail.com', '123456', 'Biller', NULL, NULL, NULL, '2023-05-06 11:52:46', 'Yes', 0),
(15, 'Farhan Ahmad', 'admin', 'Eis@2021', 'Admin', NULL, NULL, NULL, '2023-05-05 10:59:04', 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `RoleId` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(10) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`RoleId`, `UserID`, `Table`, `Action`, `Allow`) VALUES
(4471, 1, 'Invoice', 'List', 'Y'),
(4472, 1, 'Invoice', 'Create', 'Y'),
(4473, 1, 'Invoice', 'Update', 'Y'),
(4474, 1, 'Invoice', 'Delete', 'Y'),
(4475, 1, 'Invoice', 'View', 'Y'),
(4476, 1, 'Invoice', 'PDF', 'Y'),
(4477, 1, 'Voucher', 'List', 'Y'),
(4478, 1, 'Voucher', 'Create', 'Y'),
(4479, 1, 'Voucher', 'Update', 'Y'),
(4480, 1, 'Voucher', 'Delete', 'Y'),
(4481, 1, 'Voucher', 'View', 'Y'),
(4482, 1, 'Petty Cash', 'List', 'Y'),
(4483, 1, 'Petty Cash', 'Create', 'Y'),
(4484, 1, 'Petty Cash', 'Update', 'Y'),
(4485, 1, 'Petty Cash', 'Delete', 'Y'),
(4486, 1, 'Petty Cash', 'View', 'Y'),
(4487, 1, 'Adjustment Balance', 'Create', 'Y'),
(4488, 1, 'Chart of Account', 'List / Create', 'Y'),
(4489, 1, 'Chart of Account', 'Update', 'Y'),
(4490, 1, 'Chart of Account', 'Delete', 'Y'),
(4491, 1, 'Item/Inventory', 'List / Create', 'Y'),
(4492, 1, 'Item/Inventory', 'Update', 'Y'),
(4493, 1, 'Item/Inventory', 'Delete', 'Y'),
(4494, 1, 'Party / Customers', 'List / Create', 'Y'),
(4495, 1, 'Party / Customers', 'Update', 'Y'),
(4496, 1, 'Party / Customers', 'Delete', 'Y'),
(4497, 1, 'Supplier', 'List / Create', 'Y'),
(4498, 1, 'Supplier', 'Update', 'Y'),
(4499, 1, 'Supplier', 'Delete', 'Y'),
(4500, 1, 'User', 'List / Create', 'Y'),
(4501, 1, 'User', 'Update', 'Y'),
(4502, 1, 'User', 'Delete', 'Y'),
(4503, 1, 'User Rights', 'Assign', 'Y'),
(4504, 1, 'Party Ledger', 'View', 'Y'),
(4505, 1, 'Party Ledger', 'PDF', 'Y'),
(4506, 1, 'Party Balance', 'View', 'Y'),
(4507, 1, 'Party Balance', 'PDF', 'Y'),
(4508, 1, 'Yearly Report', 'View', 'Y'),
(4509, 1, 'Yearly Report', 'PDF', 'Y'),
(4510, 1, 'Ageing Report', 'View', 'Y'),
(4511, 1, 'Ageing Report', 'PDF', 'Y'),
(4512, 1, 'Party Analysis', 'View', 'Y'),
(4513, 1, 'Party Analysis', 'PDF', 'Y'),
(4514, 1, 'Party List', 'View', 'Y'),
(4515, 1, 'Party List', 'PDF', 'Y'),
(4516, 1, 'Outstanding Invoices', 'View', 'Y'),
(4517, 1, 'Outstanding Invoices', 'PDF', 'Y'),
(4518, 1, 'Supplier Ledger', 'View', 'Y'),
(4519, 1, 'Supplier Ledger', 'PDF', 'Y'),
(4520, 1, 'Supplier Balance', 'View', 'Y'),
(4521, 1, 'Supplier Balance', 'PDF', 'Y'),
(4522, 1, 'Sale Invoice', 'View', 'Y'),
(4523, 1, 'Sale Invoice', 'PDF', 'Y'),
(4524, 1, 'Ticket Register', 'View', 'Y'),
(4525, 1, 'Ticket Register', 'PDF', 'Y'),
(4526, 1, 'Airline Summary', 'View', 'Y'),
(4527, 1, 'Airline Summary', 'PDF', 'Y'),
(4528, 1, 'Sale Man Report', 'View', 'Y'),
(4529, 1, 'Sale Man Report', 'PDF', 'Y'),
(4530, 1, 'Tax Report', 'View', 'Y'),
(4531, 1, 'Tax Report', 'PDF', 'Y'),
(4532, 1, 'Sales Report', 'View', 'Y'),
(4533, 1, 'Sales Report', 'PDF', 'Y'),
(4534, 1, 'Voucher Report', 'View', 'Y'),
(4535, 1, 'Voucher Report', 'PDF', 'Y'),
(4536, 1, 'Cash Book', 'View', 'Y'),
(4537, 1, 'Cash Book', 'PDF', 'Y'),
(4538, 1, 'Day Book', 'View', 'Y'),
(4539, 1, 'Day Book', 'PDF', 'Y'),
(4540, 1, 'General Ledger', 'View', 'Y'),
(4541, 1, 'General Ledger', 'PDF', 'Y'),
(4542, 1, 'Trial Balance', 'View', 'Y'),
(4543, 1, 'Trial Balance', 'PDF', 'Y'),
(4544, 1, 'Trial with Activity', 'View', 'Y'),
(4545, 1, 'Trial with Activity', 'PDF', 'Y'),
(4546, 1, 'Yearly Summary', 'View', 'Y'),
(4547, 1, 'Yearly Summary', 'PDF', 'Y'),
(4548, 1, 'Profit & Loss', 'View', 'Y'),
(4549, 1, 'Profit & Loss', 'PDF', 'Y'),
(4550, 1, 'Balance Sheet', 'View', 'Y'),
(4551, 1, 'Balance Sheet', 'PDF', 'Y'),
(4552, 1, 'Invoice Summary', 'View', 'Y'),
(4553, 1, 'Invoice Summary', 'PDF', 'Y'),
(4554, 1, 'Party Wise Sale', 'View', 'Y'),
(4555, 1, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_detail`
--

CREATE TABLE `voucher_detail` (
  `VoucherDetID` int NOT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `InvoiceNo` varchar(75) DEFAULT NULL,
  `RefNo` varchar(75) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_detail`
--

INSERT INTO `voucher_detail` (`VoucherDetID`, `VoucherMstID`, `Date`, `Voucher`, `ChOfAcc`, `PartyID`, `SupplierID`, `Narration`, `InvoiceNo`, `RefNo`, `Debit`, `Credit`) VALUES
(43, 7, '2023-05-05', 'JV23050001', 510104, 1, NULL, 'Discount allowed', NULL, NULL, 1265.00, NULL),
(44, 7, '2023-05-05', 'JV23050001', 110400, 1, NULL, 'Discount allowed', NULL, NULL, NULL, 1265.00);

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
  `VoucherMstID` int NOT NULL,
  `VoucherCodeID` int DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_master`
--

INSERT INTO `voucher_master` (`VoucherMstID`, `VoucherCodeID`, `Voucher`, `Date`, `Narration`) VALUES
(7, 7, 'JV23050001', '2023-05-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_type`
--

CREATE TABLE `voucher_type` (
  `VoucherTypeID` int NOT NULL,
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
,`Balance` double(22,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_detail` (
`ChallanDetailID` int
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`ChallanDate` date
,`ItemID` int
,`Qty` int
,`Rate` double(8,2)
,`TaxAmount` double(8,2)
,`TaxPer` double(8,2)
,`Discount` double(8,2)
,`Total` double(8,2)
,`ItemType` varchar(55)
,`ItemCode` varchar(255)
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
`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`PartyID` int
,`PartyName` text
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
,`InvoiceDueDays` int
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
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount_mini`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount_mini` (
`ChartOfAccountID` int
,`CODE` varchar(15)
,`ChartOfAccountName` varchar(75)
,`OpenDebit` int
,`OpenCredit` int
,`L1` int
,`L2` int
,`L3` int
,`Category` varchar(55)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_delivery_challan`
-- (See below for the actual view)
--
CREATE TABLE `v_delivery_challan` (
`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`PartyID` int
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`ChallanDate` date
,`ChallanType` varchar(25)
,`Total` double(8,2)
,`CustomerNotes` varchar(255)
,`TermAndCondition` varchar(255)
,`File` varchar(75)
,`UserID` int
,`PartyName` text
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`Active` varchar(3)
,`InvoiceDueDays` int
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
`EstimateDetailID` int
,`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`EstimateDate` date
,`ItemID` int
,`ItemName` varchar(55)
,`Qty` int
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
`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`PartyID` int
,`PartyName` text
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`EstimateDate` date
,`Total` double(8,2)
,`CustomerNotes` varchar(255)
,`TermAndCondition` varchar(255)
,`File` varchar(75)
,`UserID` int
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
,`InvoiceDueDays` int
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense`
-- (See below for the actual view)
--
CREATE TABLE `v_expense` (
`ExpenseMasterID` int
,`Date` date
,`Date1` varchar(10)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`SupplierID` int
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
,`Balance` double(22,2)
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
,`ExpenseDetailID` int
,`ExpenseMasterID` int
,`ChartOfAccountID` int
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
,`Balance` double(22,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory` (
`WarehouseID` int
,`WarehouseName` varchar(191)
,`ItemID` int
,`ItemName` varchar(55)
,`UnitName` varchar(10)
,`SaleReturn` decimal(32,0)
,`QtyIn` decimal(32,0)
,`QtyOut` decimal(32,0)
,`POSOut` decimal(32,0)
,`Balance` decimal(34,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory_detail` (
`ItemID` int
,`ItemName` varchar(55)
,`UnitName` varchar(10)
,`SaleReturn` bigint
,`QtyIn` bigint
,`QtyOut` bigint
,`WarehouseID` int
,`Date` date
,`InvoiceNo` varchar(10)
,`InvoiceMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_bal`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_bal` (
`PartyID` int
,`InvoiceMasterID` int
,`INVOICE` double(19,2)
,`PAID` double(19,2)
,`due` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_balance` (
`InvoiceMasterID` int
,`PartyID` int
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
`InvoiceMasterID` int
,`Date` date
,`UserID` int
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(22,2)
,`DueDate` date
,`PartyName` text
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`PartyID` int
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
,`InvoiceDueDays` int
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
,`InvoiceDetailID` int
,`InvoiceMasterID` int
,`ItemID` int
,`SupplierID` int
,`PartyID` int
,`Qty` int
,`Rate` double(8,2)
,`Total` double(50,2)
,`ItemCode` varchar(255)
,`ItemName` varchar(55)
,`Description` varchar(255)
,`TaxPer` double(8,2)
,`Tax` double(8,2)
,`InvoiceType` varchar(30)
,`Discount` double(8,2)
,`DiscountType` double(8,2)
,`DiscountAmountItem` double(10,2)
,`Gross` double(8,2)
,`PartyName` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master` (
`InvoiceMasterID` int
,`Date` date
,`UserID` int
,`WarehouseID` int
,`WarehouseName` varchar(191)
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(22,2)
,`DueDate` date
,`PartyName` text
,`Address` varchar(75)
,`Phone` varchar(25)
,`Email` varchar(25)
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`PartyID` int
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
,`InvoiceDueDays` int
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
`InvoiceMasterID` int
,`Date` date
,`UserID` int
,`WarehouseID` int
,`WarehouseName` varchar(191)
,`PaymentMode` varchar(25)
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(10,2)
,`DueDate` date
,`InvoiceNo` varchar(10)
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`PartyID` int
,`SubTotal` double(10,2)
,`DiscountPer` double(10,2)
,`DiscountAmount` double(10,2)
,`SupplierName` varchar(150)
,`Address` varchar(75)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int
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
`PartyID` int
,`BALANCE` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_balance` (
`InvoiceMasterID` int
,`Balance` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_detail` (
`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`SupplierID` int
,`Qty` int
,`Rate` double(8,2)
,`ItemName` varchar(55)
,`Gross` double(8,2)
,`Total` double(50,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_items_in_warehouse`
-- (See below for the actual view)
--
CREATE TABLE `v_items_in_warehouse` (
`ItemID` int
,`ItemName` varchar(55)
,`ItemCode` varchar(255)
,`CostPrice` double(8,2)
,`SellingPrice` double(8,2)
,`warehouse_id` int
,`qty` double
,`ItemImage` varchar(255)
,`ItemCategoryID` int
,`ItemType` varchar(55)
,`IsActive` tinyint(1)
,`IsFeatured` tinyint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal`
-- (See below for the actual view)
--
CREATE TABLE `v_journal` (
`VHNO` varchar(15)
,`JournalType` varchar(10)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`SupplierID` int
,`VoucherMstID` int
,`PettyMstID` int
,`InvoiceMasterID` int
,`Date` date
,`Dr` double(10,2)
,`Cr` double(10,2)
,`PartyID` int
,`Narration` varchar(255)
,`L1` int
,`L2` int
,`L3` int
,`CODE` varchar(15)
,`Trace` decimal(10,0)
,`BankReconcile` varchar(15)
,`ReconcileDate` timestamp
,`JournalID` int
,`Category` varchar(55)
,`ExpenseMasterID` int
,`PaymentMasterID` int
,`PurchasePaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal_report`
-- (See below for the actual view)
--
CREATE TABLE `v_journal_report` (
`InvoiceMasterID` int
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
`PartyID` int
,`PartyName` text
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Date` date
,`DueDate` date
,`WalkinCustomerName` varchar(155)
,`SupplierID` int
,`ReferenceNo` varchar(35)
,`UserID` int
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
`PartyID` int
,`age7Days` double(19,2)
,`age15Days` double(19,2)
,`age30Days` double(19,2)
,`age60Days` double(19,2)
,`age90Days` double(19,2)
,`age90plusDays` double(19,2)
,`Total` double(19,2)
,`PartyName` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_balance` (
`VHNO` varchar(15)
,`JournalType` varchar(10)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`SupplierID` int
,`VoucherMstID` int
,`PettyMstID` int
,`InvoiceMasterID` int
,`Date` date
,`Dr` double(10,2)
,`Cr` double(10,2)
,`PartyID` int
,`Narration` varchar(255)
,`PartyName` text
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
,`Balance` double(22,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_payment` (
`PaymentMasterID` int
,`PartyID` int
,`PartyName` text
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int
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
,`InvoiceDueDays` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_detail` (
`InvoiceNo` varchar(10)
,`PaymentDetailID` int
,`PaymentMasterID` int
,`PaymentDate` date
,`InvoiceMasterID` int
,`Payment` double(8,2)
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_summary` (
`InvoiceMasterID` int
,`Paid` double(19,2)
,`PaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pettycash_master`
-- (See below for the actual view)
--
CREATE TABLE `v_pettycash_master` (
`PettyMstID` int
,`PettyVoucher` varchar(11)
,`ChartOfAccountID` int
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
`PurchaseOrderDetailID` int
,`PurchaseOrderMasterID` int
,`Date` date
,`ItemID` int
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
`PurchaseOrderMasterID` int
,`PON` varchar(10)
,`SupplierID` int
,`Date` date
,`PONotes` varchar(255)
,`UserID` int
,`Subject` varchar(255)
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int
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
`PurchasePaymentMasterID` int
,`SupplierID` int
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int
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
`PurchasePaymentMasterID` int
,`SupplierID` int
,`PaymentDate` date
,`PaymentAmount` double(8,2)
,`PaymentMode` varchar(25)
,`ChartOfAccountID` int
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
`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Date` date
,`ReferenceNo` varchar(35)
,`InvoiceDetailID` int
,`ItemID` int
,`Qty` int
,`Total` double(10,2)
,`Paid` double(10,2)
,`Balance` double(10,2)
,`PartyName` text
,`Address` varchar(75)
,`PartyID` int
,`SubTotal` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp` (
`Rev` double(22,2)
,`Exp` int
,`DATE_FORMAT(date,'%M-%Y')` varchar(69)
,`date_format(``v_journal``.``Date``,'%m-%Y')` varchar(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp_chart` (
`Rev` double
,`Exp` decimal(33,0)
,`MonthName` varchar(69)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sticker`
-- (See below for the actual view)
--
CREATE TABLE `v_sticker` (
`qty` decimal(32,0)
,`name` varchar(55)
,`price` double(8,2)
,`code` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier` (
`SupplierID` int
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Address` varchar(75)
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`Email` varchar(150)
,`Website` varchar(150)
,`Active` varchar(3)
,`InvoiceDueDays` int
,`eDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_balance` (
`SupplierID` int
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
`InvoiceMasterID` int
,`PartyID` int
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`InvoiceNo` varchar(10)
,`Date` date
,`DueDate` date
,`PAID` double(19,2)
,`BALANCE` double(22,2)
,`SupplierID` int
,`GrandTotal` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_over_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_over_balance` (
`SupplierID` int
,`BALANCE` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_test`
-- (See below for the actual view)
--
CREATE TABLE `v_test` (
`ItemID` int
,`ItemName` varchar(55)
,`T1` int
,`InvoiceMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial`
-- (See below for the actual view)
--
CREATE TABLE `v_trial` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trialreport`
-- (See below for the actual view)
--
CREATE TABLE `v_trialreport` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Dr` double(19,2)
,`Cr` double(19,2)
,`Balance` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_trial_balance` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Dr` double(22,2)
,`Cr` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher` (
`VoucherMstID` int
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
`VoucherMstID` int
,`VoucherCodeID` int
,`Voucher` varchar(15)
,`NarrationMaster` varchar(255)
,`Date` date
,`ChOfAcc` int
,`ChartOfAccountName` varchar(75)
,`Debit` double(10,2)
,`Credit` double(10,2)
,`InvoiceNo` varchar(75)
,`Narration` varchar(255)
,`SupplierID` int
,`PartyID` int
,`RefNo` varchar(75)
,`PartyName` text
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_master`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_master` (
`VoucherMstID` int
,`VoucherCodeID` int
,`Voucher` varchar(15)
,`Date` date
,`Narration` varchar(255)
,`VoucherTypeID` int
,`VoucherCode` varchar(35)
,`VoucherTypeName` varchar(35)
,`PartyID` int
,`PartyName` text
,`Debit` double(10,2)
,`Credit` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_warehouse_stock_transfer`
-- (See below for the actual view)
--
CREATE TABLE `v_warehouse_stock_transfer` (
`InvoiceMasterID` int
,`WarehouseID` int
,`WarehouseName` varchar(191)
,`otherWareHouse` varchar(191)
,`Date` date
,`UserID` int
,`PaymentMode` varchar(25)
,`InvoiceNo` varchar(10)
,`TotalQty` double
,`CustomerNotes` varchar(255)
,`Subject` varchar(255)
,`WalkinCustomerName` varchar(155)
,`DescriptionNotes` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`WarehouseID`, `name`) VALUES
(1, 'WareHouse 1'),
(2, 'WareHouse 2'),
(3, 'WareHouse 3');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ali Electronic Store', '0544235265', 'warehouse1@example.com', 'Main Bazar Dina', 1, '2021-08-28 23:02:47', '2021-09-12 22:06:00'),
(2, 'ShahCorporation', '0544-272224', 'sales@shahcorporationltd.com', 'Shah Corporation Building Kala Gujran Phatak GTRoad Jhelum', 1, '2021-09-12 22:15:24', '2022-03-02 12:03:59'),
(3, 'Consiment 2', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:29:06', '2023-05-02 10:50:07'),
(4, 'Container 3', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:35:49', '2022-06-15 09:05:20'),
(5, 'Container 4', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:36:23', '2022-06-15 09:05:33'),
(6, 'test abc', '033234235', 'test@testabc.com', 'abc address test', 1, '2023-01-18 02:47:30', '2023-01-18 05:08:56'),
(7, 'Branch 2', '03339322880', 'mr.elahi.ehsan@gmail.com', 'Address Line 1\r\nAddress Line 2', 1, '2023-05-12 01:51:50', '2023-05-12 01:51:50');

-- --------------------------------------------------------

--
-- Structure for view `v_cashflow`
--
DROP TABLE IF EXISTS `v_cashflow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cashflow`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y') ORDER BY date_format(`journal`.`Date`,'%b-%Y') ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_detail`
--
DROP TABLE IF EXISTS `v_challan_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_challan_detail`  AS SELECT `challan_detail`.`ChallanDetailID` AS `ChallanDetailID`, `challan_detail`.`ChallanMasterID` AS `ChallanMasterID`, `challan_detail`.`ChallanNo` AS `ChallanNo`, `challan_detail`.`ChallanDate` AS `ChallanDate`, `challan_detail`.`ItemID` AS `ItemID`, `challan_detail`.`Qty` AS `Qty`, `challan_detail`.`Rate` AS `Rate`, `challan_detail`.`TaxAmount` AS `TaxAmount`, `challan_detail`.`TaxPer` AS `TaxPer`, `challan_detail`.`Discount` AS `Discount`, `challan_detail`.`Total` AS `Total`, `item`.`ItemType` AS `ItemType`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, `challan_detail`.`Description` AS `Description` FROM (`challan_detail` join `item` on((`challan_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_master`
--
DROP TABLE IF EXISTS `v_challan_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_challan_master`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, date_format(`challan_master`.`ChallanDate`,'%d/%m/%Y') AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount`
--
DROP TABLE IF EXISTS `v_chartofaccount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chartofaccount`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`CODE` AS `CODE` FROM `chartofaccount` WHERE ((right(`chartofaccount`.`ChartOfAccountID`,5) = 0) AND (`chartofaccount`.`ChartOfAccountName` is not null))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount_mini`
--
DROP TABLE IF EXISTS `v_chartofaccount_mini`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chartofaccount_mini`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`OpenDebit` AS `OpenDebit`, `chartofaccount`.`OpenCredit` AS `OpenCredit`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`Category` AS `Category` FROM `chartofaccount` WHERE (`chartofaccount`.`Category` in ('CASH','CARD','BANK','AR'))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_delivery_challan`
--
DROP TABLE IF EXISTS `v_delivery_challan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_delivery_challan`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, `challan_master`.`ChallanDate` AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `challan_master`.`UserID` AS `UserID`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal`, `challan_master`.`Paid` AS `Paid`, `challan_master`.`Balance` AS `Balance` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_detail`
--
DROP TABLE IF EXISTS `v_estimate_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estimate_detail`  AS SELECT `estimate_detail`.`EstimateDetailID` AS `EstimateDetailID`, `estimate_detail`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_detail`.`EstimateNo` AS `EstimateNo`, `estimate_detail`.`EstimateDate` AS `EstimateDate`, `estimate_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `estimate_detail`.`Qty` AS `Qty`, `estimate_detail`.`Rate` AS `Rate`, `estimate_detail`.`Total` AS `Total`, `estimate_detail`.`Description` AS `Description`, `estimate_detail`.`TaxPer` AS `TaxPer`, `estimate_detail`.`Tax` AS `Tax` FROM (`estimate_detail` join `item` on((`estimate_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_master`
--
DROP TABLE IF EXISTS `v_estimate_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estimate_master`  AS SELECT `estimate_master`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_master`.`EstimateNo` AS `EstimateNo`, `estimate_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `estimate_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `estimate_master`.`ReferenceNo` AS `ReferenceNo`, `estimate_master`.`EstimateDate` AS `EstimateDate`, `estimate_master`.`Total` AS `Total`, `estimate_master`.`CustomerNotes` AS `CustomerNotes`, `estimate_master`.`TermAndCondition` AS `TermAndCondition`, `estimate_master`.`File` AS `File`, `estimate_master`.`UserID` AS `UserID`, `estimate_master`.`Subject` AS `Subject`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `estimate_master`.`Date` AS `Date`, `estimate_master`.`SubTotal` AS `SubTotal`, `estimate_master`.`TaxPer` AS `TaxPer`, `estimate_master`.`Tax` AS `Tax`, `estimate_master`.`DiscountPer` AS `DiscountPer`, `estimate_master`.`Discount` AS `Discount`, `estimate_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `estimate_master`.`Shipping` AS `Shipping`, `estimate_master`.`DescriptionNotes` AS `DescriptionNotes`, `estimate_master`.`ExpiryDate` AS `ExpiryDate`, `estimate_master`.`GrandTotal` AS `GrandTotal`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate` FROM (`estimate_master` join `party` on((`estimate_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense`
--
DROP TABLE IF EXISTS `v_expense`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense`  AS SELECT `expense_master`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_master`.`Date` AS `Date`, date_format(`expense_master`.`Date`,'%d-%m-%Y') AS `Date1`, `expense_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_chart`
--
DROP TABLE IF EXISTS `v_expense_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_chart`  AS SELECT date_format(`v_journal`.`Date`,'%M-%Y') AS `MonthName`, (sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`)) - sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`))) AS `Balance`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'E') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), `v_journal`.`ChartOfAccountName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_detail`
--
DROP TABLE IF EXISTS `v_expense_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_detail`  AS SELECT `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`Date` AS `Date`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_detail`.`ExpenseDetailID` AS `ExpenseDetailID`, `expense_detail`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_detail`.`ChartOfAccountID` AS `ChartOfAccountID`, `expense_detail`.`Notes` AS `Notes`, `expense_detail`.`TaxPer` AS `TaxPer`, `expense_detail`.`Tax` AS `Tax`, `expense_detail`.`Amount` AS `Amount` FROM ((`expense_detail` join `expense_master` on((`expense_master`.`ExpenseMasterID` = `expense_detail`.`ExpenseMasterID`))) join `chartofaccount` on((`expense_detail`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_master`
--
DROP TABLE IF EXISTS `v_expense_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_master`  AS SELECT `expense_master`.`Date` AS `Date`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_income_exp_chart`
--
DROP TABLE IF EXISTS `v_income_exp_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_income_exp_chart`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory`
--
DROP TABLE IF EXISTS `v_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventory`  AS SELECT `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, sum(if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0)) AS `SaleReturn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0)) AS `QtyIn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0)) AS `QtyOut`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'POS'),`invoice_detail`.`Qty`,0)) AS `POSOut`, (sum((if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0) + if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0))) - (sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0)) + sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'POS'),`invoice_detail`.`Qty`,0)))) AS `Balance` FROM (((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_detail`.`InvoiceMasterID` = `invoice_master`.`InvoiceMasterID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) GROUP BY `invoice_detail`.`ItemID`, `item`.`ItemName`, `item`.`UnitName`, `invoice_master`.`WarehouseID`, `warehouses`.`name`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory_detail`
--
DROP TABLE IF EXISTS `v_inventory_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventory_detail`  AS SELECT `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0) AS `SaleReturn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL') or (left(`invoice_detail`.`InvoiceNo`,3) = 'Win')),`invoice_detail`.`Qty`,0) AS `QtyIn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX') or (left(`invoice_detail`.`InvoiceNo`,3) = 'POS') or (left(`invoice_detail`.`InvoiceNo`,4) = 'Wout')),`invoice_detail`.`Qty`,0) AS `QtyOut`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_bal`
--
DROP TABLE IF EXISTS `v_invoice_bal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_bal`  AS SELECT `journal`.`PartyID` AS `PartyID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(ifnull(`journal`.`Dr`,0)) AS `INVOICE`, sum(ifnull(`journal`.`Cr`,0)) AS `PAID`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `due` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 110400) GROUP BY `journal`.`PartyID`, `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_balance`
--
DROP TABLE IF EXISTS `v_invoice_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_balance`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_invoice_bal`.`PartyID` AS `PartyID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `v_invoice_bal`.`INVOICE` AS `INVOICE`, `v_invoice_bal`.`PAID` AS `PAID`, `v_invoice_bal`.`due` AS `BALANCE`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`ReferenceNo` AS `ReferenceNo` FROM (`invoice_master` join `v_invoice_bal` on((`invoice_master`.`InvoiceMasterID` = `v_invoice_bal`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_both`
--
DROP TABLE IF EXISTS `v_invoice_both`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_both`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `supplier`.`SupplierName` AS `SupplierName` FROM (((`invoice_master` left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) left join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_detail`
--
DROP TABLE IF EXISTS `v_invoice_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_detail`  AS SELECT `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`PartyID` AS `PartyID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `invoice_detail`.`Total` AS `Total`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Description` AS `Description`, `invoice_detail`.`TaxPer` AS `TaxPer`, `invoice_detail`.`Tax` AS `Tax`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_detail`.`Discount` AS `Discount`, `invoice_detail`.`DiscountType` AS `DiscountType`, `invoice_detail`.`DiscountAmountItem` AS `DiscountAmountItem`, `invoice_detail`.`Gross` AS `Gross`, `party`.`PartyName` AS `PartyName` FROM (((`invoice_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master`
--
DROP TABLE IF EXISTS `v_invoice_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_master`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `invoice_master`.`TaxType` AS `TaxType` FROM (((`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master_supplier`
--
DROP TABLE IF EXISTS `v_invoice_master_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_master_supplier`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`TaxPer` AS `TaxPer`, `supplier`.`TRN` AS `TRN` FROM ((`invoice_master` join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_party_balance`
--
DROP TABLE IF EXISTS `v_invoice_party_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_party_balance`  AS SELECT `v_invoice_balance`.`PartyID` AS `PartyID`, sum(`v_invoice_balance`.`BALANCE`) AS `BALANCE` FROM `v_invoice_balance` GROUP BY `v_invoice_balance`.`PartyID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_balance`
--
DROP TABLE IF EXISTS `v_inv_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inv_balance`  AS SELECT `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`journal`.`Dr`) AS `Balance` FROM `journal` WHERE (left(`journal`.`VHNO`,3) = 'PAY') GROUP BY `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_detail`
--
DROP TABLE IF EXISTS `v_inv_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inv_detail`  AS SELECT `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Gross` AS `Gross`, `invoice_detail`.`Total` AS `Total` FROM (`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_items_in_warehouse`
--
DROP TABLE IF EXISTS `v_items_in_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_items_in_warehouse`  AS SELECT `i`.`ItemID` AS `ItemID`, `i`.`ItemName` AS `ItemName`, `i`.`ItemCode` AS `ItemCode`, `i`.`CostPrice` AS `CostPrice`, `i`.`SellingPrice` AS `SellingPrice`, `pw`.`warehouse_id` AS `warehouse_id`, `pw`.`qty` AS `qty`, `i`.`ItemImage` AS `ItemImage`, `i`.`ItemCategoryID` AS `ItemCategoryID`, `i`.`ItemType` AS `ItemType`, `i`.`IsActive` AS `IsActive`, `i`.`IsFeatured` AS `IsFeatured` FROM (`item` `i` join `product_warehouse` `pw` on((`i`.`ItemID` = `pw`.`product_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal`
--
DROP TABLE IF EXISTS `v_journal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_journal`  AS SELECT `journal`.`VHNO` AS `VHNO`, `journal`.`JournalType` AS `JournalType`, `journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `journal`.`SupplierID` AS `SupplierID`, `journal`.`VoucherMstID` AS `VoucherMstID`, `journal`.`PettyMstID` AS `PettyMstID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `journal`.`Date` AS `Date`, `journal`.`Dr` AS `Dr`, `journal`.`Cr` AS `Cr`, `journal`.`PartyID` AS `PartyID`, `journal`.`Narration` AS `Narration`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`CODE` AS `CODE`, `journal`.`Trace` AS `Trace`, `journal`.`BankReconcile` AS `BankReconcile`, `journal`.`ReconcileDate` AS `ReconcileDate`, `journal`.`JournalID` AS `JournalID`, `chartofaccount`.`Category` AS `Category`, `journal`.`ExpenseMasterID` AS `ExpenseMasterID`, `journal`.`PaymentMasterID` AS `PaymentMasterID`, `journal`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID` FROM (`chartofaccount` join `journal` on((`chartofaccount`.`ChartOfAccountID` = `journal`.`ChartOfAccountID`))) ORDER BY `journal`.`JournalID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal_report`
--
DROP TABLE IF EXISTS `v_journal_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_journal_report`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, 'INVOICE' AS `INVOICE` FROM `invoice_master`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_partywise_sale`
--
DROP TABLE IF EXISTS `v_partywise_sale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_partywise_sale`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_aging`
--
DROP TABLE IF EXISTS `v_party_aging`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_aging`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 1 and 7),`invoice_master`.`GrandTotal`,0)) AS `age7Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 8 and 16),`invoice_master`.`GrandTotal`,0)) AS `age15Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 17 and 30),`invoice_master`.`GrandTotal`,0)) AS `age30Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 31 and 60),`invoice_master`.`GrandTotal`,0)) AS `age60Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 61 and 90),`invoice_master`.`GrandTotal`,0)) AS `age90Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 90),`invoice_master`.`GrandTotal`,0)) AS `age90plusDays`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 0),`invoice_master`.`GrandTotal`,0)) AS `Total`, `party`.`PartyName` AS `PartyName` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) WHERE (`invoice_master`.`Paid` = 0) GROUP BY `invoice_master`.`PartyID`, `party`.`PartyName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_balance`
--
DROP TABLE IF EXISTS `v_party_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_balance`  AS SELECT `v_journal`.`VHNO` AS `VHNO`, `v_journal`.`JournalType` AS `JournalType`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `v_journal`.`SupplierID` AS `SupplierID`, `v_journal`.`VoucherMstID` AS `VoucherMstID`, `v_journal`.`PettyMstID` AS `PettyMstID`, `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`Date` AS `Date`, `v_journal`.`Dr` AS `Dr`, `v_journal`.`Cr` AS `Cr`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`Narration` AS `Narration`, `party`.`PartyName` AS `PartyName` FROM (`v_journal` join `party` on((`v_journal`.`PartyID` = `party`.`PartyID`))) WHERE (`v_journal`.`ChartOfAccountID` = 110400)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_montly_balance`
--
DROP TABLE IF EXISTS `v_party_montly_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_party_montly_balance`  AS SELECT date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, `journal`.`PartyID` AS `PartyID` FROM `journal` WHERE ((`journal`.`ChartOfAccountID` = 110400) AND (`journal`.`PartyID` is not null)) GROUP BY `journal`.`PartyID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment`
--
DROP TABLE IF EXISTS `v_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment`  AS SELECT `payment_master`.`PaymentMasterID` AS `PaymentMasterID`, `payment_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `payment_master`.`PaymentDate` AS `PaymentDate`, `payment_master`.`PaymentAmount` AS `PaymentAmount`, `payment_master`.`PaymentMode` AS `PaymentMode`, `payment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `payment_master`.`ReferenceNo` AS `ReferenceNo`, `payment_master`.`File` AS `File`, `payment_master`.`Notes` AS `Notes`, `payment_master`.`eDate` AS `eDate`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays` FROM (`payment_master` join `party` on((`payment_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_detail`
--
DROP TABLE IF EXISTS `v_payment_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment_detail`  AS SELECT `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `payment_detail`.`PaymentDetailID` AS `PaymentDetailID`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID`, `payment_detail`.`PaymentDate` AS `PaymentDate`, `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `payment_detail`.`Payment` AS `Payment`, `payment_detail`.`eDate` AS `eDate` FROM (`payment_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `payment_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_summary`
--
DROP TABLE IF EXISTS `v_payment_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment_summary`  AS SELECT `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`payment_detail`.`Payment`) AS `Paid`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID` FROM `payment_detail` GROUP BY `payment_detail`.`InvoiceMasterID`, `payment_detail`.`PaymentMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pettycash_master`
--
DROP TABLE IF EXISTS `v_pettycash_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pettycash_master`  AS SELECT `pettycash_master`.`PettyMstID` AS `PettyMstID`, `pettycash_master`.`PettyVoucher` AS `PettyVoucher`, `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `pettycash_master`.`Date` AS `Date`, `pettycash_master`.`Narration` AS `Narration`, `pettycash_master`.`Credit` AS `Credit` FROM (`chartofaccount` join `pettycash_master` on((`chartofaccount`.`ChartOfAccountID` = `pettycash_master`.`ChOfAcc`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_detail`
--
DROP TABLE IF EXISTS `v_purchase_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_order_detail`  AS SELECT `purchase_order_detail`.`PurchaseOrderDetailID` AS `PurchaseOrderDetailID`, `purchase_order_detail`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_detail`.`Date` AS `Date`, `purchase_order_detail`.`ItemID` AS `ItemID`, `purchase_order_detail`.`Description` AS `Description`, `purchase_order_detail`.`Rate` AS `Rate`, `purchase_order_detail`.`Qty` AS `Qty`, `purchase_order_detail`.`Unit` AS `Unit`, `purchase_order_detail`.`DiscountPer` AS `DiscountPer`, `purchase_order_detail`.`Discount` AS `Discount`, `purchase_order_detail`.`Tax` AS `Tax`, `purchase_order_detail`.`TaxPer` AS `TaxPer`, `purchase_order_detail`.`Amount` AS `Amount`, `purchase_order_detail`.`Remarks` AS `Remarks`, `item`.`ItemName` AS `ItemName` FROM (`purchase_order_detail` join `item` on((`purchase_order_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_master`
--
DROP TABLE IF EXISTS `v_purchase_order_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_order_master`  AS SELECT `purchase_order_master`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_master`.`PON` AS `PON`, `purchase_order_master`.`SupplierID` AS `SupplierID`, `purchase_order_master`.`Date` AS `Date`, `purchase_order_master`.`PONotes` AS `PONotes`, `purchase_order_master`.`UserID` AS `UserID`, `purchase_order_master`.`Subject` AS `Subject`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `purchase_order_master`.`ReferenceNo` AS `ReferenceNo`, `purchase_order_master`.`Tax` AS `Tax`, `purchase_order_master`.`GrandTotal` AS `GrandTotal`, `purchase_order_master`.`eDate` AS `eDate`, `purchase_order_master`.`DeliveryDate` AS `DeliveryDate`, `purchase_order_master`.`DeliveryNotes` AS `DeliveryNotes`, `purchase_order_master`.`SubTotal` AS `SubTotal`, `purchase_order_master`.`Discount` AS `Discount`, `purchase_order_master`.`DiscountPer` AS `DiscountPer` FROM (`purchase_order_master` join `supplier` on((`purchase_order_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment`
--
DROP TABLE IF EXISTS `v_purchase_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_payment`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment_master`
--
DROP TABLE IF EXISTS `v_purchase_payment_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase_payment_master`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_receivabledetail`
--
DROP TABLE IF EXISTS `v_receivabledetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_receivabledetail`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal` FROM ((`invoice_master` join `invoice_detail` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp`
--
DROP TABLE IF EXISTS `v_rev_exp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rev_exp`  AS SELECT (sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`)) - sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`))) AS `Rev`, 0 AS `Exp`, date_format(`v_journal`.`Date`,'%M-%Y') AS `DATE_FORMAT(date,'%M-%Y')`, date_format(`v_journal`.`Date`,'%m-%Y') AS `date_format(``v_journal``.``Date``,'%m-%Y')` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'r') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), date_format(`v_journal`.`Date`,'%m-%Y'), `v_journal`.`CODE`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp_chart`
--
DROP TABLE IF EXISTS `v_rev_exp_chart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rev_exp_chart`  AS SELECT abs(round(sum(`v_rev_exp`.`Rev`),0)) AS `Rev`, abs(round(sum(`v_rev_exp`.`Exp`),0)) AS `Exp`, `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` AS `MonthName` FROM `v_rev_exp` GROUP BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ORDER BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_sticker`
--
DROP TABLE IF EXISTS `v_sticker`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sticker`  AS SELECT sum(`sticker`.`qty`) AS `qty`, `item`.`ItemName` AS `name`, `item`.`SellingPrice` AS `price`, `item`.`ItemID` AS `code` FROM (`sticker` join `item` on((`sticker`.`itemid` = `item`.`ItemID`))) GROUP BY `sticker`.`itemid`, `item`.`ItemName`, `item`.`SellingPrice`, `item`.`ItemID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier`
--
DROP TABLE IF EXISTS `v_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier`  AS SELECT `supplier`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `supplier`.`eDate` AS `eDate` FROM `supplier`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_balance`
--
DROP TABLE IF EXISTS `v_supplier_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_balance`  AS SELECT `journal`.`SupplierID` AS `SupplierID`, date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(if((`journal`.`Dr` is null),0,`journal`.`Dr`)) AS `Dr`, sum(if((`journal`.`Cr` is null),0,`journal`.`Cr`)) AS `Cr`, sum((if((`journal`.`Dr` is null),0,`journal`.`Dr`) - if((`journal`.`Cr` is null),0,`journal`.`Cr`))) AS `Balance` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 210100) GROUP BY `journal`.`SupplierID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_outstanding`
--
DROP TABLE IF EXISTS `v_supplier_outstanding`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_outstanding`  AS SELECT `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, sum(ifnull(`v_journal`.`Dr`,0)) AS `PAID`, abs((sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0)))) AS `BALANCE`, `v_journal`.`SupplierID` AS `SupplierID`, `invoice_master`.`GrandTotal` AS `GrandTotal` FROM (`v_journal` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `v_journal`.`InvoiceMasterID`))) WHERE (((`v_journal`.`VHNO` like 'BILL%') OR (`v_journal`.`VHNO` like 'BILLPAY%')) AND (`v_journal`.`ChartOfAccountID` = 210100)) GROUP BY `v_journal`.`InvoiceMasterID`, `v_journal`.`PartyID`, `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName`, `invoice_master`.`InvoiceNo`, `invoice_master`.`Date`, `invoice_master`.`DueDate`, `invoice_master`.`GrandTotal`, `v_journal`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_over_balance`
--
DROP TABLE IF EXISTS `v_supplier_over_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier_over_balance`  AS SELECT `v_supplier_outstanding`.`SupplierID` AS `SupplierID`, sum(`v_supplier_outstanding`.`BALANCE`) AS `BALANCE` FROM `v_supplier_outstanding` GROUP BY `v_supplier_outstanding`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_test`
--
DROP TABLE IF EXISTS `v_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_test`  AS SELECT `item`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`ItemID` AS `T1`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`item` join `invoice_detail` on((`item`.`ItemID` = `invoice_detail`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial`
--
DROP TABLE IF EXISTS `v_trial`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trial`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trialreport`
--
DROP TABLE IF EXISTS `v_trialreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trialreport`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial_balance`
--
DROP TABLE IF EXISTS `v_trial_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_trial_balance`  AS SELECT `v_trial`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_trial`.`ChartOfAccountName` AS `ChartOfAccountName`, if((`v_trial`.`Balance` >= 0),`v_trial`.`Balance`,0) AS `Dr`, if((`v_trial`.`Balance` < 0),abs(`v_trial`.`Balance`),0) AS `Cr` FROM `v_trial`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher`
--
DROP TABLE IF EXISTS `v_voucher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration` FROM (`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_detail`
--
DROP TABLE IF EXISTS `v_voucher_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher_detail`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Narration` AS `NarrationMaster`, `voucher_detail`.`Date` AS `Date`, `voucher_detail`.`ChOfAcc` AS `ChOfAcc`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit`, `voucher_detail`.`InvoiceNo` AS `InvoiceNo`, `voucher_detail`.`Narration` AS `Narration`, `voucher_detail`.`SupplierID` AS `SupplierID`, `voucher_detail`.`PartyID` AS `PartyID`, `voucher_detail`.`RefNo` AS `RefNo`, `party`.`PartyName` AS `PartyName`, `supplier`.`SupplierName` AS `SupplierName` FROM ((((`voucher_detail` join `voucher_master` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `chartofaccount` on((`chartofaccount`.`ChartOfAccountID` = `voucher_detail`.`ChOfAcc`))) left join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) left join `supplier` on((`voucher_detail`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_master`
--
DROP TABLE IF EXISTS `v_voucher_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher_master`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration`, `voucher_type`.`VoucherTypeID` AS `VoucherTypeID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_detail`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit` FROM (((`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) join `voucher_detail` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_warehouse_stock_transfer`
--
DROP TABLE IF EXISTS `v_warehouse_stock_transfer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_warehouse_stock_transfer`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `w`.`name` AS `otherWareHouse`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`TotalQty` AS `TotalQty`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes` FROM ((`invoice_master` join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) join `warehouses` `w` on((`w`.`id` = `invoice_master`.`otherWareHouseID`))) WHERE ((`invoice_master`.`InvoiceNo` like 'WIN%') OR (`invoice_master`.`InvoiceNo` like 'WOUT%')) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

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
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchID`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_images`
--
ALTER TABLE `dish_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_recipes`
--
ALTER TABLE `dish_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_tables`
--
ALTER TABLE `dish_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_types`
--
ALTER TABLE `dish_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `invoice_detail_ssss`
--
ALTER TABLE `invoice_detail_ssss`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `invoice_dish_details`
--
ALTER TABLE `invoice_dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `invoice_master_ssss`
--
ALTER TABLE `invoice_master_ssss`
  ADD PRIMARY KEY (`InvoiceMasterID`);

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
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`ItemCategoryID`);

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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`);

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
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
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
-- Indexes for table `sticker`
--
ALTER TABLE `sticker`
  ADD PRIMARY KEY (`stickerid`);

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
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `AirLineID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `AttachmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_master`
--
ALTER TABLE `bill_master`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `challan_detail`
--
ALTER TABLE `challan_detail`
  MODIFY `ChallanDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_master`
--
ALTER TABLE `challan_master`
  MODIFY `ChallanMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dish_images`
--
ALTER TABLE `dish_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dish_recipes`
--
ALTER TABLE `dish_recipes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dish_tables`
--
ALTER TABLE `dish_tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dish_types`
--
ALTER TABLE `dish_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `estimate_master`
--
ALTER TABLE `estimate_master`
  MODIFY `EstimateMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `invoice_detail_ssss`
--
ALTER TABLE `invoice_detail_ssss`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_dish_details`
--
ALTER TABLE `invoice_dish_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `invoice_master_ssss`
--
ALTER TABLE `invoice_master_ssss`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_type`
--
ALTER TABLE `invoice_type`
  MODIFY `InvoiceTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `ItemCategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item__`
--
ALTER TABLE `item__`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `party`
--
ALTER TABLE `party`
  MODIFY `PartyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2219;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `PaymentDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `PaymentMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  MODIFY `PettyDetID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  MODIFY `PettyMstID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  MODIFY `PurchasePaymentDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  MODIFY `PurchasePaymentMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  MODIFY `PurchaseOrderDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  MODIFY `PurchaseOrderMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sticker`
--
ALTER TABLE `sticker`
  MODIFY `stickerid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2219;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `SupplierCatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `TaxID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `UnitID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4556;

--
-- AUTO_INCREMENT for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  MODIFY `VoucherDetID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `voucher_master`
--
ALTER TABLE `voucher_master`
  MODIFY `VoucherMstID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `voucher_type`
--
ALTER TABLE `voucher_type`
  MODIFY `VoucherTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
