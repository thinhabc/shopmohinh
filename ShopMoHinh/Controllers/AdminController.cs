using ShopMoHinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using PagedList;
using PagedList.Mvc;
using System.IO;

namespace ShopMoHinh.Controllers
{
    public class AdminController : Controller
    {
        DataShopMoHinhDataContext data = new DataShopMoHinhDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["admin"] == null || Session["admin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        public ActionResult MoHinh(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(data.MoHinhs.ToList().OrderBy(n => n.MaMoHinh).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult LoaiMH(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(data.ChuDes.ToList().OrderBy(n => n.MaCD).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult addNewCD()
        {
            return View();
        }
        [HttpPost]
        public ActionResult addNewCD( ChuDe cd)
        {
            data.ChuDes.InsertOnSubmit(cd);
            data.SubmitChanges();
            return RedirectToAction("LoaiMH");

        }

        [HttpGet]
        public ActionResult DeleteCD(int id)
        {
            ChuDe cd = data.ChuDes.SingleOrDefault(n => n.MaCD == id);
            return View(cd);
        }
        [HttpPost, ActionName("DeleteCD")]
        public ActionResult XHDeleteCD(int id)
        {
            ChuDe cd = data.ChuDes.SingleOrDefault(n => n.MaCD == id);
            data.ChuDes.DeleteOnSubmit(cd);
            data.SubmitChanges();
            return RedirectToAction("LoaiMH");
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["UserAdmin"];
            var mk = collection["PassWord"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["loi1"] = "Phải nhập UserName";
            }
            else if (String.IsNullOrEmpty(mk))
            {
                ViewData["loi2"] = "Phải nhập password";
            }
            else
            {
                Admin ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassWord == mk);
                if (ad != null)
                {
                    Session["admin"] = ad;
                    return RedirectToAction("Index");
                }
                else
                    ViewBag.thongbao = "UserNam hoặc PassWord không đúng";
            }
            return View();
        }
        [HttpGet]
        public ActionResult addNewProduct()
        {
            ViewBag.MaCD = new SelectList(data.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaNXB = new SelectList(data.NhaXuatBans.ToList().OrderBy(n => n.MaNXB), "MaNXB", "TenNXB");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult addNewProduct( MoHinh mh, HttpPostedFileBase file)
        {
           
            ViewBag.MaCD = new SelectList(data.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaNXB = new SelectList(data.NhaXuatBans.ToList().OrderBy(n => n.MaNXB), "MaNXB", "TenNXB");
            if (file == null)
            {
                ViewBag.thongbao = "Vui lòng chọn ảnh bìa";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lưu tên file
                    var fileName = Path.GetFileName(file.FileName);
                    // lưu đường dẫn file
                    var path = Path.Combine(Server.MapPath("~/"), fileName);
                    //Kiểm tra hình ảnh đã tồn tại hay chưa
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        // lưu hình ảnh vào đường dẫn
                        file.SaveAs(path);
                    }
                    mh.AnhBia = fileName;
                    // lưu vào csdl
                    data.MoHinhs.InsertOnSubmit(mh);
                    data.SubmitChanges();
                }
            }    
            return RedirectToAction("MoHinh");
        }
        [HttpGet]
        public ActionResult Delete( int id)
        {
            MoHinh mh = data.MoHinhs.SingleOrDefault(n => n.MaMoHinh == id);
            if ( mh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(mh);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult XacNhanDelete( int id)
        {
            MoHinh mh = data.MoHinhs.SingleOrDefault(n => n.MaMoHinh == id);
            if (mh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.MoHinhs.DeleteOnSubmit(mh);
            data.SubmitChanges();
            return RedirectToAction("MoHinh");
        }
        [HttpGet]
        public ActionResult Edit( int id)
        {
            MoHinh mh = data.MoHinhs.SingleOrDefault(n => n.MaMoHinh == id);
            if (mh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaCD = new SelectList(data.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe", mh.MaCD);
            ViewBag.MaNXB = new SelectList(data.NhaXuatBans.ToList().OrderBy(n => n.MaNXB), "MaNXB", "TenNXB", mh.MaNXB);
            return View(mh);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(MoHinh mh, HttpPostedFileBase file)
        {

            ViewBag.MaCD = new SelectList(data.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaNXB = new SelectList(data.NhaXuatBans.ToList().OrderBy(n => n.MaNXB), "MaNXB", "TenNXB");
            if (file == null)
            {
                ViewBag.thongbao = "Vui lòng chọn ảnh bìa";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lưu tên file
                    var fileName = Path.GetFileName(file.FileName);
                    // lưu đường dẫn file
                    var path = Path.Combine(Server.MapPath("~/"), fileName);
                    //Kiểm tra hình ảnh đã tồn tại hay chưa
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        // lưu hình ảnh vào đường dẫn
                        file.SaveAs(path);
                    }
                    mh.AnhBia = fileName;
                    // lưu vào csdl
                    UpdateModel(mh);
                    data.SubmitChanges();
                }
            }
            return RedirectToAction("MoHinh");
        }
        public ActionResult KhachHang( int ? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            return View(data.KhachHangs.ToList().OrderBy(n => n.MaKH).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult addNewKH()
        {
            return View();
        }
        [HttpPost]
        public ActionResult addNewKH(KhachHang kh)
        {
            data.KhachHangs.InsertOnSubmit(kh);
            data.SubmitChanges();
            return RedirectToAction("KhachHang");

        }

        [HttpGet]
        public ActionResult DeleteKH(int id)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            return View(kh);
        }
        [HttpPost, ActionName("DeleteKH")]
        public ActionResult XHDeleteKH(int id)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            data.KhachHangs.DeleteOnSubmit(kh);
            data.SubmitChanges();
            return RedirectToAction("KhachHang");
        }

        public ActionResult DonDatHang(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(data.DonDatHangs.ToList().OrderBy(n => n.SoDH).ToPagedList(pageNumber, pageSize));
        }
    }
}