USE [master]
GO
/****** Object:  Database [Blog]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE DATABASE [Blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Blog] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blog] SET  MULTI_USER 
GO
ALTER DATABASE [Blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Blog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Blog] SET QUERY_STORE = OFF
GO
USE [Blog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategories]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategories](
	[IdBlog] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BlogCategories] PRIMARY KEY CLUSTERED 
(
	[IdBlog] ASC,
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](70) NOT NULL,
	[IdUser] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IdPicture] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdBlog] [int] NOT NULL,
	[IdParent] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdBlog] [int] NOT NULL,
	[Status] [bigint] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](40) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 5:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210607214210_initial_migration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608090011_user_configuration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608091052_picutre_added', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608105049_prepared_migration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608221535_change_configuration_user', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609114156_change_configuration_user2', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609133537_change_configuration_user3', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210611135110_updated_blogCategoryEntity', N'5.0.6')
GO
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (3, 7, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (3, 15, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (4, 5, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (4, 13, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (4, 15, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 11, CAST(N'2021-06-16T21:20:17.6364074' AS DateTime2), 0, 1)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 12, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 15, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 17, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 20, CAST(N'2021-06-16T21:20:17.6365061' AS DateTime2), 0, 1)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (5, 22, CAST(N'2021-06-16T21:20:17.6365081' AS DateTime2), 0, 1)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (6, 4, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (6, 5, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (6, 6, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (7, 8, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (7, 19, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (7, 23, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (8, 5, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (8, 8, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (8, 19, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (9, 17, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (10, 10, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (10, 12, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (10, 17, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (11, 4, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (11, 6, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (11, 7, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (11, 9, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (11, 11, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (12, 8, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (12, 19, NULL, 0, 0)
INSERT [dbo].[BlogCategories] ([IdBlog], [IdCategory], [DeletedAt], [IsActive], [IsDeleted]) VALUES (12, 23, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (3, N'Tutto il rosa della vita', 24, CAST(N'2021-06-16T17:04:01.6910527' AS DateTime2), CAST(N'2021-06-16T21:22:35.3787690' AS DateTime2), 0, 1, CAST(N'2021-06-16T21:22:35.3783387' AS DateTime2), 18, N'Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (4, N'Umetnost pregovaranja', 24, CAST(N'2021-06-16T17:09:22.2689328' AS DateTime2), NULL, 1, 0, NULL, 17, N'Različiti nesporazumi neretko završavaju sličnim pitanjem - kako li bi se sve to razrešilo u nekom drugačijem okruženju? Naime, da li se i tu radi o nekakvoj stečenoj kulturi komunikacije, običajima i manirima, ili postoji nešto treće važnije. Sudeći po onome što govori Kris Vos, vodeći pregovarač FBI-a za rešavanje talačkih kriza, iza svakog uspešnog društva stoji umetnost, i to ne bilo koja, već ona pregovaranja.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (5, N'Tutto il rosa della vita!!', 24, CAST(N'2021-06-16T17:11:37.4743641' AS DateTime2), CAST(N'2021-06-16T21:20:17.6729344' AS DateTime2), 1, 0, NULL, 18, N'Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (6, N'Vesnici Proleća', 24, CAST(N'2021-06-16T17:14:44.0808060' AS DateTime2), NULL, 1, 0, NULL, 17, N'Proljece na moje rame slijece, djurdjevak zeleni, djurdjevak zeleni…  nit proleća, nit đurđevka zelenog, ono, rame je tu ali koja vajda od njega kada se čas smrzavam kao da su me ostavili na Antarktiku na jedno pešes godina da se adaptiram, čas se znojim kao da kulučim neprekidno. Kako izdržavam, kako te promene izdržavamo svi kad bi i čelik popustio! Pošto živim u gradu asfaltiranom i zabetoniranom, visibaba, kukureka, jagorčevina i lastavica, notornih vesnika Proleća, nema ni u tragovima, štono bi rekli hemićari. Umesto vesnika, ja imam Vesića')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (7, N'Hešteg dilema', 24, CAST(N'2021-06-16T17:16:16.0153102' AS DateTime2), NULL, 1, 0, NULL, 16, N'Na Netfliksu je nedavno prikazan dokumentarac “Socijalna dilema” ili “Dilema društvenih mreža” u kome su se verovatno po prvi put na istom mestu našli rodonačelnici gotovo svih poznatih društvenih mreža, kako govore o osnovnim idejama i principima koji su u njih ugrađeni. Odnosno, o njihovoj dobrobiti, ali jednako, ako ne i više, i o opasnostima koje sa sobom nose.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (8, N'Kartica, PIN', 24, CAST(N'2021-06-16T17:37:57.5004621' AS DateTime2), NULL, 1, 0, NULL, 13, N'Kada ste dobili svoju kreditnu/debitnu ili neku drugu karticu od banke, sigurno su Vam skrenuli pažnju na to kako da je čuvate, kako da brinete o svom PIN-u i kako da je koristite na bankomatima, prodajnim mestima i slično. Ispod su neki od uobičajenh saveta, radi podsećanja (skupljeno sa nekoliko mesta na Internetu, neće škoditi). Slobodno podelite svoja saznanja, iskustva, pa i greške. Tema bloga je šta mislite o pristupu zaštiti PIN-a od strane gospodina/gospođe sa slike?')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (9, N'Biciklom oko sveta -- Tehnološki napredak (Nagasaki, Japan)', 23, CAST(N'2021-06-17T14:11:09.4800316' AS DateTime2), NULL, 1, 0, NULL, 15, N'Trebalo je da mi se SAMO zalemi jedna žičica na kablu za napajanje laptopa. Pokidala se pa se gubio kontakt i zato se baterija nije punila.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (10, N'Igra Imena', 23, CAST(N'2021-06-17T14:12:17.9942630' AS DateTime2), NULL, 1, 0, NULL, 13, N'Malo (korisne) zabave uz najavu hladnijeg vremena i snega. Kada objašnjavamo različite tehničke koncepte studentima i drugima, obično se trudimo da osmislimo pogodne scenarije i da tako, na praktičnim situacijama, prikažemo primere koji te koncepte čine lakšim za razumevanje.')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (11, N'TROGLAVI PROTIV DVA FEJSBUK PLEMENA', 23, CAST(N'2021-06-17T14:13:15.5039231' AS DateTime2), CAST(N'2021-06-17T14:18:01.0459251' AS DateTime2), 1, 0, NULL, 11, N'Обично се сматра да је Интернет створио виртуелност. Истина је обрнута: виртуелност је створила Интернет. Уметници су одавно открили виртуелну стварност, она је само добила то име у наше доба. И читаоци, нагнути над књижевним делом, стварају виртуелне ситуације и субјекте који актуелизују смисао текста кроз различите интерпретације. Француски филозоф Пјер Леви сматра да је феномен виртуелности много шири и да превазилази границе информатизације и нашег времена, да је он суштинско обележје који прати људски род од његовог настанка и испољава се кроз тежњу за превазилажењем задатих оквира и временско-просторних одредница. Виртуелност, пише Леви, није супротна стварности већ је «плодан и моћан модус бивствовања, који даје замаха стваралачким процесима, отвара перспективе, дуби изворе смисла испод површине непосредног физичког присуства»')
INSERT [dbo].[Blogs] ([Id], [Title], [IdUser], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IdPicture], [Content]) VALUES (12, N'Slobodan softver u nastavi', 26, CAST(N'2021-06-17T14:30:11.0730761' AS DateTime2), NULL, 1, 0, NULL, 16, N'Slobodan softver u nastavi – Intervju sa profesorom informatike Goranom Jovišićem')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (4, N'Ekologija', CAST(N'2021-06-16T16:38:50.5450732' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (5, N'Drustvo', CAST(N'2021-06-16T16:39:07.3730393' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (6, N'Zdravlje', CAST(N'2021-06-16T16:39:20.0462083' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (7, N'Sport', CAST(N'2021-06-16T16:39:27.5721970' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (8, N'Tehnologija', CAST(N'2021-06-16T16:39:33.1776444' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (9, N'Istorija', CAST(N'2021-06-16T16:39:48.8900033' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (10, N'Ljubav', CAST(N'2021-06-16T16:39:52.3501715' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (11, N'Umetnost', CAST(N'2021-06-16T16:39:56.2819592' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (12, N'Filozofija', CAST(N'2021-06-16T16:40:04.8810252' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (13, N'Obrazovanje', CAST(N'2021-06-16T16:40:11.4107984' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (14, N'Ljudska prava', CAST(N'2021-06-16T16:40:20.9639072' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (15, N'Zivotni stil', CAST(N'2021-06-16T16:40:30.6874868' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (16, N'Religija', CAST(N'2021-06-16T16:40:43.2901949' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (17, N'Kultura', CAST(N'2021-06-16T16:40:52.7124394' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (18, N'Nauka', CAST(N'2021-06-16T16:41:07.1194453' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (19, N'IT', CAST(N'2021-06-16T16:41:10.6039863' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (20, N'Zabava', CAST(N'2021-06-16T16:41:26.9747453' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (21, N'Film', CAST(N'2021-06-16T16:41:30.5006588' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (22, N'Muzika', CAST(N'2021-06-16T16:41:33.7982650' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (23, N'Buducnost', CAST(N'2021-06-16T16:42:01.3307385' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (7, N'Interesantno, nisam razmisljao o tome.', 24, 8, NULL, CAST(N'2021-06-16T17:41:53.9548425' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (8, N'Disagree.', 24, 8, 7, CAST(N'2021-06-16T17:42:25.6497302' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (9, N'I am very happy to hear this.', 24, 3, NULL, CAST(N'2021-06-16T17:43:02.5672359' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (10, N'Tutto', 24, 3, NULL, CAST(N'2021-06-16T17:43:13.9465201' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (11, N'Ne slusam tu muziku.', 24, 5, NULL, CAST(N'2021-06-16T17:43:33.9794975' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (12, N'Bas kvalitet.', 24, 5, 11, CAST(N'2021-06-16T17:44:30.7034342' AS DateTime2), CAST(N'2021-06-16T23:43:54.4826044' AS DateTime2), 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (13, N'Subjektivno misljenje.', 24, 5, 12, CAST(N'2021-06-16T17:45:04.1953125' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (14, N'Najnoviji komentar novog korisnika', 25, 7, NULL, CAST(N'2021-06-16T23:47:15.0707010' AS DateTime2), CAST(N'2021-06-16T23:49:47.7151816' AS DateTime2), 0, 1, CAST(N'2021-06-16T23:49:47.7014328' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (15, N'Najnoviji komentar novog korisnika', 25, 7, NULL, CAST(N'2021-06-16T23:50:01.6452047' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (16, N'Najnoviji komentar novog korisnika + 1', 25, 4, NULL, CAST(N'2021-06-16T23:50:31.4728752' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (17, N'Najnoviji komentar novog korisnika + 1 + ', 25, 4, NULL, CAST(N'2021-06-16T23:50:37.3289069' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (18, N'Razvoj softvera na vrhuncu.', 26, 12, NULL, CAST(N'2021-06-17T14:31:02.2260284' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (19, N'Razvoj softvera na vrhuncu. Dodatak', 26, 12, 18, CAST(N'2021-06-17T14:31:33.2784640' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [IdUser], [IdBlog], [IdParent], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (20, N'Razvoj softvera na vrhuncu. Dodatak / Dodatak drugi', 26, 12, 19, CAST(N'2021-06-17T14:31:42.5216494' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([Id], [IdUser], [IdBlog], [Status], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (3, 24, 5, 1, CAST(N'2021-06-16T17:48:16.5160881' AS DateTime2), CAST(N'2021-06-16T17:49:11.5471918' AS DateTime2), 1, 0, NULL)
INSERT [dbo].[Likes] ([Id], [IdUser], [IdBlog], [Status], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (4, 24, 7, 1, CAST(N'2021-06-16T17:49:26.1368011' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Likes] ([Id], [IdUser], [IdBlog], [Status], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (5, 26, 12, 1, CAST(N'2021-06-17T14:32:43.2834844' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Likes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (9, N'bc20b144-3768-4ee2-a4d9-e4025d8034d3.jpg', CAST(N'2021-06-16T16:53:44.1755147' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (10, N'58885d19-de23-473f-95b1-0e472cda0da7.jpg', CAST(N'2021-06-16T16:54:05.2738009' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (11, N'f3917226-d1cf-4eaa-9e46-f7a51bb76b3b.jpg', CAST(N'2021-06-16T16:54:13.0858476' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (12, N'9fb8add6-40f3-4bed-957c-af9e87afd98e.jpg', CAST(N'2021-06-16T16:54:19.7170254' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (13, N'ef2f1d62-10c3-46ac-b06d-b937b3433b4c.jpg', CAST(N'2021-06-16T16:54:26.5449249' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (14, N'75be54eb-18eb-4b24-b6fd-c2172d214537.jpg', CAST(N'2021-06-16T16:54:32.6323721' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (15, N'c8bbe613-ce21-43de-b682-c88ceb49dd68.jpg', CAST(N'2021-06-16T16:54:43.6638416' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (16, N'28612891-4a0a-4a34-9fa8-8a6740a92d59.png', CAST(N'2021-06-16T16:54:50.2225827' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (17, N'fa93e276-126e-45ca-a0f9-1f7aeb330e61.jpg', CAST(N'2021-06-16T16:54:57.4698243' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (18, N'e7c5067d-4471-4533-89f0-39287c716fff.jpg', CAST(N'2021-06-16T16:55:03.9656275' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (19, N'19436e7f-2401-4744-8763-a619d0ec52a8.jpg', CAST(N'2021-06-16T16:55:09.6814686' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2021-06-08T21:04:19.5319922' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":[]}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2021-06-08T21:08:51.7195111' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2021-06-08T21:58:11.5886881' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2021-06-08T22:00:43.5287569' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2021-06-08T22:06:33.0712321' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2021-06-08T22:08:51.6000349' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2021-06-08T22:11:21.8198913' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2021-06-08T22:13:18.6922833' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2021-06-08T22:16:24.7943504' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Prvi korisnik","LastName":"Prvi korisnik prezime","Username":"prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2021-06-08T22:17:07.7134567' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"Prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2021-06-08T22:18:25.7599884' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"Prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2021-06-08T22:19:25.2187319' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"Prvak","Email":"prvi@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2021-06-08T22:22:05.7672597' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"Prvak","Email":"gacanoviccc97@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2021-06-08T22:23:11.6490135' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"usernamez","Email":"gacanoviccc97@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2021-06-08T22:25:32.0051285' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"usernamez","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2021-06-08T22:27:36.0760786' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"usernamez","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2021-06-08T22:29:03.0783015' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"usernamez","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2021-06-08T22:30:48.0826760' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"usernamez","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2021-06-08T22:32:12.9885950' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"nekiUsername","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2021-06-08T22:36:14.1193549' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"nekiUsernameQ","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2021-06-08T22:36:55.9837283' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"nekiUsernameQ","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2021-06-08T22:38:33.5101408' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"nekiUsernameQ","Email":"marec.ict@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2021-06-08T22:41:07.8779144' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Ime","LastName":"Prezime","Username":"nekiUsernameQ22","Email":"azyerz@gmail.com","Password":"prvi1234","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2021-06-09T13:32:30.7028201' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marko","LastName":"Gacanovic","Username":"gacho97","Email":"gacanoviccc97@gmail.com","Password":"sifra123","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2021-06-09T13:36:25.5233966' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marko","LastName":"Gacanovic","Username":"gacho97","Email":"gacanoviccc97@gmail.com","Password":"sifra123","UserUseCases":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2021-06-09T15:48:05.3358521' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"John","LastName":"Doe","Username":"Joese","Email":"marko.gacanovic.38.17@ict.edu.rs","Password":"sifra123"}', N'gacho97')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2021-06-09T15:51:56.4060939' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"John","LastName":"Doe","Username":"Joese","Email":"marko.gacanovic.38.17@ict.edu.rs","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2021-06-09T18:39:39.2992349' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"string","LastName":"string","Username":"string","Email":"string","Password":"string"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2021-06-09T19:48:10.4437110' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Admin","LastName":"Admin","Username":"Admin","Email":"blogapiii@gmail.com","Password":"admin123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2021-06-09T20:39:11.8133351' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Technology"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2021-06-09T20:41:09.0888323' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Technology"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2021-06-09T20:54:17.5256283' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Sport"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2021-06-09T20:54:50.9131532' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Music"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2021-06-09T21:15:59.0318338' AS DateTime2), N'EFUpdateCategoryCommand', N'{"Id":1,"Name":"Tech"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2021-06-09T22:07:44.4087914' AS DateTime2), N'EFDeleteCategoryCommand', N'3', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2021-06-09T22:08:51.7166116' AS DateTime2), N'EFDeleteCategoryCommand', N'3', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2021-06-09T22:09:24.7495411' AS DateTime2), N'EFDeleteCategoryCommand', N'3', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2021-06-09T22:10:34.3757124' AS DateTime2), N'EFDeleteCategoryCommand', N'3', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2021-06-09T22:42:36.5286672' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":"Tec","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2021-06-09T22:42:58.6301751' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":"\\z","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2021-06-09T23:00:10.0484904' AS DateTime2), N'EFGetOneCategoryQuery', N'3', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2021-06-09T23:00:34.4465490' AS DateTime2), N'EFGetOneCategoryQuery', N'1', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2021-06-09T23:00:42.2460679' AS DateTime2), N'EFGetOneCategoryQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2021-06-09T23:18:59.8281493' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Laki","LastName":"Luzer","Username":"TestUser","Email":"laki@gmail.com","Password":"laki123","UseCasesIds":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2021-06-10T19:08:16.5287709' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Microsoft''s Open-Source Pivot Is Creating a Great Place to Work","Content":"Microsoft isn''t just building for the future. The company is focusing on tools that will allow an ever-broader group of people to program for themselves. At the heart of this plan is Microsoft''s pivot to open source; and while there were several benefits of that action highlighted at Microsoft Build last week, an important one was left out -- which is that Microsoft has become a far better place to work.","IdPicture":2,"BlogCategories":[]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2021-06-10T19:08:43.2608675' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Microsoft''s Open-Source Pivot Is Creating a Great Place to Work","Content":"Microsoft isn''t just building for the future. The company is focusing on tools that will allow an ever-broader group of people to program for themselves. At the heart of this plan is Microsoft''s pivot to open source; and while there were several benefits of that action highlighted at Microsoft Build last week, an important one was left out -- which is that Microsoft has become a far better place to work.","IdPicture":2,"BlogCategories":[]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2021-06-10T21:29:39.6068140' AS DateTime2), N'EFDeletePictureCommand', N'{"Id":1}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2021-06-10T21:31:20.1997270' AS DateTime2), N'EFDeletePictureCommand', N'{"Id":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2021-06-10T21:56:44.9188854' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2021-06-10T21:57:04.4448389' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2021-06-10T21:57:07.2968399' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2021-06-10T21:57:09.7952628' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2021-06-10T21:57:12.6406602' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2021-06-10T21:57:24.6090070' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2021-06-10T21:58:10.2698614' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2021-06-10T21:58:23.6334762' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2021-06-10T21:58:52.3321759' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2021-06-10T21:58:56.8487549' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2021-06-10T21:59:19.4379871' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2021-06-10T21:59:24.9969672' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":"sport","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2021-06-10T21:59:40.7759252' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2021-06-10T21:59:57.0439100' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2021-06-10T21:59:59.6901953' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":"bb618d46-54be-44f5-b577-f7dea7fc6416.jpg","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2021-06-11T12:25:55.6298656' AS DateTime2), N'EFDeletePictureCommand', N'{"Id":2}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2021-06-11T12:26:01.8813281' AS DateTime2), N'EFDeletePictureCommand', N'{"Id":3}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2021-06-11T12:26:07.2793292' AS DateTime2), N'EFGetPicturesQuery', N'{"Src":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2021-06-11T12:40:19.2817535' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza ponoći.","IdPicture":4,"BlogCategories":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2021-06-11T12:41:29.4180897' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza ponoći.","IdPicture":4,"BlogCategories":[{"IdBlog":0,"IdCategory":2}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2021-06-11T14:09:58.4724276' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":4,"BlogCategories":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2021-06-11T14:11:26.5668055' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2021-06-11T14:49:43.9804059' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2021-06-11T14:50:10.9608769' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[2]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2021-06-11T14:51:15.0442831' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[3]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2021-06-11T14:51:29.2527198' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[1]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2021-06-11T14:51:34.3272046' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[2]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2021-06-11T14:52:31.7077729' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[1]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2021-06-11T14:53:22.2398699' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":1,"Title":"Rolan Raros ulazi u 2. nedelju","Content":"U subotu je Đoković rutinski lagano dobio Berankisa koji dobro igra ravne udarce, ali osim toga nema drugih kvaliteta, pa nije bio dorastao protivnik naročito na ovoj podlozi. U ponedeljak Novak (ne pre pola 2) igra protiv tinejdžera Musetija, a ako pobedi u četvrtfinalu ga čeka njegov mnogo poznatiji zemljak Beretini odmoran zbog odustajanja Federera posle troipočasovnog maratona koji je završen duboko iza zxax.","IdPicture":5,"BlogCategories":[2]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2021-06-11T15:11:59.0161303' AS DateTime2), N'EFDeleteBlogCommand', N'1', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2021-06-11T15:12:59.6368733' AS DateTime2), N'EFDeleteBlogCommand', N'1', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2021-06-11T15:14:17.8272356' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Tutto il rosa della vita","Content":"Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.","IdPicture":6,"BlogCategories":[{"IdBlog":0,"IdCategory":2}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2021-06-12T12:22:45.3931068' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":1,"Status":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2021-06-12T13:09:26.9392115' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":1,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2021-06-12T13:16:52.4926580' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":1,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2021-06-12T13:17:30.0457249' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":1,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2021-06-12T13:17:58.8458546' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":1,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2021-06-12T13:18:14.7950731' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":1,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2021-06-12T13:18:36.2860379' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":2,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2021-06-12T14:25:12.9064505' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar","IdBlog":2,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2021-06-12T15:23:16.8416666' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"probni tekst za komentar drugi","IdBlog":1,"IdParent":null,"IdUser":0}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2021-06-12T15:24:35.3311264' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"drugi koment","IdBlog":2,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2021-06-12T15:31:52.2010032' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"drugi koment - neslaganje","IdBlog":2,"IdParent":2,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2021-06-14T15:34:31.9861437' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2021-06-14T15:36:57.1725711' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2021-06-14T15:38:00.1038133' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Nice !","IdBlog":2,"IdParent":null,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2021-06-14T15:38:28.7780195' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Very Nice !","IdBlog":2,"IdParent":5,"IdUser":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2021-06-14T15:38:35.8496554' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2021-06-14T15:54:13.6988223' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2021-06-14T15:55:12.7623982' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2021-06-14T15:55:44.1602234' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2021-06-14T16:08:10.6953418' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2021-06-14T16:10:11.4359397' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2021-06-14T16:12:30.0991213' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2021-06-14T16:12:52.9040347' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2021-06-14T16:13:13.8567993' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2021-06-14T16:15:14.9667875' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2021-06-14T16:17:12.9721929' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2021-06-14T16:19:41.4006755' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2021-06-14T16:27:19.3075983' AS DateTime2), N'EFGetOneBlogQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2021-06-14T20:17:45.3149400' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":0,"PerPage":5,"Page":1}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2021-06-14T20:22:27.2366324' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":0,"PerPage":5,"Page":1}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2021-06-14T20:25:17.4199721' AS DateTime2), N'EFLikeBlog', N'{"IdUser":0,"IdBlog":2,"Status":0}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2021-06-14T20:26:35.5343243' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2021-06-14T20:29:31.1244971' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":1,"Status":0}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2021-06-14T20:33:42.3918895' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":1,"Status":2}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2021-06-14T20:34:10.1650107' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":0,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2021-06-14T20:35:46.9634444' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":2}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2021-06-14T20:35:50.9840157' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":3}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2021-06-14T20:39:16.3973058' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2021-06-14T20:39:48.4275073' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":0,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2021-06-14T20:40:19.0138711' AS DateTime2), N'EFLikeBlog', N'{"IdUser":15,"IdBlog":2,"Status":2}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2021-06-14T20:40:26.0190769' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":0,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2021-06-14T22:01:02.0362367' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2021-06-14T22:02:42.6236748' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":2,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2021-06-14T22:02:50.6988972' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":1,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2021-06-15T12:17:52.4257910' AS DateTime2), N'EFGetUseCaseLogQuery', N'{"Actor":null,"UseCaseName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2021-06-15T12:18:52.0609450' AS DateTime2), N'EFGetUseCaseLogQuery', N'{"Actor":null,"UseCaseName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2021-06-15T12:19:18.5917206' AS DateTime2), N'EFGetUseCaseLogQuery', N'{"Actor":null,"UseCaseName":"query","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2021-06-15T15:11:13.2097670' AS DateTime2), N'EFDeleteCommentCommand', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2021-06-15T15:25:54.1256918' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Firstname test","LastName":"Lastname test","Username":"userTest","Email":"gacanoviccc97@gmail.com","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2021-06-15T15:26:23.6113135' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Firstname test","LastName":"Lastname test","Username":"userTest","Email":"marec.ict@gmail.com","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2021-06-15T18:32:09.4131639' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":0},{"IdUser":0,"IdUseCase":0}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2021-06-15T18:33:13.1885179' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":0}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2021-06-15T18:33:52.2841919' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":0}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2021-06-15T18:38:19.4282647' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":0},{"IdUser":0,"IdUseCase":0}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2021-06-15T18:49:30.5933058' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2021-06-15T18:50:54.1659586' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2021-06-15T18:52:08.2143157' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2021-06-15T18:52:56.8423922' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2021-06-15T18:53:21.6824190' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2021-06-15T18:53:54.0537573' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2021-06-15T18:54:12.7756900' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2021-06-15T18:55:17.5295313' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2021-06-15T19:00:25.3478072' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":[1,5,6]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2021-06-15T19:04:56.1949708' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":[1,5,6,66]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2021-06-15T19:10:32.4678362' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContr","Email":"gacanovicm@gmail.com","Password":"sifra555","UserCasesIds":[1,5,6,66]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2021-06-15T19:10:49.1525174' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrr","Email":"gacanovicm97@gmail.com","Password":"sifra555","UserCasesIds":[1,5,6,66]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2021-06-15T19:10:59.5716176' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrer","Email":"gacanodvicm97@gmail.com","Password":"sifra555","UserCasesIds":[]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2021-06-15T19:33:02.1099778' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrer","Email":"gacanodvicm97@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":0}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2021-06-15T19:33:37.5366993' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrer","Email":"gacanodvicm97@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":5}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2021-06-15T19:35:14.8601344' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrerc","Email":"gacanodvicmc97@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":5},{"IdUser":0,"IdUseCase":3111}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2021-06-15T19:36:09.6843872' AS DateTime2), N'EFCreateUserCommand', N'{"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestContrerc","Email":"gacanodvicmc97@gmail.com","Password":"sifra555","UserUseCases":[{"IdUser":0,"IdUseCase":5},{"IdUser":0,"IdUseCase":3111}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2021-06-15T20:49:53.1345328' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2021-06-15T20:51:25.1883073' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2021-06-15T20:53:24.3083705' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2021-06-15T20:54:57.0062550' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2021-06-15T20:55:53.4248643' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2021-06-15T20:56:23.5889843' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2021-06-15T20:56:49.5102655' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2021-06-15T20:57:20.9564246' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (160, CAST(N'2021-06-15T20:57:44.3336312' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (161, CAST(N'2021-06-15T20:58:44.4346128' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (162, CAST(N'2021-06-15T21:00:11.2215804' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserCase":null}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (163, CAST(N'2021-06-15T21:05:06.9928705' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserUseCases":[1,5,12]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (164, CAST(N'2021-06-15T21:05:16.1036275' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserUseCases":[1,5,255]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (165, CAST(N'2021-06-15T21:06:33.4459613' AS DateTime2), N'EFUpdateUserCommand', N'{"Id":19,"FirstName":"TestcontName","LastName":"TestcontNameLast","Username":"TestConteererc","Password":"sifra555","UserUseCases":[1,5,5]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (166, CAST(N'2021-06-15T21:23:38.9154835' AS DateTime2), N'EFDeleteUserCommand', N'19', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (167, CAST(N'2021-06-15T21:23:43.1463931' AS DateTime2), N'EFDeleteUserCommand', N'19', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (168, CAST(N'2021-06-15T21:25:15.0042438' AS DateTime2), N'EFDeleteUserCommand', N'19', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (169, CAST(N'2021-06-15T22:17:36.2752496' AS DateTime2), N'EFGetOneUserQuery', N'19', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (170, CAST(N'2021-06-15T22:18:29.4632098' AS DateTime2), N'EFGetOneUserQuery', N'19', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (171, CAST(N'2021-06-15T22:18:52.0770072' AS DateTime2), N'EFGetOneUserQuery', N'18', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (172, CAST(N'2021-06-15T22:19:12.7312956' AS DateTime2), N'EFGetOneUserQuery', N'16', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (173, CAST(N'2021-06-15T22:33:30.8019614' AS DateTime2), N'EFGetUsersQuery', N'{"Username":null,"Email":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (174, CAST(N'2021-06-16T09:27:19.3296929' AS DateTime2), N'EFGetOneUserQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (175, CAST(N'2021-06-16T09:27:44.0653082' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (176, CAST(N'2021-06-16T09:27:48.9315396' AS DateTime2), N'EFGetOneUserQuery', N'4', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (177, CAST(N'2021-06-16T09:27:52.7111763' AS DateTime2), N'EFGetOneUserQuery', N'3', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (178, CAST(N'2021-06-16T09:27:57.1590677' AS DateTime2), N'EFGetOneUserQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (179, CAST(N'2021-06-16T09:28:01.4064018' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (180, CAST(N'2021-06-16T09:28:30.9548671' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (181, CAST(N'2021-06-16T09:34:48.8122935' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (182, CAST(N'2021-06-16T09:36:51.1033561' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (183, CAST(N'2021-06-16T09:37:20.7578791' AS DateTime2), N'EFGetOneUserQuery', N'3', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (184, CAST(N'2021-06-16T09:37:37.5090115' AS DateTime2), N'EFGetOneUserQuery', N'2', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (185, CAST(N'2021-06-16T09:37:45.5991268' AS DateTime2), N'EFGetOneUserQuery', N'4', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (186, CAST(N'2021-06-16T09:37:55.8053338' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (187, CAST(N'2021-06-16T09:45:35.9689320' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (188, CAST(N'2021-06-16T09:49:39.8449982' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (189, CAST(N'2021-06-16T10:01:19.4999987' AS DateTime2), N'EFGetCommentsQuery', N'{"Username":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (190, CAST(N'2021-06-16T10:38:44.4161042' AS DateTime2), N'EFGetCommentsQuery', N'{"Username":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (191, CAST(N'2021-06-16T10:40:11.5419515' AS DateTime2), N'EFGetOneUserQuery', N'4', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (192, CAST(N'2021-06-16T10:40:19.0175834' AS DateTime2), N'EFGetOneUserQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (193, CAST(N'2021-06-16T13:26:44.5878207' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Admin Name","LastName":"Admin Surname","Username":"Admin","Email":"gacanoviccc97@gmail.com","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (194, CAST(N'2021-06-16T13:34:15.8136158' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marko","LastName":"Gacanovic","Username":"Gacho97","Email":"marko.gacanovic.38.17@ict.edu.rs","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (195, CAST(N'2021-06-16T13:37:49.6185068' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marec","LastName":"Novling","Username":"marec11","Email":"marec.ict@gmail.com","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (196, CAST(N'2021-06-16T13:40:44.2750268' AS DateTime2), N'EFGetUseCaseLogQuery', N'{"Actor":null,"UseCaseName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (197, CAST(N'2021-06-16T14:32:13.6318420' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marko","LastName":"Gacanovic","Username":"Admin","Email":"gacanoviccc97@gmail.com","Password":"sifra123"}', N'Gacho97')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (198, CAST(N'2021-06-16T14:32:37.9975284' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marko","LastName":"Gacanovic","Username":"Admin","Email":"gacanoviccc97@gmail.com","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (199, CAST(N'2021-06-16T14:33:46.8536005' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Marec","LastName":"Markovic","Username":"User","Email":"marec.ict@gmail.com","Password":"sifra123"}', N'Unauthorized user')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (200, CAST(N'2021-06-16T14:38:50.2284254' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Ekologija"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (201, CAST(N'2021-06-16T14:39:07.3595364' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Drustvo"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (202, CAST(N'2021-06-16T14:39:20.0347578' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Zdravlje"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (203, CAST(N'2021-06-16T14:39:27.5658900' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Sport"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (204, CAST(N'2021-06-16T14:39:33.1666204' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Tehnologija"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (205, CAST(N'2021-06-16T14:39:48.8782902' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Istorija"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (206, CAST(N'2021-06-16T14:39:52.3380016' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Ljubav"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (207, CAST(N'2021-06-16T14:39:56.2759844' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Umetnost"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (208, CAST(N'2021-06-16T14:40:04.8741942' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Filozofija"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (209, CAST(N'2021-06-16T14:40:11.4038281' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Obrazovanje"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (210, CAST(N'2021-06-16T14:40:20.9591858' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Ljudska prava"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (211, CAST(N'2021-06-16T14:40:30.6795463' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Zivotni stil"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (212, CAST(N'2021-06-16T14:40:43.2853000' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Religija"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (213, CAST(N'2021-06-16T14:40:52.7033651' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Kultura"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (214, CAST(N'2021-06-16T14:41:07.1114438' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Nauka"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (215, CAST(N'2021-06-16T14:41:10.6007196' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"IT"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (216, CAST(N'2021-06-16T14:41:26.9709754' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Zabava"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (217, CAST(N'2021-06-16T14:41:30.4970389' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Film"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (218, CAST(N'2021-06-16T14:41:33.7822824' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Muzika"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (219, CAST(N'2021-06-16T14:42:01.3070031' AS DateTime2), N'EFCreateCategoryCommand', N'{"Id":0,"Name":"Buducnost"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (220, CAST(N'2021-06-16T15:03:59.3633239' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Tutto il rosa della vita","Content":"Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.","IdPicture":18,"BlogCategories":[{"IdBlog":0,"IdCategory":7},{"IdBlog":0,"IdCategory":15}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (221, CAST(N'2021-06-16T15:08:39.0159930' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Umetnost pregovaranja","Content":"Različiti nesporazumi neretko završavaju sličnim pitanjem - kako li bi se sve to razrešilo u nekom drugačijem okruženju? Naime, da li se i tu radi o nekakvoj stečenoj kulturi komunikacije, običajima i manirima, ili postoji nešto treće važnije. Sudeći po onome što govori Kris Vos, vodeći pregovarač FBI-a za rešavanje talačkih kriza, iza svakog uspešnog društva stoji umetnost, i to ne bilo koja, već ona pregovaranja.","IdPicture":17,"BlogCategories":[{"IdBlog":0,"IdCategory":13},{"IdBlog":0,"IdCategory":15},{"IdBlog":0,"IdCategory":5},{"IdBlog":0,"IdCategory":13}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (222, CAST(N'2021-06-16T15:09:22.1360777' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Umetnost pregovaranja","Content":"Različiti nesporazumi neretko završavaju sličnim pitanjem - kako li bi se sve to razrešilo u nekom drugačijem okruženju? Naime, da li se i tu radi o nekakvoj stečenoj kulturi komunikacije, običajima i manirima, ili postoji nešto treće važnije. Sudeći po onome što govori Kris Vos, vodeći pregovarač FBI-a za rešavanje talačkih kriza, iza svakog uspešnog društva stoji umetnost, i to ne bilo koja, već ona pregovaranja.","IdPicture":17,"BlogCategories":[{"IdBlog":0,"IdCategory":13},{"IdBlog":0,"IdCategory":15},{"IdBlog":0,"IdCategory":5}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (223, CAST(N'2021-06-16T15:11:35.1634286' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Еуросонг - канализација ласера","Content":"Певушиш? Бацио си токсичну зомби-шалитру у вис, хладњак копма је почео да ради унатраг, усисао то, консултовао матичну плочу, скривену жеравицу и саветника, напунио је аудио светлом, потерао процесор јаче, и напослетку избљунуо све то гадно и отровно варничење у етар и сажео у виртуелну слепу улицу пуну контејнера и бачених лутки које „певају“ ","IdPicture":14,"BlogCategories":[{"IdBlog":0,"IdCategory":22},{"IdBlog":0,"IdCategory":17},{"IdBlog":0,"IdCategory":20},{"IdBlog":0,"IdCategory":11}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (224, CAST(N'2021-06-16T15:14:41.5670333' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Vesnici Proleća","Content":"Proljece na moje rame slijece, djurdjevak zeleni, djurdjevak zeleni…  nit proleća, nit đurđevka zelenog, ono, rame je tu ali koja vajda od njega kada se čas smrzavam kao da su me ostavili na Antarktiku na jedno pešes godina da se adaptiram, čas se znojim kao da kulučim neprekidno. Kako izdržavam, kako te promene izdržavamo svi kad bi i čelik popustio! Pošto živim u gradu asfaltiranom i zabetoniranom, visibaba, kukureka, jagorčevina i lastavica, notornih vesnika Proleća, nema ni u tragovima, štono bi rekli hemićari. Umesto vesnika, ja imam Vesića","IdPicture":17,"BlogCategories":[{"IdBlog":0,"IdCategory":4},{"IdBlog":0,"IdCategory":5},{"IdBlog":0,"IdCategory":6}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (225, CAST(N'2021-06-16T15:16:13.6795580' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Hešteg dilema","Content":"Na Netfliksu je nedavno prikazan dokumentarac “Socijalna dilema” ili “Dilema društvenih mreža” u kome su se verovatno po prvi put na istom mestu našli rodonačelnici gotovo svih poznatih društvenih mreža, kako govore o osnovnim idejama i principima koji su u njih ugrađeni. Odnosno, o njihovoj dobrobiti, ali jednako, ako ne i više, i o opasnostima koje sa sobom nose.","IdPicture":16,"BlogCategories":[{"IdBlog":0,"IdCategory":8},{"IdBlog":0,"IdCategory":19},{"IdBlog":0,"IdCategory":23}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (226, CAST(N'2021-06-16T15:37:55.1876223' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Kartica, PIN","Content":"Kada ste dobili svoju kreditnu/debitnu ili neku drugu karticu od banke, sigurno su Vam skrenuli pažnju na to kako da je čuvate, kako da brinete o svom PIN-u i kako da je koristite na bankomatima, prodajnim mestima i slično. Ispod su neki od uobičajenh saveta, radi podsećanja (skupljeno sa nekoliko mesta na Internetu, neće škoditi). Slobodno podelite svoja saznanja, iskustva, pa i greške. Tema bloga je šta mislite o pristupu zaštiti PIN-a od strane gospodina/gospođe sa slike?","IdPicture":13,"BlogCategories":[{"IdBlog":0,"IdCategory":8},{"IdBlog":0,"IdCategory":19},{"IdBlog":0,"IdCategory":5}]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (227, CAST(N'2021-06-16T15:41:38.2857281' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":null,"IdBlog":8,"IdParent":null,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (228, CAST(N'2021-06-16T15:41:53.8139536' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Interesantno, nisam razmisljao o tome.","IdBlog":8,"IdParent":null,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (229, CAST(N'2021-06-16T15:42:25.6306221' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Disagree.","IdBlog":8,"IdParent":7,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (230, CAST(N'2021-06-16T15:43:02.5431014' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"I am very happy to hear this.","IdBlog":3,"IdParent":null,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (231, CAST(N'2021-06-16T15:43:13.9407521' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Tutto","IdBlog":3,"IdParent":null,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (232, CAST(N'2021-06-16T15:43:33.9621946' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Ne slusam tu muziku.","IdBlog":5,"IdParent":null,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (233, CAST(N'2021-06-16T15:44:30.6795357' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Muzika je kvalitetna.","IdBlog":5,"IdParent":11,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (234, CAST(N'2021-06-16T15:45:04.1803185' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Subjektivno misljenje.","IdBlog":5,"IdParent":12,"IdUser":0}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (235, CAST(N'2021-06-16T15:48:14.2811838' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":5,"Status":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (236, CAST(N'2021-06-16T15:48:20.7593041' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":5,"Status":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (237, CAST(N'2021-06-16T15:48:33.5967596' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":5,"Status":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (238, CAST(N'2021-06-16T15:48:59.3809923' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":5,"Status":2}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (239, CAST(N'2021-06-16T15:49:11.5299895' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":5,"Status":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (240, CAST(N'2021-06-16T15:49:26.1299422' AS DateTime2), N'EFLikeBlog', N'{"IdUser":24,"IdBlog":7,"Status":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (241, CAST(N'2021-06-16T19:06:26.4750665' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (242, CAST(N'2021-06-16T19:09:30.8468393' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":5,"Title":"Tutto il rosa della vita!!","Content":"Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.","IdPicture":18,"IdUser":0,"BlogCategories":[7,15]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (243, CAST(N'2021-06-16T19:10:36.1351519' AS DateTime2), N'EFDeleteBlogCommand', N'5', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (244, CAST(N'2021-06-16T19:13:47.1977329' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":null}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (245, CAST(N'2021-06-16T19:14:36.6614651' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":null}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (246, CAST(N'2021-06-16T19:15:42.9823947' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":null}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (247, CAST(N'2021-06-16T19:16:43.3524974' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":null}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (248, CAST(N'2021-06-16T19:17:51.6205259' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":[]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (249, CAST(N'2021-06-16T19:18:50.8249081' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":null,"Content":null,"IdPicture":0,"IdUser":24,"BlogCategories":[]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (250, CAST(N'2021-06-16T19:20:15.1501650' AS DateTime2), N'EFUpdatePersonalBlogCommand', N'{"Id":5,"Title":"Tutto il rosa della vita!!","Content":"Na ovogodišnjem Giro d''Italia najbolje se snašao Egan Bernal, posle 16 završenih etapa nalazi se na prvom mestu Generalnog Plasmana sa 2min 24sec prednosti nad drugoplasiranim Damiano Carusom. Vođstvo je preuzeo pobedom na 9-toj etapi, i to sjajnim finišom na vrlo teškoj uzbrdici.","IdPicture":18,"IdUser":24,"BlogCategories":[12,15,17]}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (251, CAST(N'2021-06-16T19:20:46.4890434' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (252, CAST(N'2021-06-16T19:20:50.2522850' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (253, CAST(N'2021-06-16T19:20:55.2434484' AS DateTime2), N'EFGetOneBlogQuery', N'8', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (254, CAST(N'2021-06-16T19:21:30.8316539' AS DateTime2), N'EFGetOneBlogQuery', N'9', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (255, CAST(N'2021-06-16T19:21:37.7278755' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (256, CAST(N'2021-06-16T19:22:11.6604060' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (257, CAST(N'2021-06-16T19:22:35.3698629' AS DateTime2), N'EFDeletePersonalBlogCommand', N'3', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (258, CAST(N'2021-06-16T21:37:45.1046016' AS DateTime2), N'EFGetOneUserQuery', N'8', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (259, CAST(N'2021-06-16T21:40:18.1906059' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Novi korisnik","LastName":"Prezime","Username":"User2","Email":"marko.gacanovic.38.17@ict.edu.rs","Password":"sifra123"}', N'Unauthorized user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (260, CAST(N'2021-06-16T21:41:10.3217303' AS DateTime2), N'EFGetOneUserQuery', N'7', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (261, CAST(N'2021-06-16T21:43:54.1336124' AS DateTime2), N'EFUpdatePeronsalCommentCommand', N'{"Id":12,"Text":"Bas kvalitet.","IdBlog":0,"IdParent":null,"IdUser":24}', N'User')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (262, CAST(N'2021-06-16T21:45:15.2841495' AS DateTime2), N'EFUpdatePeronsalCommentCommand', N'{"Id":13,"Text":"Procena je sjajna.","IdBlog":0,"IdParent":null,"IdUser":25}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (263, CAST(N'2021-06-16T21:46:37.0219979' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika","IdBlog":9,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (264, CAST(N'2021-06-16T21:47:14.9902649' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika","IdBlog":7,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (265, CAST(N'2021-06-16T21:47:38.8935678' AS DateTime2), N'EFDeleteCommentCommand', N'14', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (266, CAST(N'2021-06-16T21:48:53.9842487' AS DateTime2), N'EFDeleteCommentCommand', N'8', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (267, CAST(N'2021-06-16T21:49:45.3899997' AS DateTime2), N'EFDeletePersonalCommentCommand', N'14', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (268, CAST(N'2021-06-16T21:50:01.5674901' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika","IdBlog":7,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (269, CAST(N'2021-06-16T21:50:09.2133996' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika + 1","IdBlog":9,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (270, CAST(N'2021-06-16T21:50:31.4601553' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika + 1","IdBlog":4,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (271, CAST(N'2021-06-16T21:50:37.3231317' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Najnoviji komentar novog korisnika + 1 + ","IdBlog":4,"IdParent":null,"IdUser":0}', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (272, CAST(N'2021-06-16T22:05:50.3595609' AS DateTime2), N'EFGetOneUserQuery', N'15', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (273, CAST(N'2021-06-16T22:14:21.8796204' AS DateTime2), N'EFGetOneUserQuery', N'23', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (274, CAST(N'2021-06-16T22:14:43.9292046' AS DateTime2), N'EFGetOneBlogQuery', N'9', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (275, CAST(N'2021-06-16T22:14:56.3708124' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (276, CAST(N'2021-06-16T22:16:40.4326154' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'User2')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (277, CAST(N'2021-06-16T22:18:19.3284122' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (278, CAST(N'2021-06-16T22:21:23.6536889' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (279, CAST(N'2021-06-16T22:23:24.2312146' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (280, CAST(N'2021-06-16T22:26:43.7453115' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (281, CAST(N'2021-06-16T22:27:20.5197716' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (282, CAST(N'2021-06-16T22:28:56.5470857' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (283, CAST(N'2021-06-16T22:38:23.5610907' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (284, CAST(N'2021-06-16T22:39:17.4849285' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (285, CAST(N'2021-06-16T22:40:19.3085287' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (286, CAST(N'2021-06-16T22:41:51.5462396' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (287, CAST(N'2021-06-16T22:43:06.7351131' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (288, CAST(N'2021-06-16T22:46:13.2233791' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (289, CAST(N'2021-06-16T22:54:37.9004112' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (290, CAST(N'2021-06-16T22:55:48.1954541' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (291, CAST(N'2021-06-16T22:57:58.4136247' AS DateTime2), N'EFGetOneBlogQuery', N'3', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (292, CAST(N'2021-06-16T22:58:19.6605009' AS DateTime2), N'EFGetOneBlogQuery', N'4', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (293, CAST(N'2021-06-16T22:58:51.7848287' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (294, CAST(N'2021-06-16T22:59:44.6499646' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (295, CAST(N'2021-06-16T23:00:31.3600691' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (296, CAST(N'2021-06-16T23:01:04.2117498' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (297, CAST(N'2021-06-16T23:01:36.3768230' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (298, CAST(N'2021-06-16T23:02:55.6314215' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (299, CAST(N'2021-06-16T23:03:05.6080330' AS DateTime2), N'EFGetOneBlogQuery', N'4', N'Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (300, CAST(N'2021-06-16T23:03:11.5645660' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (301, CAST(N'2021-06-16T23:03:18.0550988' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (302, CAST(N'2021-06-16T23:03:34.6274176' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (303, CAST(N'2021-06-16T23:04:15.6987074' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (304, CAST(N'2021-06-16T23:04:23.5810538' AS DateTime2), N'EFGetOneBlogQuery', N'77', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (305, CAST(N'2021-06-16T23:04:30.2413773' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (306, CAST(N'2021-06-16T23:04:33.6293815' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (307, CAST(N'2021-06-16T23:05:09.4598593' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (308, CAST(N'2021-06-16T23:06:29.6445419' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (309, CAST(N'2021-06-16T23:06:39.4168126' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (310, CAST(N'2021-06-16T23:07:08.8056118' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (311, CAST(N'2021-06-16T23:07:11.9707190' AS DateTime2), N'EFGetOneBlogQuery', N'8', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (312, CAST(N'2021-06-16T23:07:14.0432147' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (313, CAST(N'2021-06-16T23:07:15.4958711' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (314, CAST(N'2021-06-16T23:07:17.4756056' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (315, CAST(N'2021-06-16T23:11:57.6453184' AS DateTime2), N'EFGetOneBlogQuery', N'5', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (316, CAST(N'2021-06-16T23:12:16.3576224' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (317, CAST(N'2021-06-16T23:13:15.4573677' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (318, CAST(N'2021-06-16T23:19:03.8459901' AS DateTime2), N'EFGetOneBlogQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (319, CAST(N'2021-06-16T23:19:18.3486557' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (320, CAST(N'2021-06-16T23:19:28.9602300' AS DateTime2), N'EFGetOneBlogQuery', N'8', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (321, CAST(N'2021-06-16T23:20:09.8529820' AS DateTime2), N'EFGetOneBlogQuery', N'8', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (322, CAST(N'2021-06-16T23:20:35.7205688' AS DateTime2), N'EFGetOneBlogQuery', N'8', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (323, CAST(N'2021-06-17T12:11:07.2905842' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Biciklom oko sveta -- Tehnološki napredak (Nagasaki, Japan)","Content":"Trebalo je da mi se SAMO zalemi jedna žičica na kablu za napajanje laptopa. Pokidala se pa se gubio kontakt i zato se baterija nije punila.","IdPicture":15,"BlogCategories":[{"IdBlog":0,"IdCategory":17}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (324, CAST(N'2021-06-17T12:12:17.9751349' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Igra Imena","Content":"Malo (korisne) zabave uz najavu hladnijeg vremena i snega. Kada objašnjavamo različite tehničke koncepte studentima i drugima, obično se trudimo da osmislimo pogodne scenarije i da tako, na praktičnim situacijama, prikažemo primere koji te koncepte čine lakšim za razumevanje.","IdPicture":13,"BlogCategories":[{"IdBlog":0,"IdCategory":17},{"IdBlog":0,"IdCategory":12},{"IdBlog":0,"IdCategory":10}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (325, CAST(N'2021-06-17T12:13:15.4915354' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"TROGLAVI protiv DVA FEJSBUK PLEMENA","Content":"Обично се сматра да је Интернет створио виртуелност. Истина је обрнута: виртуелност је створила Интернет. Уметници су одавно открили виртуелну стварност, она је само добила то име у наше доба. И читаоци, нагнути над књижевним делом, стварају виртуелне ситуације и субјекте који актуелизују смисао текста кроз различите интерпретације. Француски филозоф Пјер Леви сматра да је феномен виртуелности много шири и да превазилази границе информатизације и нашег времена, да је он суштинско обележје који прати људски род од његовог настанка и испољава се кроз тежњу за превазилажењем задатих оквира и временско-просторних одредница. Виртуелност, пише Леви, није супротна стварности већ је «плодан и моћан модус бивствовања, који даје замаха стваралачким процесима, отвара перспективе, дуби изворе смисла испод површине непосредног физичког присуства»","IdPicture":11,"BlogCategories":[{"IdBlog":0,"IdCategory":11},{"IdBlog":0,"IdCategory":4},{"IdBlog":0,"IdCategory":6}]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (326, CAST(N'2021-06-17T12:13:20.7613155' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (327, CAST(N'2021-06-17T12:17:58.5919553' AS DateTime2), N'EFUpdateBlogCommand', N'{"Id":11,"Title":"TROGLAVI PROTIV DVA FEJSBUK PLEMENA","Content":"Обично се сматра да је Интернет створио виртуелност. Истина је обрнута: виртуелност је створила Интернет. Уметници су одавно открили виртуелну стварност, она је само добила то име у наше доба. И читаоци, нагнути над књижевним делом, стварају виртуелне ситуације и субјекте који актуелизују смисао текста кроз различите интерпретације. Француски филозоф Пјер Леви сматра да је феномен виртуелности много шири и да превазилази границе информатизације и нашег времена, да је он суштинско обележје који прати људски род од његовог настанка и испољава се кроз тежњу за превазилажењем задатих оквира и временско-просторних одредница. Виртуелност, пише Леви, није супротна стварности већ је «плодан и моћан модус бивствовања, који даје замаха стваралачким процесима, отвара перспективе, дуби изворе смисла испод површине непосредног физичког присуства»","IdPicture":11,"IdUser":0,"BlogCategories":[11,4,6,7,9]}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (328, CAST(N'2021-06-17T12:18:59.5557049' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (329, CAST(N'2021-06-17T12:19:16.2283200' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (330, CAST(N'2021-06-17T12:20:28.7313499' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":"pravo","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (331, CAST(N'2021-06-17T12:20:45.4851619' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":"Zabava","PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (332, CAST(N'2021-06-17T12:21:00.7200824' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (333, CAST(N'2021-06-17T12:21:11.3220205' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (334, CAST(N'2021-06-17T12:21:37.9525034' AS DateTime2), N'EDGetCategoriesQuery', N'{"Name":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (335, CAST(N'2021-06-17T12:23:13.9183569' AS DateTime2), N'EFGetOneCategoryQuery', N'6', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (336, CAST(N'2021-06-17T12:23:20.7289582' AS DateTime2), N'EFGetOneCategoryQuery', N'9', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (337, CAST(N'2021-06-17T12:23:40.9378236' AS DateTime2), N'EFGetCommentsQuery', N'{"Username":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (338, CAST(N'2021-06-17T12:23:54.0837105' AS DateTime2), N'EFGetOneUserQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (339, CAST(N'2021-06-17T12:24:08.9060658' AS DateTime2), N'EFGetOneUserQuery', N'8', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (340, CAST(N'2021-06-17T12:24:11.4904200' AS DateTime2), N'EFGetOneUserQuery', N'9', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (341, CAST(N'2021-06-17T12:25:13.4272298' AS DateTime2), N'EFGetUsersQuery', N'{"Username":null,"Email":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (342, CAST(N'2021-06-17T12:26:28.3785181' AS DateTime2), N'EFRegisterUserCommand', N'{"FirstName":"Jovan","LastName":"Gacanovic","Username":"Jova","Email":"gacanovicm@yahoo.com","Password":"sifra123"}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (343, CAST(N'2021-06-17T12:30:08.9140073' AS DateTime2), N'EFCreateBlogCommand', N'{"Title":"Slobodan softver u nastavi","Content":"Slobodan softver u nastavi – Intervju sa profesorom informatike Goranom Jovišićem","IdPicture":16,"BlogCategories":[{"IdBlog":0,"IdCategory":8},{"IdBlog":0,"IdCategory":19},{"IdBlog":0,"IdCategory":23}]}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (344, CAST(N'2021-06-17T12:31:02.1682930' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Razvoj softvera na vrhuncu.","IdBlog":12,"IdParent":null,"IdUser":0}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (345, CAST(N'2021-06-17T12:31:33.2608141' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Razvoj softvera na vrhuncu. Dodatak","IdBlog":12,"IdParent":18,"IdUser":0}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (346, CAST(N'2021-06-17T12:31:42.5097050' AS DateTime2), N'EFCreateCommentCommand', N'{"Id":0,"Text":"Razvoj softvera na vrhuncu. Dodatak / Dodatak drugi","IdBlog":12,"IdParent":19,"IdUser":0}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (347, CAST(N'2021-06-17T12:31:59.0188272' AS DateTime2), N'EFGetOneBlogQuery', N'12', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (348, CAST(N'2021-06-17T12:32:43.2246637' AS DateTime2), N'EFLikeBlog', N'{"IdUser":26,"IdBlog":12,"Status":1}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (349, CAST(N'2021-06-17T12:54:11.4673135' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (350, CAST(N'2021-06-17T12:54:46.1426192' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (351, CAST(N'2021-06-17T12:55:59.5256097' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Jova')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (352, CAST(N'2021-06-17T12:56:58.2491114' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (353, CAST(N'2021-06-17T12:57:02.3586978' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (354, CAST(N'2021-06-17T12:57:47.6182045' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (355, CAST(N'2021-06-17T12:59:19.5205936' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (356, CAST(N'2021-06-17T13:04:37.3630937' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (357, CAST(N'2021-06-17T13:05:59.1612623' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (358, CAST(N'2021-06-17T13:06:33.6775982' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (359, CAST(N'2021-06-17T13:08:16.0189759' AS DateTime2), N'EFGetBlogsQuery', N'{"Title":null,"Content":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","IdCategory":null,"PerPage":5,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (360, CAST(N'2021-06-17T13:08:26.3124549' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (361, CAST(N'2021-06-17T13:09:01.9713593' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (362, CAST(N'2021-06-17T13:11:34.4780631' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (363, CAST(N'2021-06-17T13:11:56.4252182' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (364, CAST(N'2021-06-17T13:12:10.9364862' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (365, CAST(N'2021-06-17T13:13:30.4988733' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (366, CAST(N'2021-06-17T13:14:01.6269844' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (367, CAST(N'2021-06-17T13:15:29.9605044' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (368, CAST(N'2021-06-17T13:16:21.1219196' AS DateTime2), N'EFGetOneBlogQuery', N'7', N'Admin')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (23, N'Marko', N'Gacanovic', N'Admin', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'gacanoviccc97@gmail.com', CAST(N'2021-06-16T16:32:38.5169787' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (24, N'Marec', N'Markovic', N'User', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'marec.ict@gmail.com', CAST(N'2021-06-16T16:33:49.3267213' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (25, N'Novi korisnik', N'Prezime', N'User2', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'marko.gacanovic.38.17@ict.edu.rs', CAST(N'2021-06-16T23:40:20.7009127' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (26, N'Jovan', N'Gacanovic', N'Jova', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'gacanovicm@yahoo.com', CAST(N'2021-06-17T14:26:28.5508504' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (103, 23, 1, CAST(N'2021-06-16T16:32:38.5891774' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (104, 23, 21, CAST(N'2021-06-16T16:32:38.5892369' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (105, 23, 20, CAST(N'2021-06-16T16:32:38.5892363' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (106, 23, 19, CAST(N'2021-06-16T16:32:38.5892356' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (107, 23, 18, CAST(N'2021-06-16T16:32:38.5892350' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (108, 23, 17, CAST(N'2021-06-16T16:32:38.5892343' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (109, 23, 16, CAST(N'2021-06-16T16:32:38.5892336' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (110, 23, 15, CAST(N'2021-06-16T16:32:38.5892330' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (111, 23, 14, CAST(N'2021-06-16T16:32:38.5892323' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (112, 23, 13, CAST(N'2021-06-16T16:32:38.5892316' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (113, 23, 22, CAST(N'2021-06-16T16:32:38.5892376' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (114, 23, 12, CAST(N'2021-06-16T16:32:38.5892313' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (115, 23, 10, CAST(N'2021-06-16T16:32:38.5892300' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (116, 23, 9, CAST(N'2021-06-16T16:32:38.5892293' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (117, 23, 8, CAST(N'2021-06-16T16:32:38.5892287' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (118, 23, 7, CAST(N'2021-06-16T16:32:38.5892280' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (119, 23, 6, CAST(N'2021-06-16T16:32:38.5892273' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (120, 23, 5, CAST(N'2021-06-16T16:32:38.5892263' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (121, 23, 4, CAST(N'2021-06-16T16:32:38.5892257' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (122, 23, 3, CAST(N'2021-06-16T16:32:38.5892250' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (123, 23, 2, CAST(N'2021-06-16T16:32:38.5892237' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (124, 23, 11, CAST(N'2021-06-16T16:32:38.5892307' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (125, 23, 23, CAST(N'2021-06-16T16:32:38.5892383' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (126, 24, 5, CAST(N'2021-06-16T16:33:49.3939127' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (127, 24, 7, CAST(N'2021-06-16T16:33:49.3939601' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (128, 24, 10, CAST(N'2021-06-16T16:33:49.3939614' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (129, 24, 17, CAST(N'2021-06-16T16:33:49.3939624' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (130, 24, 19, CAST(N'2021-06-16T16:33:49.3939667' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (131, 24, 24, CAST(N'2021-06-16T16:33:49.3939677' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (132, 24, 25, CAST(N'2021-06-16T16:33:49.3939684' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (133, 24, 26, CAST(N'2021-06-16T16:33:49.3939690' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (134, 24, 27, CAST(N'2021-06-16T16:33:49.3939697' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (135, 24, 28, CAST(N'2021-06-16T16:33:49.3939703' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (136, 25, 5, CAST(N'2021-06-16T23:40:20.7672166' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (137, 25, 7, CAST(N'2021-06-16T23:40:20.7672507' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (138, 25, 10, CAST(N'2021-06-16T23:40:20.7672517' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (139, 25, 17, CAST(N'2021-06-16T23:40:20.7672523' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (140, 25, 19, CAST(N'2021-06-16T23:40:20.7672530' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (141, 25, 24, CAST(N'2021-06-16T23:40:20.7672537' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (142, 25, 25, CAST(N'2021-06-16T23:40:20.7672540' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (143, 25, 26, CAST(N'2021-06-16T23:40:20.7672547' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (144, 25, 27, CAST(N'2021-06-16T23:40:20.7672553' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (145, 25, 28, CAST(N'2021-06-16T23:40:20.7672557' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (146, 26, 5, CAST(N'2021-06-17T14:26:28.6000431' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (147, 26, 7, CAST(N'2021-06-17T14:26:28.6000759' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (148, 26, 10, CAST(N'2021-06-17T14:26:28.6000769' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (149, 26, 17, CAST(N'2021-06-17T14:26:28.6000772' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (150, 26, 19, CAST(N'2021-06-17T14:26:28.6000779' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (151, 26, 24, CAST(N'2021-06-17T14:26:28.6000782' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (152, 26, 25, CAST(N'2021-06-17T14:26:28.6000785' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (153, 26, 26, CAST(N'2021-06-17T14:26:28.6000792' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (154, 26, 27, CAST(N'2021-06-17T14:26:28.6000795' AS DateTime2), NULL, 1, 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [IdUser], [UseCaseId], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt]) VALUES (155, 26, 28, CAST(N'2021-06-17T14:26:28.6000799' AS DateTime2), NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
/****** Object:  Index [IX_BlogCategories_IdCategory]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogCategories_IdCategory] ON [dbo].[BlogCategories]
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_IdPicture]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_IdPicture] ON [dbo].[Blogs]
(
	[IdPicture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_IdUser]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_IdUser] ON [dbo].[Blogs]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_IdBlog]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_IdBlog] ON [dbo].[Comments]
(
	[IdBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_IdParent]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_IdParent] ON [dbo].[Comments]
(
	[IdParent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_IdUser]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_IdUser] ON [dbo].[Comments]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_IdBlog]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Likes_IdBlog] ON [dbo].[Likes]
(
	[IdBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_IdUser]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Likes_IdUser] ON [dbo].[Likes]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_IdUser]    Script Date: 6/17/2021 5:29:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_IdUser] ON [dbo].[UserUseCases]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlogCategories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[BlogCategories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [IdPicture]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (N'') FOR [Content]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (N'') FOR [CommentText]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (N'') FOR [ImagePath]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Blogs_IdBlog] FOREIGN KEY([IdBlog])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Blogs_IdBlog]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Categories_IdCategory] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Categories_IdCategory]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Pictures_IdPicture] FOREIGN KEY([IdPicture])
REFERENCES [dbo].[Pictures] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Pictures_IdPicture]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users_IdUser]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_IdBlog] FOREIGN KEY([IdBlog])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_IdBlog]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_IdParent] FOREIGN KEY([IdParent])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_IdParent]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_IdUser]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Blogs_IdBlog] FOREIGN KEY([IdBlog])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Blogs_IdBlog]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Users_IdUser]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_IdUser]
GO
USE [master]
GO
ALTER DATABASE [Blog] SET  READ_WRITE 
GO
