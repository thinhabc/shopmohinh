using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopMoHinh.Models
{
    public class Cart
    {
        DataShopMoHinhDataContext data = new DataShopMoHinhDataContext();
        public int maSP { set; get; }
        public string tenSP { set; get; }
        public string anhBia { set; get; }
        public double gia { set; get; }
        public int soLuong { set; get; }
        public double thanhTien 
        { 
            get { return soLuong * gia; }
        }

        // khởi tạo giỏ hàng
        public Cart ( int MaMoHinh)
        {
            maSP = MaMoHinh;
            MoHinh mohinh = data.MoHinhs.Single(n => n.MaMoHinh == maSP);
            tenSP = mohinh.TenMoHinh;
            anhBia = mohinh.AnhBia;
            gia = double.Parse(mohinh.GiaBan.ToString());
            soLuong = 1;
        }
    }
}