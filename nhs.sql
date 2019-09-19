USE [Actuarial]
GO

/****** Object:  Table [GRN\EJing].[SAS]    Script Date: 19/09/2019 10:00:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [GRN\EJing].[SAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Population] [nvarchar](10) NULL
) ON [PRIMARY]

GO

USE [Actuarial]
GO

/****** Object:  Table [GRN\EJing].[Data_Item]    Script Date: 19/09/2019 10:07:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [GRN\EJing].[Data_Item](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[text] [nvarchar](100) NULL,
	[SAS_id] [int] NULL,
 CONSTRAINT [PK_Data_Item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

