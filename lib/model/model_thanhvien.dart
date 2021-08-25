class ModelThanhVien{
  String EmailThanhVien, MatKhau, HoTen, DiaChi, SoDienThoai, CauHoi, CauTraLoi, MaLoaiTV;

  ModelThanhVien({
    required this.EmailThanhVien,
    required this.MatKhau,
    required this.HoTen,
    required this.DiaChi,
    required this.SoDienThoai,
    required this.CauHoi,
    required this.CauTraLoi,
    required this.MaLoaiTV
});
  factory ModelThanhVien.fromJson(Map<String, dynamic> json){
    return ModelThanhVien(
        EmailThanhVien: json["EmailThanhVien"],
        MatKhau: json["MatKhau"],
        HoTen: json["HoTen"],
        DiaChi: json["DiaChi"],
        SoDienThoai: json["SoDienThoai"],
        CauHoi: json["CauHoi"],
        CauTraLoi: json["CauTraLoi"],
        MaLoaiTV: json["MaLoaiTV"]
    );
  }
}