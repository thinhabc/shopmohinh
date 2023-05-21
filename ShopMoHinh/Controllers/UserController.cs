using ShopMoHinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopMoHinh.Controllers
{
    public class UserController : Controller
    {
        DataShopMoHinhDataContext data = new DataShopMoHinhDataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register( FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HoTen"];
            var taikhoan = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            
             if(String.IsNullOrEmpty(taikhoan))
            {
                ViewData["loi2"] = "Tên đăng nhập không được để trống";
            }
            else if(String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Hãy nhập mật khẩu của bạn";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = taikhoan;
                kh.MatKhau = matkhau;
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
            else if(String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi2"] = "Hãy nhập mật khẩu của bạn";
            }
            else
            {
                KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.TaiKhoan == username && n.MatKhau == matkhau);
                if(kh != null)
                {
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
    }
}