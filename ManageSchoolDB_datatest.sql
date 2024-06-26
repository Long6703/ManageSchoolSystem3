USE [ManageSchoolSystem]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[TimetableID] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[AttendanceStatus] [nvarchar](20) NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassCourses]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassCourses](
	[ClassID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[Grade] [float] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterID] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourses]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourses](
	[userid] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[TimetableID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[Slot] [int] NULL,
	[DayOfWeek] [int] NULL,
	[CourseID] [int] NULL,
	[userid] [int] NULL,
	[Room] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[SemesterID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimetableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/6/2024 2:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[displayName] [nvarchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[email] [varchar](200) NULL,
	[class_id] [int] NULL,
	[role] [varchar](200) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([class_id], [class_name]) VALUES (1, N'SE6703')
INSERT [dbo].[Class] ([class_id], [class_name]) VALUES (2, N'SE2003')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (1, N'Nguyen Van A', N'11111111', N'nguyenvana@gmail.com', 1, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (2, N'Nguyen Van B', N'22222222', N'nguyenvanb@gmail.com', 1, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (3, N'Long', N'123443212', N'123@123', 2, N'student', 0)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (4, N'Nguyen Van D', N'44444444', N'nguyenvand@gmail.com', 1, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (5, N'Nguyen Khac Long', N'1234567890', N'nguyenkhaclong@gmail.com', NULL, N'teacher', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (6, N'Nguyen Van E', N'5555555555', N'nguyenvane@gmail.com', 2, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (7, N'Nguyen Van F', N'6666666666', N'nguyenvanf@gmail.com', 2, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (8, N'Nguyen Van G', N'7777777777', N'nguyenvang@gmail.com', 2, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (9, N'Nguyen Van H', N'8888888888', N'nguyenvanh@gmail.com', 2, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (10, N'Nguyen Van Math', N'9999999999', N'nguyenvanmath@gmail.com', NULL, N'teacher', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (11, N'Nguyen Van DBI', N'9876543210', N'nguyenvandbi@gmail.com', NULL, N'teacher', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (13, N'Nguyen Nguyen Nguyen', N'4564564564', N'123@123456', 2, N'student', 0)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (14, N'Nguyen', N'123', N'123@123', NULL, N'student', 1)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (15, N'Nguyen Van F', N'1234567890', N'123@123', 1, N'student', 0)
INSERT [dbo].[Users] ([userid], [displayName], [phone_number], [email], [class_id], [role], [isActive]) VALUES (16, N'Nguyen Van M', N'1234432121', N'nguyenvanm123@123', 1, N'student', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Grades] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Timetable] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([TimetableID])
REFERENCES [dbo].[Timetable] ([TimetableID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[ClassCourses]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[ClassCourses]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[TeacherCourses]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[TeacherCourses]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semesters] ([SemesterID])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
