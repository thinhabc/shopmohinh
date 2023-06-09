USE [master]
GO
/****** Object:  Database [ShopMoHinh]    Script Date: 9/20/2022 3:53:52 PM ******/
CREATE DATABASE [ShopMoHinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopMoHinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopMoHinh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopMoHinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopMoHinh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopMoHinh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopMoHinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopMoHinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopMoHinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopMoHinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopMoHinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopMoHinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopMoHinh] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopMoHinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopMoHinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopMoHinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopMoHinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopMoHinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopMoHinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopMoHinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopMoHinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopMoHinh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopMoHinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopMoHinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopMoHinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopMoHinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopMoHinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopMoHinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopMoHinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopMoHinh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopMoHinh] SET  MULTI_USER 
GO
ALTER DATABASE [ShopMoHinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopMoHinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopMoHinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopMoHinh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopMoHinh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopMoHinh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopMoHinh] SET QUERY_STORE = OFF
GO
USE [ShopMoHinh]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassWord] [varchar](30) NOT NULL,
	[NameAdmin] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDatHang]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatHang](
	[SoDH] [int] NOT NULL,
	[MaMoHinh] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [Pk_ChiTietDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaMoHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [Pk_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
 CONSTRAINT [Pk_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienThoaiKH] [varchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [Pk_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoHinh]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoHinh](
	[MaMoHinh] [int] IDENTITY(1,1) NOT NULL,
	[TenMoHinh] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
 CONSTRAINT [Pk_MoHinh] PRIMARY KEY CLUSTERED 
(
	[MaMoHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 9/20/2022 3:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [Pk_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassWord], [NameAdmin]) VALUES (N'admin', N'123456', N'Đinh Văn Thinh')
GO
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (1, 9, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (2, 9, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (3, 5, 20, CAST(375000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (3, 11, 23, CAST(450000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (4, 8, 7, CAST(500000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (4, 11, 1, CAST(450000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (5, 16, 5, CAST(290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (6, 9, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (6, 17, 4, CAST(199000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaMoHinh], [SoLuong], [DonGia]) VALUES (6, 29, 1, CAST(200000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (1, N'Mô Hình Pokemon')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (2, N'Mô Hình One Piece')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (3, N'Mô Hình Naruto')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (1, 5, CAST(N'2022-06-29T15:25:12.597' AS DateTime), CAST(N'2022-07-08T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (2, 6, CAST(N'2022-06-30T15:29:59.077' AS DateTime), CAST(N'2022-07-04T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (3, 10, CAST(N'2022-07-09T13:54:17.140' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (4, 10, CAST(N'2022-07-09T16:25:02.917' AS DateTime), CAST(N'2022-07-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (5, 10, CAST(N'2022-08-03T20:38:30.950' AS DateTime), CAST(N'2022-08-11T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (6, 10, CAST(N'2022-08-03T20:46:29.067' AS DateTime), CAST(N'2022-08-11T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiachiKH], [DienThoaiKH], [NgaySinh]) VALUES (5, N'Huỳnh Quốc Kiệt', N'sau1234', N'1234', N'huynhquockiet12t4@gmail.com', N'Bạc Liêu', N'0945757832', CAST(N'2001-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiachiKH], [DienThoaiKH], [NgaySinh]) VALUES (6, N'Lê Minh Nhựt', N'nhut123', N'123', N'Nhikim080@gmail.com', N'Đồng Tháp', N'0123456789', CAST(N'2001-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiachiKH], [DienThoaiKH], [NgaySinh]) VALUES (10, N'Đinh Văn Thịnh', N'thinhpro', N'123456', N'vanthinhd12@gmail.com', N'Bình Thuận', N'0855000304', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[MoHinh] ON 

INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (3, N'Mô Hình Zoro GK Sauron Làm Bằng Tay Cưỡi Đầu Rồng Cực Chất', CAST(450000 AS Decimal(18, 0)), N'<ul>
                        <li>
                            <p>Tên nhân vật: Zoro</p>
                        </li>
                        <li>
                            <p>Manga – Anime​: One Piece</p>
                        </li>
                        <li>
                            <p>Chiều cao:  42 cm</p>
                        </li>
                        <li>
                            <p>Bộ sản phẩm gồm: Nhân vật cơ bản</p>
                        </li>
                        <li>
                            <p>Chất liệu: PVC</p>
                        </li>
                        <li>
                            <p>Tình trạng: Còn mới</p>
                        </li>
                        <li>
                            <p>Hàng Order trước ( Không có sẵn )</p>
                        </li>
                    </ul>', N'Asset/Images/mohinh1.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (4, N'Mô Hình Luffy Gear 4 King Kong Gun Gomu Gomu No Mi', CAST(450000 AS Decimal(18, 0)), N'<ul><li>Tên nhân vật: Luffy mũ rơm</li>
<li>Manga – Anime: One Piece</li>
<li>Chiều cao: 25 cm</li>
<li>Bộ sản phẩm gồm: Nhân vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>Tình trạng: Còn mới</li>
<li>Chất liệu cao cấp, chắc chắn, Màu sắc đẹp mắt, Các chi tiết được làm vô cùng tỉ mỉ</li>
<li>Hàng Order trước ( Không có sẵn )</li>
</ul>', N'Asset/Images/mohinh2.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (5, N'Mô Hình Tứ Hoàng Shank Tóc Đỏ Siêu Ngầu Trang Trí Cao 25cm', CAST(375000 AS Decimal(18, 0)), N'<ul><li>Tên nhân vật: Tứ hoàng Shank tóc đỏ</li>
<li>Manga – Anime: One Piece</li>
<li>Chiều cao: 25 cm</li>
<li>Bộ sản phẩm gồm: Nhân vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>Tình trạng: Còn mới</li>
<li>Chất liệu cao cấp, chắc chắn, Màu sắc đẹp mắt, Các chi tiết được làm vô cùng tỉ mỉ</li>
<li>Hàng Order trước ( Không có sẵn )</li>
</ul>', N'Asset/Images/mohinh3.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (6, N'Mô Hình GK Tứ Hoàng Râu Trắng Trang Trí Làm Bằng Tay Cao 22cm', CAST(375000 AS Decimal(18, 0)), N'<ul><li>Tên nhân vật: Tứ hoàng râu trắng</li>
<li>Manga – Anime: One Piece</li>
<li>Chiều cao: 22 cm</li>
<li>Bộ sản phẩm gồm: Nhân vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>Tình trạng: Còn mới</li>
<li>Chất liệu cao cấp, chắc chắn, Màu sắc đẹp mắt, Các chi tiết được làm vô cùng tỉ mỉ</li>
<li>Hàng Order trước ( Không có sẵn )</li>
</ul>', N'Asset/Images/mohinh4.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (7, N'Mô Hình One Piece – Tứ Hoàng Kaido Trên Bãi Đá Nghệ Thuật Độc Đáo', CAST(450000 AS Decimal(18, 0)), N'<ul><li>Tên nhân vật: Tứ hoàng Kaido</li>
<li>Manga – Anime: One Piece</li>
<li>Chiều cao: 25 cm</li>
<li>Bộ sản phẩm gồm: Nhân vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>Tình trạng: Còn mới</li>
<li>Chất liệu cao cấp, chắc chắn, Màu sắc đẹp mắt, Các chi tiết được làm vô cùng tỉ mỉ</li>
<li>Hàng Order trước ( Không có sẵn )</li>
</ul>', N'Asset/Images/mohinh5.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (8, N'Mô Hình One Piece – Roronoa Zoro Three Swordsman Hot Hot Hot !!!', CAST(500000 AS Decimal(18, 0)), N'<ul>
                        <li>
                            <p>Tên nhân vật: Zoro</p>
                        </li>
                        <li>
                            <p>Manga – Anime​: One Piece</p>
                        </li>
                        <li>
                            <p>Chiều cao:  42 cm</p>
                        </li>
                        <li>
                            <p>Bộ sản phẩm gồm: Nhân vật cơ bản</p>
                        </li>
                        <li>
                            <p>Chất liệu: PVC</p>
                        </li>
                        <li>
                            <p>Tình trạng: Còn mới</p>
                        </li>
                        <li>
                            <p>Hàng Order trước ( Không có sẵn )</p>
                        </li>
                    </ul>', N'Asset/Images/mohinh6.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (9, N'Mô Hình One Piece – Roronoa Zoro Ngậm Kiếm Phiên Bản Cao Cấp', CAST(750000 AS Decimal(18, 0)), N'<ul>
                        <li>
                            <p>Tên nhân vật: Zoro</p>
                        </li>
                        <li>
                            <p>Manga – Anime​: One Piece</p>
                        </li>
                        <li>
                            <p>Chiều cao:  42 cm</p>
                        </li>
                        <li>
                            <p>Bộ sản phẩm gồm: Nhân vật cơ bản</p>
                        </li>
                        <li>
                            <p>Chất liệu: PVC</p>
                        </li>
                        <li>
                            <p>Tình trạng: Còn mới</p>
                        </li>
                        <li>
                            <p>Hàng Order trước ( Không có sẵn )</p>
                        </li>
                    </ul>', N'Asset/Images/mohinh7.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (11, N'Mô Hình Uchiha Itachi Susano Bàn Tay Linh Hồn Cao 17cm', CAST(450000 AS Decimal(18, 0)), N'<ul>
<li>
<p>T&ecirc;n nh&acirc;n vật: Uchiha Itachi Susano</p>
</li>
<li>
<p>Manga &ndash; Anime​: Naruto&nbsp;</p>
</li>
<li>
<p>Chiều cao: 17 cm</p>
</li>
<li>
<p>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</p>
</li>
<li>
<p>Chất liệu: PVC</p>
</li>
<li>
<p>T&igrave;nh trạng: C&ograve;n mới</p>
</li>
<li>
<p>Kiểu: cố định, kh&ocirc;ng thể cử động</p>
</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
</ul>', N'mo-hinh-uchiha-madara.jpg', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (13, N'Mô Hình Figure One Piece – Monkey D Luffy Sauron Snake', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Mokey D Luffy</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 18 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-figure-one-piece-monkey-d-luffy.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (15, N' Mô Hình Bộ Ba Anh Em Luffy, Ace, Sabo Dáng Đứng Cool Ngầu', CAST(300000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Luffy, Ace, Sabo</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao:&nbsp; 14 &ndash; 17 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng Order trước ( Kh&ocirc;ng c&oacute; sẵn )</strong></li>
<li>Chất liệu cao cấp, chắc chắn, M&agrave;u sắc đẹp mắt, C&aacute;c chi tiết được l&agrave;m v&ocirc; c&ugrave;ng tỉ mỉ</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
</ul>', N'mo-hinh-bo-ba-anh-em-luffy-ace-sabo.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (16, N'Mô Hình Hỏa Quyền Ace Tung Skill Lửa Cực Đỉnh', CAST(290000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Ace</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 17 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-hoa-quyen-ace-tung-skill-lua-cuc-dinh.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (17, N'Mô Hình Katakuri Three General Star Charlotte Full Set Figure', CAST(199000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Katakuri</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 18 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-katakuri.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (19, N'Mô Hình Nhân Vật Sanji Hắc Cước Chân Lửa Cao 30cm Trang Trí Quà Tặng Sinh Nhật', CAST(370000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Sanji</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 30 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-nhan-vat-sanji.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (20, N'Mô Hình Roronoa Zoro Kimono Wano Quốc Đứng Trên Nóc Nhà Cao 30cm', CAST(600000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Zoro</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao:&nbsp; 32 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng c&oacute; sẵn</strong></li>
</ul>', N'mo-hinh-roronoa-zoro.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (21, N'Mô Hình One Piece – Portgas D Ace Fire Boxing Cool Ngầu !!!', CAST(180000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uchiha Sasuke</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 18 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-one-piece-portgas-d-ace.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (22, N' Mô Hình One Piece – Monkey D Luffy Nightmare Awaken Chất Lượng Cao !!!', CAST(199000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Mokey D Luffy</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 13 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-one-piece-monkey-d-luffy.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (23, N'Luffy Sauron Chibi Vẽ Bằng Tay Cực Dễ Thương', CAST(99000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Mokey D Luffy</li>
<li>Manga &ndash; Anime​: One Piece</li>
<li>Chiều cao: 9 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-one-piece-luffy-chib.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 2, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (24, N' Mô Hình Boruto Trang Trí Bàn Học Làm Việc Cao 24cm', CAST(165000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uzumaki Boruto</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 24 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng Order trước ( Kh&ocirc;ng c&oacute; sẵn )</strong></li>
</ul>', N'mo-hinh-boruto.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (25, N' Mô Hình Uchiha Sasuke Susanoo Có LED Cao 32cm Trang Trí', CAST(450000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uchiha Sasuke</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 32 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
<li>Kiểu: cố định, kh&ocirc;ng thể cử động</li>
<li>Sản xuất: H&agrave;ng nội địa Trung Quốc</li>
</ul>', N'screenshot.png', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (26, N'Mô Hình Haruno Sakura Làm Bằng Tay Làm Quà Tặng Cao 22cm', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Haruno Sakura</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 22 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng Order trước ( Kh&ocirc;ng c&oacute; sẵn )</strong></li>
</ul>', N'mo-hinh-haruno-sakura.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (27, N' Mô Hình Hatake Kakashi Ninja World Wars Cầm Đao Cực Ngầu Cao 13cm', CAST(250000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Hatake Kakashi</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 20 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng Order trước ( Kh&ocirc;ng c&oacute; sẵn )</strong></li>
</ul>', N'mo-hinh-hatake-kakashi-ninja.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (28, N'Mô Hình Hokage Đệ Lục Hatake Kakashi 30cm Trang Trí Bàn Học', CAST(199000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Hatake Kakashi</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 30 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
<li>Kiểu giao h&agrave;ng: Kh&ocirc;ng c&oacute; h&agrave;ng sẵn, Order tầm 15 ng&agrave;y</li>
</ul>', N'mo-hinh-hokage.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (29, N'Add to wishlist Mô Hình Hokage Đệ Ngũ Tsunade Senju 30cm Trang Trí bàn Học', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Tsunade Senju</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 30 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
<li>Kiểu giao h&agrave;ng: Kh&ocirc;ng c&oacute; h&agrave;ng sẵn, Order tầm 15 ng&agrave;y</li>
</ul>', N'mo-hinh-hokage_ngu.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (30, N' Mô Hình Hokage Đệ Nhị Tobirama Senju Cao 30cm Trang Trí Bàn Học', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Tobirama Senju</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 30 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
<li>Kiểu giao h&agrave;ng: Kh&ocirc;ng c&oacute; h&agrave;ng sẵn, Order tầm 15 ng&agrave;y</li>
</ul>', N'mo-hinh-hokage-de-nhi.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (31, N' Mô Hình Hokage Đệ Thập Uzumaki Naruto Cao 30cm Trang Trí Bàn Làm Việc', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uzumaki Naruto</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 30 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li>Mục đ&iacute;ch: Trang tr&iacute; văn ph&ograve;ng, b&agrave;n l&agrave;m việc, sưu tầm, trưng b&agrave;y, qu&agrave; tặng,&hellip;</li>
<li>Kiểu giao h&agrave;ng: Kh&ocirc;ng c&oacute; h&agrave;ng sẵn, Order tầm 15 ng&agrave;y</li>
</ul>', N'mo-hinh-hokage-de-thap.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (32, N'Mô Hình Minato Trạng Thái Chakra Cửu Vĩ – Kyuubi Chakra Mode', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Minato</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 20 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
<li><strong>H&agrave;ng c&oacute; sẵn</strong></li>
</ul>', N'mo-hinh-minato.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (33, N'Mô Hình Naruto – Akatsuki Uchiha Itachi Crow Trang Trí Rất Đẹp', CAST(199000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uchiha Itachi</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 29 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-naruto.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
INSERT [dbo].[MoHinh] ([MaMoHinh], [TenMoHinh], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB]) VALUES (34, N'Mô Hình Naruto – Uchiha Itachi Bàn Tay Linh Hồn', CAST(800000 AS Decimal(18, 0)), N'<ul>
<li>T&ecirc;n nh&acirc;n vật: Uchiha Itachi</li>
<li>Manga &ndash; Anime​: Naruto</li>
<li>Chiều cao: 36 cm</li>
<li>Bộ sản phẩm gồm: Nh&acirc;n vật cơ bản</li>
<li>Chất liệu: PVC</li>
<li>T&igrave;nh trạng: C&ograve;n mới</li>
</ul>', N'mo-hinh-naruto-uchiha-itachi.jpg', CAST(N'2022-07-19T00:00:00.000' AS DateTime), 20, 3, 1)
SET IDENTITY_INSERT [dbo].[MoHinh] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (1, N'Conami', N'abc', N'0123456789')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__120746B45D07622B]    Script Date: 9/20/2022 3:53:52 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[DiachiKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__36935E01BBB03981]    Script Date: 9/20/2022 3:53:52 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[DienThoaiKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__KhachHan__62DC2CC74CEA82A9]    Script Date: 9/20/2022 3:53:52 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[NgaySinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D10534DDD59C14]    Script Date: 9/20/2022 3:53:52 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__D5B8C7F0011357D8]    Script Date: 9/20/2022 3:53:52 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [Fk_DonHang] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DonDatHang] ([SoDH])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [Fk_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [Fk_MoHinh] FOREIGN KEY([MaMoHinh])
REFERENCES [dbo].[MoHinh] ([MaMoHinh])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [Fk_MoHinh]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[MoHinh]  WITH CHECK ADD  CONSTRAINT [Fk_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
GO
ALTER TABLE [dbo].[MoHinh] CHECK CONSTRAINT [Fk_ChuDe]
GO
ALTER TABLE [dbo].[MoHinh]  WITH CHECK ADD  CONSTRAINT [Fk_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[MoHinh] CHECK CONSTRAINT [Fk_NhaXuatBan]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[MoHinh]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [ShopMoHinh] SET  READ_WRITE 
GO
