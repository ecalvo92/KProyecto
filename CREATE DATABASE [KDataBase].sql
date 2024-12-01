USE [master]
GO

CREATE DATABASE [KDataBase]
GO

USE [KDataBase]
GO

CREATE TABLE [dbo].[tCarrito](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[ConsecutivoProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tError](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Origen] [varchar](50) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_tError] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tProducto](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Imagen] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tRol](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol_1] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[CorreoElectronico] [varchar](80) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[ConsecutivoRol] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[TieneContrasennaTemp] [bit] NOT NULL,
	[FechaVencimientoTemp] [datetime] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (2, N'Sustagen 1', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 25, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (3, N'Sustagen 2', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 25, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (4, N'Sustagen 3', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 25, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (5, N'Sustagen 4', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 25, N'/ImgProductos/2.jpg')
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([Consecutivo], [NombreRol]) VALUES (1, N'Doctor(a)')
GO
INSERT [dbo].[tRol] ([Consecutivo], [NombreRol]) VALUES (2, N'Paciente')
GO
INSERT [dbo].[tRol] ([Consecutivo], [NombreRol]) VALUES (3, N'Director(a)')
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [ConsecutivoRol], [Activo], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (2, N'304590415', N'Eduardo Calvo Castillo', N'ecalvo90415@ufide.ac.cr', N'90415', 2, 1, 0, CAST(N'2021-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [ConsecutivoRol], [Activo], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'305530487', N'Keilyn Navarro', N'knavarro30487@ufide.ac.cr', N'30487', 3, 1, 0, CAST(N'2024-10-22T19:33:13.583' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [ConsecutivoRol], [Activo], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (6, N'402690786', N'Vladimir Conejo Oviedo', N'vconejo90786@ufide.ac.cr', N'90786', 1, 1, 0, CAST(N'2024-11-12T18:22:28.633' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_CorreoElectronico] UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tProducto]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tUsuario]
GO

ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tRol] ([Consecutivo])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

CREATE PROCEDURE [dbo].[ActualizarContrasenna]
	@ContrasennaTemp		VARCHAR(80),
	@TieneContrasennaTemp	BIT,
	@FechaVencimientoTemp	DATETIME,
	@Consecutivo			BIGINT
AS
BEGIN
	
	UPDATE	dbo.tUsuario
	   SET	Contrasenna = @ContrasennaTemp,
			TieneContrasennaTemp = @TieneContrasennaTemp,
			FechaVencimientoTemp = @FechaVencimientoTemp
	 WHERE	Consecutivo = @Consecutivo
	
END
GO

CREATE PROCEDURE [dbo].[ActualizarPerfil]
	@Identificacion		varchar(20),
	@Nombre				varchar(255),
	@CorreoElectronico	varchar(80),
	@Consecutivo		bigint,
	@ConsecutivoRol		INT
AS
BEGIN
	
	UPDATE	dbo.tUsuario
	   SET	Identificacion = @Identificacion,
			Nombre = @Nombre,
			CorreoElectronico = @CorreoElectronico,
			ConsecutivoRol = CASE	WHEN @ConsecutivoRol != 0 
									THEN @ConsecutivoRol
									ELSE ConsecutivoRol END
	 WHERE	Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ConsultarCarritoUsuario] 
	@Consecutivo BIGINT
AS
BEGIN

	SELECT	C.Consecutivo,
			ConsecutivoUsuario,
			ConsecutivoProducto,
			P.Precio,
			C.Cantidad,
			Fecha,
			(P.Precio * C.Cantidad) 'Total',
			P.Nombre
	FROM	tCarrito C
	INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
	WHERE C.ConsecutivoUsuario = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[InicioSesion]
	@Identificacion		varchar(20),
	@Contrasenna		varchar(10)
AS
BEGIN

	SELECT	U.Consecutivo,
			Identificacion,
			Nombre,
			CorreoElectronico,
			Contrasenna,
			ConsecutivoRol,
			Activo,
			R.NombreRol,
			TieneContrasennaTemp,
			FechaVencimientoTemp
	  FROM	dbo.tUsuario U 
	  INNER JOIN dbo.tRol R ON U.ConsecutivoRol = R.Consecutivo
	  WHERE Identificacion = @Identificacion
		AND	Contrasenna	= @Contrasenna
		AND Activo = 1

END
GO

CREATE PROCEDURE [dbo].[RegistroUsuario]
	@Identificacion		varchar(20),
	@Nombre				varchar(255),
	@CorreoElectronico	varchar(80),
	@Contrasenna		varchar(10)
AS
BEGIN

	IF NOT EXISTS(	SELECT	1 
					FROM	dbo.tUsuario 
					WHERE	Identificacion = @Identificacion
						AND	CorreoElectronico = @CorreoElectronico)
	BEGIN
		INSERT INTO dbo.tUsuario (Identificacion,Nombre,CorreoElectronico,Contrasenna, ConsecutivoRol,Activo,TieneContrasennaTemp,FechaVencimientoTemp)
		VALUES (@Identificacion,@Nombre,@CorreoElectronico,@Contrasenna,2,1,0,GETDATE())
	END

END
GO