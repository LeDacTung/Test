class ModelLoaiSP{
  String MaLoaiSP, TenLoai, Icon, BiDanh;

  ModelLoaiSP({
    required this.MaLoaiSP,
    required this.TenLoai,
    required this.Icon,
    required this.BiDanh
});

  factory ModelLoaiSP.fromJson(Map<String, dynamic> json) {
    return ModelLoaiSP(
        MaLoaiSP: json["MaLoaiSP"],
        TenLoai: json["TenLoai"],
        Icon: json["Icon"],
        BiDanh: json["BiDanh"]
    );
  }
}

class DropListLoaiSP{
  final List<ModelLoaiSP> list;
  DropListLoaiSP(this.list);
}