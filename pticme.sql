-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2021 at 04:37 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pticme`
--

-- --------------------------------------------------------

--
-- Table structure for table `cme_dashboard`
--

CREATE TABLE `cme_dashboard` (
  `id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cme_material`
--

CREATE TABLE `cme_material` (
  `id` int(11) NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `id_cme_request` int(11) DEFAULT NULL,
  `material` text DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `satuan` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_total` double DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cme_ongkir`
--

CREATE TABLE `cme_ongkir` (
  `id` int(11) NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `id_cme_request` int(11) DEFAULT NULL,
  `kendaraan` text DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cme_request`
--

CREATE TABLE `cme_request` (
  `id` int(11) NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `id_suplier` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `id_cme_site` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rekening` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `bukti_tf_admin` text DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cme_site`
--

CREATE TABLE `cme_site` (
  `id` int(11) NOT NULL,
  `nama` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cme_site`
--

INSERT INTO `cme_site` (`id`, `nama`, `created_at`) VALUES
(1, 'PAL0001', '2021-11-19'),
(2, 'PAL002', '2021-11-19'),
(3, 'PAL003', '2021-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2019-05-29 22:38:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'http://localhost:8080/blog/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2019-05-29 22:39:55', NULL),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8081/blog/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2019-07-10 17:52:21', NULL),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8081/blog/public/admin/foto/action-selected', 'Delete data 8,7,6,5,4,3,2,1 at foto', '', 1, '2019-07-10 19:51:53', NULL),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2019-08-16 21:13:08', NULL),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/delete/1', 'Delete data foto at Menu Management', '', 1, '2019-08-16 21:15:24', NULL),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/contact/add-save', 'Add New Data Alif Zenfahmi at Contact', '', 1, '2019-08-17 00:42:15', NULL),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/contact/edit-save/1', 'Update data Alif Zenfahmi at Contact', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>foto</td><td>0</td><td>uploads/1/2019-08/whatsapp_image_2019_08_17_at_132129.jpeg</td></tr></tbody></table>', 1, '2019-08-17 00:44:38', NULL),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_profile/add-save', 'Add New Data SEKILAS TENTANG SEKBER PAB at content profile', '', 1, '2019-08-17 01:21:16', NULL),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_profile/edit-save/1', 'Update data SEKILAS TENTANG SEKBER PAB at content profile', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>content</td><td><p>Sekretariat Bersama Pencinta Alam Banjarnegara atau disingkat SEKBER PAB adalah sebuah forum dan organisasi yang berkedudukan di Kabupaten Banjarnegara, Propinsi Jawa Tengah yang sekarang ini beralamat di Desa Gemuruh, RT RW, kode pos 53471.</p><p>SEKBER PAB sebagai sebuah Organisasi dan Komunitas sekarang ini beranggotakan sekitar 500 orang anggota yang tergabung dalam&nbsp; Kelompok Pencinta Alam dan anggota perseorangan yang berasal dari</p><p>lingkup&nbsp; wilayah di Kabupaten Banjarnegara.</p><p>Pendirian SEKBER PAB waktu itu muncul 18 tahun yang lalu dari sebuah ide “kecil” ternyata saat ini telah berkembang menjadi sebuah komunitas dan organisasi yang cukup besar khususnya di Banjarnegara. Sampai hari ini SEKBER PAB masih eksis dan dari waktu ke waktu semakin kuat serta selalu berusaha mengembangkan jaringan bersama komunitas dan organisasi lain di dalam dan di luar Banjarnegara.</p></td><td><p style=\"text-align: justify; \">Sekretariat Bersama Pencinta Alam Banjarnegara atau disingkat SEKBER PAB adalah sebuah forum dan organisasi yang berkedudukan di Kabupaten Banjarnegara, Propinsi Jawa Tengah yang sekarang ini beralamat di Desa Gemuruh, RT RW, kode pos 53471.</p><p style=\"text-align: justify;\">SEKBER PAB sebagai sebuah Organisasi dan Komunitas sekarang ini beranggotakan sekitar 500 orang anggota yang tergabung dalam&nbsp; Kelompok Pencinta Alam dan anggota perseorangan yang berasal darilingkup&nbsp; wilayah di Kabupaten Banjarnegara.</p><p style=\"text-align: justify; \">Pendirian SEKBER PAB waktu itu muncul 18 tahun yang lalu dari sebuah ide “kecil” ternyata saat ini telah berkembang menjadi sebuah komunitas dan organisasi yang cukup besar khususnya di Banjarnegara. Sampai hari ini SEKBER PAB masih eksis dan dari waktu ke waktu semakin kuat serta selalu berusaha mengembangkan jaringan bersama komunitas dan organisasi lain di dalam dan di luar Banjarnegara.</p></td></tr></tbody></table>', 1, '2019-08-17 01:25:17', NULL),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/add-save', 'Add New Data landing at Menu Management', '', 1, '2019-08-17 01:45:25', NULL),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/3', 'Update data landing at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td></td><td>fa fa-home</td></tr></tbody></table>', 1, '2019-08-17 01:45:59', NULL),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_header/add-save', 'Add New Data WELCOME TO SEKBER at content header', '', 1, '2019-08-17 01:50:33', NULL),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_quote/add-save', 'Add New Data Pendaki at content quote', '', 1, '2019-08-17 02:12:21', NULL),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_quote/add-save', 'Add New Data Pendaki at content quote', '', 1, '2019-08-17 02:13:56', NULL),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_quote/add-save', 'Add New Data Alam Raya at content quote', '', 1, '2019-08-17 05:11:37', NULL),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data RIMBA GUNUNG at Divisi', '', 1, '2019-08-17 05:26:54', NULL),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data SUSUR GUA at Divisi', '', 1, '2019-08-17 05:38:32', NULL),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data ARUNG JERAM at Divisi', '', 1, '2019-08-17 05:42:29', NULL),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data PANJAT TEBING at Divisi', '', 1, '2019-08-17 05:45:44', NULL),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data KONSERVASI at Divisi', '', 1, '2019-08-17 05:47:18', NULL),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/divisi/add-save', 'Add New Data NAPAK TILAS at Divisi', '', 1, '2019-08-17 05:49:02', NULL),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_portofolio/add-save', 'Add New Data napak tilas at portofolio', '', 1, '2019-08-17 05:57:48', NULL),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_portofolio/add-save', 'Add New Data pelantikan at portofolio', '', 1, '2019-08-17 06:02:33', NULL),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/contact/add-save', 'Add New Data Devri Ivandi at Contact', '', 1, '2019-08-17 07:08:25', NULL),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/contact/add-save', 'Add New Data Arizqi Febrianti at Contact', '', 1, '2019-08-17 07:09:54', NULL),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/contact/add-save', 'Add New Data Tiyar at Contact', '', 1, '2019-08-17 07:11:49', NULL),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_portofolio/add-save', 'Add New Data kegiatan sekber at portofolio', '', 1, '2019-08-17 07:13:37', NULL),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/content_portofolio/add-save', 'Add New Data reboisasi at portofolio', '', 1, '2019-08-17 07:17:16', NULL),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/3', 'Update data landing at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2019-08-17 07:29:11', NULL),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/1', 'Update data Contact at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:29:25', NULL),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/2', 'Update data content profile at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:29:37', NULL),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/5', 'Update data content quote at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:29:51', NULL),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/6', 'Update data Divisi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:30:05', NULL),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/7', 'Update data portofolio at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:30:18', NULL),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/4', 'Update data content header at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:30:31', NULL),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://localhost:8081/nt/public/admin/menu_management/edit-save/8', 'Update data Customer Care at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2019-08-17 07:30:57', NULL),
(37, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'admin@crudbooster.com login with IP Address 103.247.123.150', '', 1, '2019-08-17 15:14:22', NULL),
(38, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/users/add-save', 'Add New Data sekber at Users Management', '', 1, '2019-08-17 15:15:05', NULL),
(39, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2019-08-17 15:15:16', NULL),
(40, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'sekber@gmail.com login with IP Address 103.247.123.150', '', 2, '2019-08-17 15:15:19', NULL),
(41, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/logout', 'sekber@gmail.com logout', '', 2, '2019-08-17 15:34:35', NULL),
(42, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'admin@crudbooster.com login with IP Address 103.247.123.150', '', 1, '2019-08-17 15:34:41', NULL),
(43, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/add-save', 'Add New Data  at banner', '', 1, '2019-08-17 15:35:26', NULL),
(44, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/add-save', 'Add New Data  at banner', '', 1, '2019-08-17 15:36:31', NULL),
(45, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/delete-image', 'Delete the image of 1 at banner', '', 1, '2019-08-17 15:41:53', NULL),
(46, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/edit-save/1', 'Update data  at banner', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/1/2019-08/dsc04349.JPG</td></tr></tbody></table>', 1, '2019-08-17 15:42:21', NULL),
(47, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/delete-image', 'Delete the image of 1 at banner', '', 1, '2019-08-17 15:53:51', NULL),
(48, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/banner/edit-save/1', 'Update data  at banner', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/1/2019-08/dsc04223.JPG</td></tr></tbody></table>', 1, '2019-08-17 15:54:08', NULL),
(49, '103.247.123.150', 'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5 Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'sekber@gmail.com login with IP Address 103.247.123.150', '', 2, '2019-08-17 16:05:54', NULL),
(50, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/content_profile/add-save', 'Add New Data Napak Tilas at content profile', '', 1, '2019-08-17 16:12:50', NULL),
(51, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/content_profile/edit-save/2', 'Update data Napak Tilas at content profile', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>content</td><td><p align=\"justfy\" style=\"font-size: 18px; line-height: 32px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Napak Tilas Merupakan salah satu kegiatan dalam rangka mewujudkan rasa persatuan dan kesatuan serta memupuk rasa cinta tanah air dan bangsa, yang di selenggarakan pada tanggal 10 s.d 12 November 2017 dalam rangka memperingati Hari Pahlawan.</p><p align=\"justfy\" style=\"font-size: 18px; line-height: 32px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Kegiatan ini dapat merangsang sekaligus menumbuhkan rasa nasionalisme dan rasa cinta tanah air, agar dapat lebih tanggap terhadap lingkungan sekitarnya, bermoral Pancasila dan disiplin, serta menumbuhkan semangat muda yang bertanggung jawab guna tercapainya persatuan dan kesatuan bangsa indonesia. Selain itu pula adalah untuk mengenang perjuangan para pahlawan bangsa, karena bangsa yang besar adalah bangsa yang menghormati jasa para pahlawanya</p></td><td><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Napak Tilas Merupakan salah satu kegiatan dalam rangka mewujudkan rasa persatuan dan kesatuan serta memupuk rasa cinta tanah air dan bangsa, yang di selenggarakan pada tanggal 10 s.d 12 November 2017 dalam rangka memperingati Hari Pahlawan.</span></font></p><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\"><br></span></font></p><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Kegiatan ini dapat merangsang sekaligus menumbuhkan rasa nasionalisme dan rasa cinta tanah air, agar dapat lebih tanggap terhadap lingkungan sekitarnya, bermoral Pancasila dan disiplin, serta menumbuhkan semangat muda yang bertanggung jawab guna tercapainya persatuan dan kesatuan bangsa indonesia. Selain itu pula adalah untuk mengenang perjuangan para pahlawan bangsa, karena bangsa yang besar adalah bangsa yang menghormati jasa para pahlawanya</span></font></p></td></tr></tbody></table>', 1, '2019-08-17 16:13:38', NULL),
(52, '103.247.123.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'http://neptune.crocodic.net/figit/nt/public/admin/content_profile/edit-save/2', 'Update data Napak Tilas at content profile', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>content</td><td><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Napak Tilas Merupakan salah satu kegiatan dalam rangka mewujudkan rasa persatuan dan kesatuan serta memupuk rasa cinta tanah air dan bangsa, yang di selenggarakan pada tanggal 10 s.d 12 November 2017 dalam rangka memperingati Hari Pahlawan.</span></font></p><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\"><br></span></font></p><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Kegiatan ini dapat merangsang sekaligus menumbuhkan rasa nasionalisme dan rasa cinta tanah air, agar dapat lebih tanggap terhadap lingkungan sekitarnya, bermoral Pancasila dan disiplin, serta menumbuhkan semangat muda yang bertanggung jawab guna tercapainya persatuan dan kesatuan bangsa indonesia. Selain itu pula adalah untuk mengenang perjuangan para pahlawan bangsa, karena bangsa yang besar adalah bangsa yang menghormati jasa para pahlawanya</span></font></p></td><td><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Napak Tilas Merupakan salah satu kegiatan dalam rangka mewujudkan rasa persatuan dan kesatuan serta memupuk rasa cinta tanah air dan bangsa, yang di selenggarakan pada tanggal 08 s.d 10 November 2019 dalam rangka memperingati Hari Pahlawan.</span></font></p><p align=\"justfy\" style=\"line-height: 32px; text-align: justify;\"><font color=\"#888888\" face=\"Arial\"><span style=\"font-size: 18px;\">Kegiatan ini dapat merangsang sekaligus menumbuhkan rasa nasionalisme dan rasa cinta tanah air, agar dapat lebih tanggap terhadap lingkungan sekitarnya, bermoral Pancasila dan disiplin, serta menumbuhkan semangat muda yang bertanggung jawab guna tercapainya persatuan dan kesatuan bangsa indonesia. Selain itu pula adalah untuk mengenang perjuangan para pahlawan bangsa, karena bangsa yang besar adalah bangsa yang menghormati jasa para pahlawanya</span></font></p></td></tr></tbody></table>', 1, '2019-08-17 16:18:07', NULL),
(53, '103.247.123.150', 'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5 Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g', 'http://neptune.crocodic.net/figit/nt/public/admin/logout', 'sekber@gmail.com logout', '', 2, '2019-08-17 16:36:58', NULL),
(54, '103.247.123.150', 'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5 Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'admin@crudbooster.com login with IP Address 103.247.123.150', '', 1, '2019-08-18 00:46:29', NULL),
(55, '103.247.123.150', 'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5 Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g', 'http://neptune.crocodic.net/figit/nt/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2019-08-18 00:53:23', NULL),
(56, '103.247.123.150', 'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5 Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g', 'http://neptune.crocodic.net/figit/nt/public/admin/login', 'sekber@gmail.com login with IP Address 103.247.123.150', '', 2, '2019-08-18 00:53:39', NULL),
(57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://localhost/patigeni/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2020-09-10 05:19:52', NULL),
(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'http://localhost/patigeni/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-03-31 20:00:48', NULL),
(59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'http://localhost/ta-master/ta-master/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-04-30 05:34:50', NULL),
(60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-08-26 03:50:12', NULL),
(61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/users/delete/2', 'Delete data sekber at Users Management', '', 1, '2021-08-26 03:51:10', NULL),
(62, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/menu_management/delete/3', 'Delete data landing at Menu Management', '', 1, '2021-08-26 03:51:42', NULL),
(63, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/menu_management/delete/8', 'Delete data Customer Care at Menu Management', '', 1, '2021-08-26 03:51:45', NULL),
(64, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/menu_management/delete/9', 'Delete data banner at Menu Management', '', 1, '2021-08-26 03:51:49', NULL),
(65, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/20', 'Delete data banner at Module Generator', '', 1, '2021-08-26 03:52:00', NULL),
(66, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/13', 'Delete data Contact at Module Generator', '', 1, '2021-08-26 03:52:04', NULL),
(67, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/15', 'Delete data content header at Module Generator', '', 1, '2021-08-26 03:52:07', NULL),
(68, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/14', 'Delete data content profile at Module Generator', '', 1, '2021-08-26 03:52:11', NULL),
(69, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/16', 'Delete data content quote at Module Generator', '', 1, '2021-08-26 03:52:14', NULL),
(70, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/19', 'Delete data Customer Care at Module Generator', '', 1, '2021-08-26 03:52:16', NULL),
(71, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/17', 'Delete data Divisi at Module Generator', '', 1, '2021-08-26 03:52:19', NULL),
(72, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/12', 'Delete data foto at Module Generator', '', 1, '2021-08-26 03:52:22', NULL),
(73, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'https://localhost/healtycare/public/admin/module_generator/delete/18', 'Delete data portofolio at Module Generator', '', 1, '2021-08-26 03:52:25', NULL),
(74, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-11 22:24:10', NULL),
(75, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-11 22:29:12', NULL),
(76, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-11 22:29:25', NULL),
(77, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-11/logo_j4_400x391.jpg</td></tr><tr><td>password</td><td>$2y$10$KtuUMaPGHAjpY/H0m6RjwecykM5ypwBrT/HZCBt5OJOWwRHWwb8C6</td><td>$2y$10$der4Jgl3f50e1JWbo.P4ieUNXw7z6JwBHC28XVA66hXsn12kEssN6</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2021-11-11 22:30:31', NULL),
(78, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-11 22:30:42', NULL),
(79, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-11 22:31:00', NULL),
(80, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/POS/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-14 18:27:31', NULL),
(81, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-18 20:38:32', NULL),
(82, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/delete-image', 'Delete the image of Super Admin at Users Management', '', 1, '2021-11-18 20:39:43', NULL),
(83, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-11/logo_j4_400x391.jpg</td></tr><tr><td>password</td><td>$2y$10$der4Jgl3f50e1JWbo.P4ieUNXw7z6JwBHC28XVA66hXsn12kEssN6</td><td></td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2021-11-18 20:40:01', NULL),
(84, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/add-save', 'Add New Data suplier tinombo at Users Management', '', 1, '2021-11-18 21:19:28', NULL),
(85, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/add-save', 'Add New Data widya at Users Management', '', 1, '2021-11-18 21:19:59', NULL),
(86, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/add-save', 'Add New Data ahmad al masrur at Users Management', '', 1, '2021-11-18 21:20:39', NULL),
(87, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/add-save', 'Add New Data badi at Users Management', '', 1, '2021-11-18 21:21:03', NULL),
(88, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/users/add-save', 'Add New Data narendra bayu at Users Management', '', 1, '2021-11-18 21:21:51', NULL),
(89, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-18 21:33:17', NULL),
(90, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-18 21:33:26', NULL),
(91, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-18 22:24:50', NULL),
(92, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-18 22:27:03', NULL),
(93, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-18 22:28:53', NULL),
(94, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-18 22:29:41', NULL),
(95, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-18 22:30:05', NULL),
(96, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-18 22:34:06', NULL),
(97, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-18 22:34:25', NULL),
(98, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-18 22:34:47', NULL),
(99, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-18 22:35:19', NULL),
(100, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-18 22:35:25', NULL),
(101, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/10', 'Update data Request Material at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2021-11-18 22:35:43', NULL),
(102, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-18 22:35:58', NULL),
(103, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/add-save', 'Add New Data  at Request Material', '', 6, '2021-11-18 22:36:30', NULL),
(104, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/delete/1', 'Delete data 1 at Request Material', '', 6, '2021-11-18 22:36:40', NULL),
(105, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/add-save', 'Add New Data  at Request Material', '', 6, '2021-11-18 22:38:10', NULL),
(106, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/11', 'Update data Material at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-11-18 22:58:00', NULL),
(107, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/12', 'Update data Ongkir at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-11-18 22:58:09', NULL),
(108, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material', 'Try view the data :name at Material', '', 6, '2021-11-18 23:01:04', NULL),
(109, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-18 23:01:09', NULL),
(110, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-18 23:01:20', NULL),
(111, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 6, '2021-11-18 23:01:48', NULL),
(112, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 6, '2021-11-18 23:02:41', NULL),
(113, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/add-save', 'Add New Data  at Ongkir', '', 6, '2021-11-18 23:03:04', NULL),
(114, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'masrur@gmail.com login with IP Address ::1', '', 5, '2021-11-19 00:26:28', NULL),
(115, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'masrur@gmail.com logout', '', 5, '2021-11-19 00:27:22', NULL),
(116, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 00:27:39', NULL),
(117, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/13', 'Update data Request Approve By Admin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-11-19 00:33:22', NULL),
(118, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-19 00:33:34', NULL),
(119, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 00:33:48', NULL),
(120, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/14', 'Update data Request Material By Waspang at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2021-11-19 00:44:47', NULL),
(121, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request_material_admin/edit-save/2', 'Update data  at Request Material By Waspang', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price</td><td></td><td></td></tr><tr><td>bukti_tf_admin</td><td></td><td>uploads/1/2021-11/download_2.png</td></tr></tbody></table>', 1, '2021-11-19 00:45:59', NULL),
(122, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-19 01:03:50', NULL),
(123, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'widya@gmail.com login with IP Address ::1', '', 4, '2021-11-19 01:04:04', NULL),
(124, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'widya@gmail.com logout', '', 4, '2021-11-19 01:04:12', NULL),
(125, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/15', 'Update data Material Approve at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2021-11-19 01:04:28', NULL),
(126, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 01:04:50', NULL),
(127, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-19 01:04:55', NULL),
(128, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'widya@gmail.com login with IP Address ::1', '', 4, '2021-11-19 01:05:08', NULL),
(129, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'widya@gmail.com logout', '', 4, '2021-11-19 01:05:33', NULL),
(130, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 01:05:45', NULL),
(131, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-19 01:06:10', NULL),
(132, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'widya@gmail.com login with IP Address ::1', '', 4, '2021-11-19 01:06:22', NULL),
(133, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'widya@gmail.com logout', '', 4, '2021-11-19 01:10:17', NULL),
(134, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 01:10:41', NULL),
(135, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 04:25:03', NULL),
(136, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 04:33:57', NULL),
(137, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-19 04:34:19', NULL),
(138, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 04:34:28', NULL),
(139, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/2', 'Delete data 2 at Material', '', 1, '2021-11-19 04:38:47', NULL),
(140, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/1', 'Delete data 1 at Material', '', 1, '2021-11-19 04:38:51', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(141, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/delete/1', 'Delete data 1 at Ongkir', '', 1, '2021-11-19 04:38:59', NULL),
(142, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request_material_admin_approve/delete/2', 'Delete data 2 at Material Approve', '', 1, '2021-11-19 04:39:05', NULL),
(143, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/add-save', 'Add New Data  at Request Material', '', 6, '2021-11-19 04:45:37', NULL),
(144, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 6, '2021-11-19 04:46:50', NULL),
(145, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 6, '2021-11-19 04:47:36', NULL),
(146, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/add-save', 'Add New Data  at Ongkir', '', 6, '2021-11-19 04:48:07', NULL),
(147, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/add-save', 'Add New Data  at Request Material', '', 6, '2021-11-19 04:58:52', NULL),
(148, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 6, '2021-11-19 04:59:38', NULL),
(149, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/add-save', 'Add New Data  at Ongkir', '', 6, '2021-11-19 04:59:53', NULL),
(150, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/10', 'Update data Request Material at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-11-19 05:03:39', NULL),
(151, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/13', 'Update data Request Approve By Admin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-11-19 05:03:49', NULL),
(152, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-19 05:04:01', NULL),
(153, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'masrur@gmail.com login with IP Address ::1', '', 5, '2021-11-19 05:04:11', NULL),
(154, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request/add-save', 'Add New Data  at Request Material', '', 5, '2021-11-19 05:04:38', NULL),
(155, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/add-save', 'Add New Data  at Material', '', 5, '2021-11-19 05:05:17', NULL),
(156, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-19 05:26:50', NULL),
(157, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 05:27:31', NULL),
(158, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/16', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Dashboard Waspang</td><td>Dashboard</td></tr><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2021-11-19 05:28:52', NULL),
(159, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'masrur@gmail.com logout', '', 5, '2021-11-19 05:29:00', NULL),
(160, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'masrur@gmail.com login with IP Address ::1', '', 5, '2021-11-19 05:29:09', NULL),
(161, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'masrur@gmail.com logout', '', 5, '2021-11-19 06:42:12', NULL),
(162, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'badi@gmail.com login with IP Address ::1', '', 6, '2021-11-19 06:42:27', NULL),
(163, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/17', 'Update data Dasboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2021-11-19 07:35:48', NULL),
(164, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'badi@gmail.com logout', '', 6, '2021-11-19 07:37:34', NULL),
(165, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'masrur@gmail.com login with IP Address ::1', '', 5, '2021-11-19 07:37:46', NULL),
(166, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-19 07:38:33', NULL),
(167, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'widya@gmail.com login with IP Address ::1', '', 4, '2021-11-19 07:38:45', NULL),
(168, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'widya@gmail.com logout', '', 4, '2021-11-19 07:40:55', NULL),
(169, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 07:41:07', NULL),
(170, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-11-19 07:41:32', NULL),
(171, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'narendra@gmail.com login with IP Address ::1', '', 7, '2021-11-19 07:41:44', NULL),
(172, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/logout', 'narendra@gmail.com logout', '', 7, '2021-11-19 08:14:00', NULL),
(173, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-11-19 08:14:16', NULL),
(174, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/6', 'Delete data 6 at Material', '', 1, '2021-11-19 08:14:33', NULL),
(175, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/5', 'Delete data 5 at Material', '', 1, '2021-11-19 08:14:46', NULL),
(176, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/delete/3', 'Delete data 3 at Ongkir', '', 1, '2021-11-19 08:14:53', NULL),
(177, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/4', 'Delete data 4 at Material', '', 1, '2021-11-19 08:14:59', NULL),
(178, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_material/delete/3', 'Delete data 3 at Material', '', 1, '2021-11-19 08:15:03', NULL),
(179, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_ongkir/delete/2', 'Delete data 2 at Ongkir', '', 1, '2021-11-19 08:15:10', NULL),
(180, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request_material_admin_approve/delete/5', 'Delete data 5 at Material Approve', '', 1, '2021-11-19 08:15:16', NULL),
(181, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request_material_admin_approve/delete/4', 'Delete data 4 at Material Approve', '', 1, '2021-11-19 08:15:20', NULL),
(182, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_request_material_admin_approve/delete/3', 'Delete data 3 at Material Approve', '', 1, '2021-11-19 08:15:23', NULL),
(183, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_site/add-save', 'Add New Data PAL0001 at Site Tower', '', 1, '2021-11-19 08:17:07', NULL),
(184, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_site/add-save', 'Add New Data PAL002 at Site Tower', '', 1, '2021-11-19 08:17:14', NULL),
(185, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/cme_site/add-save', 'Add New Data PAL003 at Site Tower', '', 1, '2021-11-19 08:17:19', NULL),
(186, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'https://localhost/pticme/public/admin/menu_management/edit-save/18', 'Update data Site Tower at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2021-11-19 08:26:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(10, 'Request Material', 'Route', 'AdminCmeRequestControllerGetIndex', 'normal', 'fa fa-book', 0, 1, 0, 1, 1, '2021-11-18 21:23:50', '2021-11-19 05:03:39'),
(11, 'Material', 'Route', 'AdminCmeMaterialControllerGetIndex', 'normal', 'fa fa-gear', 0, 0, 0, 1, 2, '2021-11-18 22:50:27', '2021-11-18 22:58:00'),
(12, 'Ongkir', 'Route', 'AdminCmeOngkirControllerGetIndex', 'normal', 'fa fa-automobile', 0, 0, 0, 1, 1, '2021-11-18 22:56:56', '2021-11-18 22:58:09'),
(13, 'Request Approve By Admin', 'Route', 'AdminCmeRequestApproveWaspangControllerGetIndex', 'normal', 'fa fa-check-circle', 0, 1, 0, 1, 3, '2021-11-19 00:30:00', '2021-11-19 05:03:49'),
(14, 'Request Material By Waspang', 'Route', 'AdminCmeRequestMaterialAdminControllerGetIndex', 'normal', 'fa fa-book', 0, 1, 0, 1, 4, '2021-11-19 00:35:35', '2021-11-19 00:44:47'),
(15, 'Material Approve', 'Route', 'AdminCmeRequestMaterialAdminApproveControllerGetIndex', 'normal', 'fa fa-book', 0, 1, 0, 1, 5, '2021-11-19 00:57:53', '2021-11-19 01:04:28'),
(16, 'Dashboard', 'Route', 'AdminCmeDashboardWaspangControllerGetIndex', 'normal', 'fa fa-dashboard', 0, 1, 1, 1, 6, '2021-11-19 05:28:01', '2021-11-19 05:28:52'),
(17, 'Dasboard', 'Route', 'AdminCmeDashboardAdminControllerGetIndex', 'normal', 'fa fa-dashboard', 0, 1, 1, 1, 7, '2021-11-19 07:34:29', '2021-11-19 07:35:48'),
(18, 'Site Tower', 'Route', 'AdminCmeSiteControllerGetIndex', 'normal', 'fa fa-tasks', 0, 1, 0, 1, 8, '2021-11-19 08:16:12', '2021-11-19 08:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(11, 3, 2),
(12, 3, 1),
(13, 1, 2),
(14, 1, 1),
(15, 2, 2),
(16, 2, 1),
(17, 5, 2),
(18, 5, 1),
(19, 6, 2),
(20, 6, 1),
(21, 7, 2),
(22, 7, 1),
(23, 4, 2),
(24, 4, 1),
(25, 8, 2),
(26, 8, 1),
(27, 9, 1),
(33, 11, 1),
(34, 11, 6),
(35, 12, 1),
(36, 12, 6),
(41, 14, 3),
(42, 14, 7),
(43, 14, 1),
(45, 15, 3),
(46, 15, 7),
(47, 15, 1),
(48, 10, 6),
(49, 13, 6),
(51, 16, 6),
(53, 17, 3),
(54, 17, 7),
(55, 17, 1),
(57, 18, 3),
(58, 18, 7),
(59, 18, 1),
(60, 18, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2019-05-29 22:38:11', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2019-05-29 22:38:11', NULL, NULL),
(12, 'foto', 'fa fa-image', 'foto', 'foto', 'AdminFotoController', 0, 0, '2019-07-10 18:31:34', NULL, '2021-08-26 03:52:22'),
(13, 'Contact', 'fa fa-user-plus', 'contact', 'contact', 'AdminContactController', 0, 0, '2019-08-16 22:34:07', NULL, '2021-08-26 03:52:04'),
(14, 'content profile', 'fa fa-star', 'content_profile', 'content_profile', 'AdminContentProfileController', 0, 0, '2019-08-17 01:17:23', NULL, '2021-08-26 03:52:11'),
(15, 'content header', 'fa fa-star', 'content_header', 'content_header', 'AdminContentHeaderController', 0, 0, '2019-08-17 01:48:29', NULL, '2021-08-26 03:52:07'),
(16, 'content quote', 'fa fa-star', 'content_quote', 'content_quote', 'AdminContentQuoteController', 0, 0, '2019-08-17 01:59:09', NULL, '2021-08-26 03:52:14'),
(17, 'Divisi', 'fa fa-star', 'divisi', 'divisi', 'AdminDivisiController', 0, 0, '2019-08-17 05:22:25', NULL, '2021-08-26 03:52:19'),
(18, 'portofolio', 'fa fa-star', 'content_portofolio', 'content_portofolio', 'AdminContentPortofolioController', 0, 0, '2019-08-17 05:55:55', NULL, '2021-08-26 03:52:25'),
(19, 'Customer Care', 'fa fa-envelope-o', 'customer', 'customer', 'AdminCustomerController', 0, 0, '2019-08-17 07:26:39', NULL, '2021-08-26 03:52:16'),
(20, 'banner', 'fa fa-image', 'banner', 'banner', 'AdminBannerController', 0, 0, '2019-08-17 15:35:03', NULL, '2021-08-26 03:52:00'),
(21, 'Request Material', 'fa fa-book', 'cme_request', 'cme_request', 'AdminCmeRequestController', 0, 0, '2021-11-18 21:23:50', NULL, NULL),
(22, 'Material', 'fa fa-gear', 'cme_material', 'cme_material', 'AdminCmeMaterialController', 0, 0, '2021-11-18 22:50:27', NULL, NULL),
(23, 'Ongkir', 'fa fa-automobile', 'cme_ongkir', 'cme_ongkir', 'AdminCmeOngkirController', 0, 0, '2021-11-18 22:56:56', NULL, NULL),
(24, 'Request Approve By Admin', 'fa fa-check-circle', 'cme_request_approve_waspang', 'cme_request', 'AdminCmeRequestApproveWaspangController', 0, 0, '2021-11-19 00:30:00', NULL, NULL),
(25, 'Request Material By Waspang', 'fa fa-book', 'cme_request_material_admin', 'cme_request', 'AdminCmeRequestMaterialAdminController', 0, 0, '2021-11-19 00:35:35', NULL, NULL),
(26, 'Material Approve', 'fa fa-book', 'cme_request_material_admin_approve', 'cme_request', 'AdminCmeRequestMaterialAdminApproveController', 0, 0, '2021-11-19 00:57:53', NULL, NULL),
(27, 'Dashboard Waspang', 'fa fa-dashboard', 'cme_dashboard_waspang', 'cme_dashboard', 'AdminCmeDashboardWaspangController', 0, 0, '2021-11-19 05:28:01', NULL, NULL),
(28, 'Dasboard', 'fa fa-dashboard', 'cme_dashboard_admin', 'cme_dashboard', 'AdminCmeDashboardAdminController', 0, 0, '2021-11-19 07:34:29', NULL, NULL),
(29, 'Site Tower', 'fa fa-tasks', 'cme_site', 'cme_site', 'AdminCmeSiteController', 0, 0, '2021-11-19 08:16:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-blue-light', '2019-05-29 22:38:11', NULL),
(3, 'admin', 0, 'skin-blue-light', NULL, NULL),
(4, 'suplier', 0, 'skin-blue-light', NULL, NULL),
(6, 'waspang', 0, 'skin-blue-light', NULL, NULL),
(7, 'pm', 0, 'skin-blue-light', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(20, 1, 1, 1, 1, 1, 1, 4, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(24, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(28, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(33, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(43, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(56, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(62, 1, 1, 1, 1, 1, 1, 28, NULL, NULL),
(73, 1, 1, 1, 1, 1, 1, 29, NULL, NULL),
(74, 1, 0, 1, 0, 0, 7, 28, NULL, NULL),
(75, 1, 0, 1, 0, 0, 7, 22, NULL, NULL),
(76, 1, 0, 1, 0, 0, 7, 26, NULL, NULL),
(77, 1, 0, 1, 0, 0, 7, 23, NULL, NULL),
(78, 1, 0, 1, 0, 0, 7, 25, NULL, NULL),
(79, 1, 1, 1, 1, 1, 7, 29, NULL, NULL),
(80, 1, 0, 0, 0, 0, 6, 27, NULL, NULL),
(81, 1, 1, 1, 1, 1, 6, 22, NULL, NULL),
(82, 1, 1, 1, 1, 1, 6, 23, NULL, NULL),
(83, 1, 0, 1, 1, 0, 6, 24, NULL, NULL),
(84, 1, 1, 1, 1, 1, 6, 21, NULL, NULL),
(85, 1, 0, 1, 0, 0, 6, 29, NULL, NULL),
(86, 1, 0, 0, 0, 0, 3, 28, NULL, NULL),
(87, 1, 1, 1, 1, 1, 3, 22, NULL, NULL),
(88, 1, 1, 1, 1, 1, 3, 26, NULL, NULL),
(89, 1, 1, 1, 1, 1, 3, 23, NULL, NULL),
(90, 1, 1, 1, 1, 1, 3, 25, NULL, NULL),
(91, 1, 1, 1, 1, 1, 3, 29, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2019-05-29 22:38:11', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2019-05-29 22:38:11', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2021-11/3bd93547b9c8c67d60cd7c5a615d1756.png', 'upload_image', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2019-05-29 22:38:11', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2019-05-29 22:38:11', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'PTI CME', 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2019-05-29 22:38:11', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2021-11/029a5ba7ddaffa268dbc51a8bfa6e587.png', 'upload_image', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2019-05-29 22:38:11', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `ktp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`, `hp`, `ktp`) VALUES
(1, 'Super Admin', 'uploads/1/2021-11/logo_j4_400x391.jpg', 'admin@crudbooster.com', '$2y$10$der4Jgl3f50e1JWbo.P4ieUNXw7z6JwBHC28XVA66hXsn12kEssN6', 1, '2019-05-29 22:38:11', '2021-11-18 20:40:01', 'Active', NULL, NULL),
(3, 'suplier tinombo', 'uploads/1/2021-11/download_2.png', 'tinombo@gmail.com', '$2y$10$ir8kk1XYzIX/U7cTs6QHGOBlnTTXSXuKeWzFeuIvsIQOuQF5c9yQu', 4, '2021-11-18 21:19:28', NULL, NULL, NULL, NULL),
(4, 'widya', 'uploads/1/2021-11/download_2.png', 'widya@gmail.com', '$2y$10$TYxr.6ttBHZEhibBSTD9/.bYRXUHHvXAUBumFqzfAQpK6ctFsXHCW', 3, '2021-11-18 21:19:59', NULL, NULL, NULL, NULL),
(5, 'ahmad al masrur', 'uploads/1/2021-11/download_2.png', 'masrur@gmail.com', '$2y$10$TX73P2NWaPm00ENfihn2a.h/jCxd7Ebkct5f87ZYZejcG8KfeBoe2', 6, '2021-11-18 21:20:39', NULL, NULL, NULL, NULL),
(6, 'badi', 'uploads/1/2021-11/download_2.png', 'badi@gmail.com', '$2y$10$du8f0DGW5nmffIbDS.wGHulpyDs3svqyKTwdrdp6IjPKbewyRhh7K', 6, '2021-11-18 21:21:03', NULL, NULL, NULL, NULL),
(7, 'narendra bayu', 'uploads/1/2021-11/download_2.png', 'narendra@gmail.com', '$2y$10$uIBbSdYXhqSQNHIIDj1./evWtKdB4fqxooIES2nzjEFrLfe5IrwH.', 7, '2021-11-18 21:21:51', NULL, NULL, NULL, NULL);

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
(1, '2016_08_07_145904_add_table_cms_apicustom', 1),
(2, '2016_08_07_150834_add_table_cms_dashboard', 1),
(3, '2016_08_07_151210_add_table_cms_logs', 1),
(4, '2016_08_07_151211_add_details_cms_logs', 1),
(5, '2016_08_07_152014_add_table_cms_privileges', 1),
(6, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(7, '2016_08_07_152320_add_table_cms_settings', 1),
(8, '2016_08_07_152421_add_table_cms_users', 1),
(9, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(10, '2016_08_07_154624_add_table_cms_moduls', 1),
(11, '2016_08_17_225409_add_status_cms_users', 1),
(12, '2016_08_20_125418_add_table_cms_notifications', 1),
(13, '2016_09_04_033706_add_table_cms_email_queues', 1),
(14, '2016_09_16_035347_add_group_setting', 1),
(15, '2016_09_16_045425_add_label_setting', 1),
(16, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(17, '2016_10_01_141740_add_method_type_apicustom', 1),
(18, '2016_10_01_141846_add_parameters_apicustom', 1),
(19, '2016_10_01_141934_add_responses_apicustom', 1),
(20, '2016_10_01_144826_add_table_apikey', 1),
(21, '2016_11_14_141657_create_cms_menus', 1),
(22, '2016_11_15_132350_create_cms_email_templates', 1),
(23, '2016_11_15_190410_create_cms_statistics', 1),
(24, '2016_11_17_102740_create_cms_statistic_components', 1),
(25, '2017_06_06_164501_add_deleted_at_cms_moduls', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cme_material`
--
ALTER TABLE `cme_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cme_ongkir`
--
ALTER TABLE `cme_ongkir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cme_request`
--
ALTER TABLE `cme_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cme_site`
--
ALTER TABLE `cme_site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cme_material`
--
ALTER TABLE `cme_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cme_ongkir`
--
ALTER TABLE `cme_ongkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cme_request`
--
ALTER TABLE `cme_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cme_site`
--
ALTER TABLE `cme_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
