class ModelDonDH{
  String MaDDH, NgayDat, TinhTrangGiaoHang ,NgayGiao, DaThanhToan, MaKH, UuDai, DaHuy, DaXoa;

  String TenKH, DiaChi, Email, SoDienThoai, MaThanhVien, MaChiTietDDH, MaSP, TenSP, SoLuong, DonGia;


  ModelDonDH({
   required  this.MaDDH,
    required   this.NgayDat,
    required   this.TinhTrangGiaoHang,
    required   this.NgayGiao,
    required  this.DaThanhToan,
    required   this.MaKH,
    required   this.UuDai,
    required   this.DaHuy,
    required   this.DaXoa,
    required this.TenKH,
    required   this.DiaChi,
    required   this.Email,
    required   this.SoDienThoai,
    required   this.MaThanhVien,
    required this.MaChiTietDDH,
    required  this.MaSP,
    required  this.TenSP,
    required  this.SoLuong,
    required  this.DonGia
});

  factory ModelDonDH.fromJson(Map<String, dynamic> json){
    return ModelDonDH(
        MaDDH: json["MaDDH"],
        NgayDat: json["NgayDat"],
        TinhTrangGiaoHang: json["TinhTrangGiaoHang"],
        NgayGiao: json["NgayGiao"],
        DaThanhToan: json["DaThanhToan"],
        MaKH: json["MaKH"],
        UuDai: json["UuDai"],
        DaHuy: json["DaHuy"],
        DaXoa: json["DaXoa"],
        TenKH: json["TenKH"],
        DiaChi: json["DiaChi"],
        Email: json["Email"],
        SoDienThoai: json["SoDienThoai"],
        MaThanhVien: json["MaThanhVien"],
        MaChiTietDDH: json["MaChiTietDDH"],
        MaSP: json["MaSP"],
        TenSP: json["TenSP"],
        SoLuong: json["SoLuong"],
        DonGia: json["DonGia"]
    );
  }
}