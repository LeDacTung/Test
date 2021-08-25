class ModelNCC{
  String MaNCC;
  String TenNCC;
  String DiaChi;
  String Email;
  String SoDienThoai;
  String Fax;

  ModelNCC({
    required this.MaNCC,
    required this.TenNCC,
    required this.DiaChi,
    required this.Email,
    required this.SoDienThoai,
    required this.Fax
});

  factory ModelNCC.fromJson(Map<String , dynamic> map){
    return ModelNCC(
        MaNCC: map["MaNCC"],
        TenNCC:  map["TenNCC"],
        DiaChi:  map["DiaChi"],
        Email:  map["Email"],
        SoDienThoai:  map["SoDienThoai"],
        Fax:  map["Fax"]
    );
  }
}