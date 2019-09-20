-- create table SAS for the SAS name list and import data (not automated)
CREATE TABLE [GRN\EJing].[SAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SAS_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Population] [nvarchar](10) NULL
) ON [PRIMARY]

-- create table Data_Item for the datalist and import data (not automated)
CREATE TABLE [GRN\EJing].[Data_Item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NOT NULL,
	[text] [nvarchar](100) NULL,
	[SAS_id] [int] NULL
) ON [PRIMARY]

--create table Unit_Record for testfile. Data automated populated process is not impletemented, but could discuss the logic.
CREATE TABLE [GRN\EJing].[Unit_Record](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Record_number] [int] NOT NULL,
	[SAS_id] [int] NOT NULL,
	[Data_Item_id] [int] NOT NULL
) ON [PRIMARY]


--Insight exploary example
-- join reference tables to Unit_Record table which transform Unit_Record information to text format
select a.Record_number,b.[SAS_name], b.[Description], c.[text] as [Response]
into #Unit_Record_Transformed
from [GRN\EJing].[Unit_Record] a left join [GRN\EJing].[SAS] b
on a.SAS_id=b.id
left join [GRN\EJing].[Data_Item] c
on a.Data_Item_id = c.id
where [SAS_name] in ('AGE99','Sex','ALCF3')


select a.Record_number,
a.Age_Band,
b.Sex,
c.Response

into #temp
from 
(select Record_number,[Response] as Age_band

From  Unit_Record_Transformed
where [SAS_name]='AGE99'
) as a
left join 
  (select Record_number,[Response] as Sex

From  Unit_Record_Transformed
where [SAS_name]='Sex'
) as b
on a.Record_number = b.Record_number

left join 
 (select Record_number,[Response] as Response
From  [Unit_Record_Transformed
where [SAS_name]='ALCF3' --Frequency of consuming 3 or more drinks a day in the last 12 months, which applies to persons 15 years and over
) as c
on a.Record_number = c.Record_number

select Age_band,
Sex,
Response,
Count(Record_number) as cnt
from #temp
group by 
Age_band,
Sex,
Response

--The above summary information could be analysed in R, e.g. ggplot2 to show the distribution in graph, or Pivot table or graph in Power BI or Excel.


