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

CREATE TABLE [dbo].[tDetalle](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoMaestro] [bigint] NOT NULL,
	[ConsecutivoProducto] [bigint] NOT NULL,
	[CantidadPagada] [int] NOT NULL,
	[PrecioUnitarioPagado] [decimal](18, 2) NOT NULL,
	[TotalProducto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetallle] PRIMARY KEY CLUSTERED 
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

CREATE TABLE [dbo].[tMaestro](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[TotalPagado] [decimal](18, 2) NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_tMaestro] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

SET IDENTITY_INSERT [dbo].[tDetalle] ON 
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (3, 2, 2, 3, CAST(12500.00 AS Decimal(18, 2)), CAST(37500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (4, 2, 5, 25, CAST(12500.00 AS Decimal(18, 2)), CAST(312500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (5, 3, 2, 22, CAST(12500.00 AS Decimal(18, 2)), CAST(275000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (6, 3, 3, 1, CAST(12500.00 AS Decimal(18, 2)), CAST(12500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (7, 3, 4, 2, CAST(12500.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (8, 4, 3, 24, CAST(12500.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (9, 5, 3, 1, CAST(12500.00 AS Decimal(18, 2)), CAST(12500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (10, 5, 4, 5, CAST(12500.00 AS Decimal(18, 2)), CAST(62500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (11, 6, 4, 3, CAST(12500.00 AS Decimal(18, 2)), CAST(37500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (12, 7, 4, 3, CAST(12500.00 AS Decimal(18, 2)), CAST(37500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (13, 8, 4, 3, CAST(12500.00 AS Decimal(18, 2)), CAST(37500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([Consecutivo], [ConsecutivoMaestro], [ConsecutivoProducto], [CantidadPagada], [PrecioUnitarioPagado], [TotalProducto]) VALUES (14, 9, 4, 2, CAST(12500.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tDetalle] OFF
GO

SET IDENTITY_INSERT [dbo].[tError] ON 
GO
INSERT [dbo].[tError] ([Consecutivo], [Mensaje], [FechaHora], [Origen], [ConsecutivoUsuario]) VALUES (1, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-10T19:35:45.893' AS DateTime), N'InicioSesion', 0)
GO
INSERT [dbo].[tError] ([Consecutivo], [Mensaje], [FechaHora], [Origen], [ConsecutivoUsuario]) VALUES (2, N'Referencia a objeto no establecida como instancia de un objeto.', CAST(N'2024-12-10T19:40:58.223' AS DateTime), N'AgregarProducto', 4)
GO
SET IDENTITY_INSERT [dbo].[tError] OFF
GO

SET IDENTITY_INSERT [dbo].[tMaestro] ON 
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (2, 2, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2024-12-03T20:28:32.400' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (3, 2, CAST(312500.00 AS Decimal(18, 2)), CAST(N'2024-12-03T20:32:06.787' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (4, 6, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T18:33:53.110' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (5, 6, CAST(75000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T18:36:26.027' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (6, 4, CAST(37500.00 AS Decimal(18, 2)), CAST(N'2024-12-10T18:39:20.073' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (7, 6, CAST(37500.00 AS Decimal(18, 2)), CAST(N'2024-12-10T18:39:53.820' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (8, 4, CAST(37500.00 AS Decimal(18, 2)), CAST(N'2024-12-10T18:44:34.607' AS DateTime))
GO
INSERT [dbo].[tMaestro] ([Consecutivo], [ConsecutivoUsuario], [TotalPagado], [FechaCompra]) VALUES (9, 6, CAST(25000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T19:06:15.983' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tMaestro] OFF
GO

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (2, N'Sustagen 1', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 2, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (3, N'Sustagen 2', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 4, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (4, N'Sustagen 3', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 6, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (5, N'Sustagen 4', N'Es un alimento en polvo que ofrece un equilibrio de nutrientes para complementar la dieta habitual de niños, deportistas y personas debilitadas. Se presenta en latas de 200 o 450 gramos.', CAST(12500.00 AS Decimal(18, 2)), 8, N'/ImgProductos/2.jpg')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (6, N'Play Station 5', N'adsdsa', CAST(123213.00 AS Decimal(18, 2)), 12321, N'')
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Descripcion], [Precio], [Cantidad], [Imagen]) VALUES (7, N'Play Station 5', N'dasdsadsadsa', CAST(123213.00 AS Decimal(18, 2)), 12321, N'')
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

ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tMaestro] FOREIGN KEY([ConsecutivoMaestro])
REFERENCES [dbo].[tMaestro] ([Consecutivo])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tMaestro]
GO

ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tProducto]
GO

ALTER TABLE [dbo].[tMaestro]  WITH CHECK ADD  CONSTRAINT [FK_tMaestro_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tMaestro] CHECK CONSTRAINT [FK_tMaestro_tUsuario]
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

CREATE PROCEDURE [dbo].[ConsultarDetalleFactura] 
	@ConsecutivoMaestro BIGINT
AS
BEGIN

	SELECT	D.ConsecutivoMaestro 'ConsecutivoMaestro',
			Nombre 'NombreProducto',
			CantidadPagada 'Cantidad',
			PrecioUnitarioPagado 'Precio',
			TotalProducto 'Total'
	FROM	tDetalle D
	INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
	WHERE D.ConsecutivoMaestro = @ConsecutivoMaestro

END
GO

CREATE PROCEDURE [dbo].[ConsultarFacturas] 
	@Consecutivo BIGINT
AS
BEGIN

	SELECT	M.Consecutivo 'ConsecutivoMaestro',
			Nombre 'NombreCliente',
			TotalPagado 'Total',
			FechaCompra 'Fecha'
	FROM	tMaestro M
	INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
	WHERE M.ConsecutivoUsuario = @Consecutivo

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

CREATE PROCEDURE [dbo].[PagarCarrito]
	@Consecutivo BIGINT
AS
BEGIN


	INSERT INTO dbo.tMaestro (ConsecutivoUsuario,TotalPagado,FechaCompra)
    SELECT ConsecutivoUsuario, SUM(P.Precio * C.Cantidad), GETDATE()
	FROM tCarrito C
	INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
	WHERE ConsecutivoUsuario = @Consecutivo
	GROUP BY ConsecutivoUsuario


	DECLARE @Factura BIGINT
	SET @Factura = @@IDENTITY


	INSERT INTO dbo.tDetalle (ConsecutivoMaestro,ConsecutivoProducto,CantidadPagada,PrecioUnitarioPagado,TotalProducto)
    SELECT @Factura, ConsecutivoProducto, C.Cantidad, P.Precio, (P.Precio * C.Cantidad)
	FROM tCarrito C
	INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
	WHERE ConsecutivoUsuario = @Consecutivo

     
	UPDATE	P
	SET		P.Cantidad = P.Cantidad - C.Cantidad
	FROM	tProducto P
	INNER JOIN tCarrito C ON C.ConsecutivoProducto = P.Consecutivo
	WHERE ConsecutivoUsuario = @Consecutivo


	DELETE FROM dbo.tCarrito
	WHERE ConsecutivoUsuario = @Consecutivo 


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

CREATE PROCEDURE [dbo].[ValidarCantidadInventario]
	@ConsecutivoUsuario BIGINT
AS
BEGIN
	
	SELECT	C.Cantidad 'CANTIDAD_DESEADA', P.Cantidad 'CANTIDAD_DISPONIBLE'
	FROM	tCarrito C
	INNER	JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
	WHERE	C.Cantidad > P.Cantidad
		AND C.ConsecutivoUsuario = @ConsecutivoUsuario

END
GO