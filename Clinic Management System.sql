USE [master]
GO
/****** Object:  Database [Clinic Management]    Script Date: 6/13/2020 11:31:18 PM ******/
CREATE DATABASE [Clinic Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinic Management', FILENAME = N'D:\Program Files\New folder\MSSQL15.SQLEXPRESS\MSSQL\DATA\Clinic Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clinic Management_log', FILENAME = N'D:\Program Files\New folder\MSSQL15.SQLEXPRESS\MSSQL\DATA\Clinic Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Clinic Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinic Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinic Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinic Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinic Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinic Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinic Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinic Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinic Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinic Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinic Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinic Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinic Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinic Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinic Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinic Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinic Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinic Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinic Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinic Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinic Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinic Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinic Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinic Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinic Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinic Management] SET  MULTI_USER 
GO
ALTER DATABASE [Clinic Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinic Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinic Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinic Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clinic Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinic Management] SET QUERY_STORE = OFF
GO
USE [Clinic Management]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 6/13/2020 11:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[doc_id] [int] NOT NULL,
	[doc_name] [nvarchar](50) NOT NULL,
	[specialization] [nvarchar](max) NOT NULL,
	[doc_address] [nvarchar](max) NOT NULL,
	[phone_nom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 6/13/2020 11:31:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[p_id] [int] NOT NULL,
	[p_name] [nvarchar](50) NOT NULL,
	[p_age] [int] NOT NULL,
	[p_gender] [nvarchar](50) NOT NULL,
	[doc_id] [nchar](10) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 6/13/2020 11:31:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[r_nom] [int] NOT NULL,
	[r_type] [nvarchar](50) NOT NULL,
	[complaint] [nvarchar](max) NOT NULL,
	[cost] [int] NOT NULL,
	[date_time] [datetime] NOT NULL,
	[p_id] [int] NOT NULL,
	[doc_id] [int] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[r_nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Doctors] FOREIGN KEY([doc_id])
REFERENCES [dbo].[Doctors] ([doc_id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Doctors]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Patients] FOREIGN KEY([p_id])
REFERENCES [dbo].[Patients] ([p_id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Patients]
GO
USE [master]
GO
ALTER DATABASE [Clinic Management] SET  READ_WRITE 
GO
