using ShopMoHinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopMoHinh.Controllers
{
    public class CartController : Controller
    {
        DataShopMoHinhDataContext data = new DataShopMoHinhDataContext();
        // lấy giỏ hàng
        public List<Cart> carts()
        {
            List<Cart> giohang = Session["giohang"] as List<Cart>;
            if (giohang == null)
            {
                giohang = new List<Cart>();
                Session["giohang"] = giohang;
            }
            return giohang;
        }
        // thêm sp vào giỏ hàng
        public ActionResult addCart( int maSP, string url)
        {
            List<Cart> giohang = carts();
            Cart sp = giohang.Find(n => n.maSP == maSP);
            if(sp == null)
            {
                sp = new Cart(maSP);
                giohang.Add(sp);
                return Redirect(url);
            }
            else
            {
                sp.soLuong++;
                return Redirect(url);
            }
        }
        // tổng số lượng
        public int tongSL()
        {
            int tongsl = 0;
            List<Cart> giohang = Session["giohang"] as List<Cart>;
            if(giohang != null)
            {
                tongsl = giohang.Sum(n => n.soLuong);
            }
            return tongsl;
        }
        // tổng tiền
        public double tongTien()
        {
            double tong = 0;
            List<Cart> giohang = Session["giohang"] as List<Cart>;
            if (giohang != null)
            {
                tong = giohang.Sum(n => n.thanhTien);
            }
            return tong;
        }
        // xây dựng trang giỏ hàng
        public ActionResult Cart()
        {
            List<Cart> giohang = carts();
            if( giohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TongSL = tongSL();
            ViewBag.TongTien = tongTien();
            return View(giohang);
        }
        public ActionResult ExitCart( int maSP)
        {
            List<Cart> giohang = carts();
            Cart sp = giohang.SingleOrDefault(n => n.maSP == maSP);
            if ( sp != null)
            {
                giohang.RemoveAll(n => n.maSP == maSP);
            }
            if (giohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Cart");
        }
        public ActionResult Cartpartial()
        {
            ViewBag.tongsl = tongSL();
            ViewBag.tongtien = tongTien();
            return PartialView();
        }
        
        public ActionResult Update( int maSP, FormCollection f)
        {
            List<Cart> giohang = carts();
            Cart sp = giohang.SingleOrDefault(n => n.maSP == maSP);
            if(sp != null)
            {
                sp.soLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("Cart");
        }
        [HttpGet]
        public ActionResult DonHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("Login", "Home");
            }
            if (Session["giohang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<Cart> giohang = carts();
            ViewBag.tongsl = tongSL();
            ViewBag.tongtien = tongTien();
            return View(giohang);
        }
        [HttpPost]
        public ActionResult DonHang(FormCollection collection)
        {
            DonDatHang dh = new DonDatHang();
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            List<Cart> gh = carts();
            dh.MaKH = kh.MaKH;
            dh.NgayDH = DateTime.Now;
            var ngaygiao = String.Format("{0:dd/MM/yyyy}", collection["NgayGiao"]);
            dh.NgayGiao = DateTime.Parse(ngaygiao);
            dh.TinhTrangGiaoHang = false;
            dh.DaThanhToan = false;
            data.DonDatHangs.InsertOnSubmit(dh);
            data.SubmitChanges();

            foreach(var item in gh)
            {
                ChiTietDatHang ct = new ChiTietDatHang();
                ct.SoDH = dh.SoDH;
                ct.MaMoHinh = item.maSP;
                ct.SoLuong = item.soLuong;
                ct.DonGia = (decimal)item.gia;
                data.ChiTietDatHangs.InsertOnSubmit(ct);
            }
            data.SubmitChanges();
            Session["giohang"] = null;
            return RedirectToAction("XacNhanDH", "Cart");
        }
        public ActionResult XacNhanDH()
        {
            return View();
        }
// GET: Cart
        public ActionResult Index()
        {
            return View();
        }
    }
}