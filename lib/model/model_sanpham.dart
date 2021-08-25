class  ModelSanPham{
    String maSP;
    String tenSP;
    String donGia;
    String ngayCapNhap;
    String chiTiet;
    String moTa;
    String hinhAnh;
    String soLuongTon;
    String luotXem;
    String luotBinhChon;
    String luotBinhLuan;
    String soLanMua;
    String moi;
    String maNCC;
    String maNSX;
    String maLoaiSP;
    String daXoa;
    String tenLoai;
    String tenNCC;
    String tenNSX;

    ModelSanPham({
        required this.maSP,
       required this.tenSP,required this.donGia,required this.ngayCapNhap,
       required this.chiTiet,required this.moTa,required this.hinhAnh,required this.soLuongTon,required this.luotXem,
       required   this.luotBinhChon,required this.luotBinhLuan,required this.soLanMua,required this.moi,
       required this.maNCC,required this.maNSX,required this.maLoaiSP,required this.daXoa,required this.tenLoai,
       required this.tenNCC,required this.tenNSX});

    factory ModelSanPham.fromJson(Map<String, dynamic> json) {
       return ModelSanPham(
           maSP: json['MaSP'] ,
           tenSP: json['TenSP'] ,
           donGia: json['DonGia']  ,
           ngayCapNhap: json['NgayCapNhap']  ,
           chiTiet: json['ChiTiet']  ,
           moTa: json['MoTa']  ,
           hinhAnh: json['HinhAnh']  ,
           soLuongTon: json['SoLuongTon']  ,
           luotXem: json['LuotXem']  ,
           luotBinhChon: json['LuotBinhChon']  ,
           luotBinhLuan: json['LuotBinhLuan']  ,
           soLanMua: json['SoLanMua']  ,
           moi: json['Moi']  ,
           maNCC: json['MaNCC']  ,
           maNSX: json['MaNSX']  ,
           maLoaiSP: json['MaLoaiSP']  ,
           daXoa: json['DaXoa']  ,
           tenLoai: json['TenLoai']  ,
           tenNCC: json['TenNCC']  ,
           tenNSX: json['TenNSX']
       );
    }
}