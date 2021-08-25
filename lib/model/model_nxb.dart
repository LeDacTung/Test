class ModelNXB{
  String MaNSX, TenNSX, ThongTin, Logo;

  ModelNXB({
    required this.MaNSX,
    required this.TenNSX,
    required this.ThongTin,
    required this.Logo
});
  factory ModelNXB.fromJson(Map<String, dynamic> json) {
    return ModelNXB(
        MaNSX: json["MaNSX"],
        TenNSX: json["TenNSX"],
        ThongTin: json["ThongTin"],
        Logo: json["Logo"]
    );
  }
}