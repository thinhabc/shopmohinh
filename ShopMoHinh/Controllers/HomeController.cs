using ShopMoHinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ShopMoHinh.Controllers
{
    public class HomeController : Controller
    {
        DataShopMoHinhDataContext data = new DataShopMoHinhDataContext();
        private List<MoHinh> newProduct(int count)
        {
            return data.MoHinhs.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        // GET: Home
        public ActionResult Index()
        {
            var product = newProduct(12);
            return View(product);
        }
        public ActionResult Chude()
        {
            var chude = from cd in data.ChuDes select cd;
            return PartialView(chude);
        }
        public ActionResult SpTheochude( int id)
        {
            var product = from s in data.MoHinhs where s.MaCD == id select s;
            return View(product);
        }
        public ActionResult Details (int id)
        {
            var product = from p in data.MoHinhs where p.MaMoHinh == id select p;
            return View(product.Single());
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HoTen"];
            var taikhoan = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            var email = collection["Email"];
            var diachi = collection["DiachiKH"];
            var sdt = collection["DienThoaiKH"];
            var ngaySinh = collection["NgaySinh"];

            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["loi1"] = "Họ Tên khách hàng không được để trống";
            }
            else if (String.IsNullOrEmpty(taikhoan))
            {
                ViewData["loi2"] = "Tên đăng nhập không được để trống";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Hãy nhập mật khẩu của bạn";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["loi4"] = "Email không được để trống";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["loi5"] = "Dịa chỉ không được để trống";
            }
            else if (String.IsNullOrEmpty(sdt))
            {
                ViewData["loi6"] = "Số điện thoại không được để trống";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = taikhoan;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienThoaiKH = sdt;
                kh.NgaySinh = DateTime.Parse(ngaySinh);
                data.KhachHangs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Login");
            }
            return this.Register();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Login(FormCollection collection)
        {
            var username = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            if (String.IsNullOrEmpty(username))
            {
                ViewData["loi1"] = "Hãy nhập tên đăng nhập của bạn";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi2"] = "Hãy nhập mật khẩu của bạn";
            }
            else
            {
                KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.TaiKhoan == username && n.MatKhau == matkhau);
                if (kh != null)
                {
                    Session["fullName"] = kh.HoTen;
                    Session["IdKH"] = kh.MaKH;
                    ViewBag.Thongbao = "Chào mừng bạn đến với Shop Mô Hình";
                    Session["TaiKhoan"] = kh;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
        public ActionResult Intro()
        {
            return View();
        }
        public ActionResult Handbook()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}