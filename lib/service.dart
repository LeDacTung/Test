import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_dondathang.dart';
import 'package:flutter_doan/model/model_loai_sp.dart';
import 'package:flutter_doan/model/model_ncc.dart';
import 'package:flutter_doan/model/model_nxb.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/model/model_thanhvien.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
String strHttp="https://ledtandroid.000webhostapp.com/doan_kiemthu/";


List<ModelSanPham> parseResponseSanPham(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelSanPham>((json) => ModelSanPham.fromJson(json)).toList();
}

List<ModelLoaiSP> parseResponseLoaiSP(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelLoaiSP>((json) => ModelLoaiSP.fromJson(json)).toList();
}

List<ModelNXB> parseResponseNXB(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelNXB>((json) => ModelNXB.fromJson(json)).toList();
}


List<ModelThanhVien> parseResponseThanhVien(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelThanhVien>((json) => ModelThanhVien.fromJson(json)).toList();
}

List<ModelDonDH> parseResponseDonDH(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelDonDH>((json) => ModelDonDH.fromJson(json)).toList();
}

List<ModelNCC> parseResponseNCC(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelNCC>((json) => ModelNCC.fromJson(json)).toList();
}

class NCC{
  Future<List<ModelNCC>> nha_cung_cap() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/nha_cung_cap.php";
    var response = await http.get(Uri.parse(url) );

    if (response.statusCode == 200) {
      List<ModelNCC> list =parseResponseNCC(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }
}

class SanPham{

  Future<String> insert_sanpham(TenSP, DonGia, NgayCapNhap, ChiTiet, MoTa, HinhAnh, SoLuongTon, MaNCC, MaNSX, MaLoaiSP) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/insert_sanpham.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "TenSP":TenSP,
        "DonGia":DonGia,
        "NgayCapNhap":NgayCapNhap,
        "ChiTiet":ChiTiet,
        "MoTa":MoTa,
        "HinhAnh":HinhAnh,
        "SoLuongTon":SoLuongTon,

        "LuotXem":"0",
        "LuotBinhChon":"0",
        "LuotBinhLuan":"0",
        "SoLanMua":"0",
        "Moi":"0",

        "MaNCC":MaNCC,
        "MaNSX":MaNSX,
        "MaLoaiSP":MaLoaiSP,
        "DaXoa" :"false"
      },
    );

    return response.body;
  }

  Future<List<ModelSanPham>> getSanPham_all() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/searchSanPhamWithTenSP.php";
    var response = await http.get(Uri.parse(url) );

    if (response.statusCode == 200) {
      List<ModelSanPham> list =parseResponseSanPham(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }

  Future<List<ModelSanPham>> getSanPham_1() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/sanpham_1.php";
    var response = await http.get(Uri.parse(url) );

    if (response.statusCode == 200) {
      List<ModelSanPham> list =parseResponseSanPham(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }

  Future<List<ModelSanPham>> getSanPham_2() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/sanpham_2.php";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<ModelSanPham> list =parseResponseSanPham(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }

  Future<List<ModelSanPham>> getSanPham_3() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/sanpham_3.php";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<ModelSanPham> list =parseResponseSanPham(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }

  Future<List<ModelSanPham>> getSanPham_4() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/sanpham_4.php";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<ModelSanPham> list =parseResponseSanPham(response.body);
      return list;
    }

    // something wrong happened
    return [];
  }
  Future<List<ModelLoaiSP>>  loaiSanPham() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/loai_sanpham.php";
    var response = await http.get(Uri.parse(url));

    List<ModelLoaiSP> list =parseResponseLoaiSP(response.body);
    return list;
  }

  Future<List<ModelNXB>>  nhaXuatBan() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/nha_xuat_ban.php";
    var response = await http.get(Uri.parse(url));

    List<ModelNXB> list =parseResponseNXB(response.body);
    return list;
  }

  Future<List<ModelSanPham>>  sanPhamTheoTheLoai(MaLoaiSP) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/sanpham_theloai.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "MaLoaiSP":MaLoaiSP,
      },
    );

    List<ModelSanPham> list =parseResponseSanPham(response.body);
    if(list.length !=0){
      return list;
    }
    return [];
  }

  Future<List<ModelSanPham>>  searchSanPhamWithTenSP(tenSP) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/searchSanPhamWithTenSP.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "TenSP":tenSP,
      },
    );

    List<ModelSanPham> list =parseResponseSanPham(response.body);
    if(list.length !=0){
      return list;
    }
    return [];
  }


}

class DonHang{

  Future<List<ModelDonDH>> get_don_dat_hang() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/don_dat_hang.php";
    var response = await http.get(Uri.parse(url) );

    // something wrong happened
    List<ModelDonDH> list =parseResponseDonDH(response.body);
    return list;
  }

  Future<String>  postKhachHang(email, tenkh, diachi, sdt) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/insertKhachhang.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "Email":email,
        "TenKH":tenkh,
        "DiaChi":diachi,
        "SoDienThoai":sdt,
        "MaThanhVien":"1",
      },

    );
    return response.body;
  }

  Future<String> postDonDatHang(ngaydat, ngaygiao, makh) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/insertDonDatHang.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "NgayDat":ngaydat,
        "TinhTrangGiaoHang":"dang",
        "NgayGiao":ngaygiao,
        "DaThanhToan":"true",
        "MaKH":makh,
        "UuDai":"50",
        "DaHuy":"true",
        "DaXoa":"false",
      },
    );

    return response.body;
  }

  Future<String> postChiTietDonDatHang(maddh, masp, tensp, soluong, dongia) async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/insertChiTietDonDatHang.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "MaDDH":maddh,
        "MaSP":masp,
        "TenSP":tensp,
        "SoLuong":soluong,
        "DonGia":dongia,
      },
    );

    return response.body;
  }
}



Future<List<ModelThanhVien>> loginAdminUser(email, password) async {
  var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/login_ADMIN_USER.php";
  var response = await http.post(
    Uri.parse(url),
    body: {
        "EmailThanhVien" : email,
        "MatKhau":password
    },
  );

  List<ModelThanhVien> list =parseResponseThanhVien(response.body);
  if(list.length !=0){
    return list;
  }
  return [];
}

Future<List<ModelThanhVien>> allThanhVien() async {
  var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/all_ThanhVien.php";
  var response = await http.get(Uri.parse(url));

  List<ModelThanhVien> list =parseResponseThanhVien(response.body);
  if(list.length !=0){
    return list;
  }
  return [];
}

class Count{
  Future<String> count_user() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/count/count_user.php";
    var response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<String> count_product() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/count/count_product.php";
    var response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<String> count_order() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/count/count_order.php";
    var response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<String> count_money() async {
    var url ="https://ledtandroid.000webhostapp.com/doan_kiemthu/count/count_money.php";
    var response = await http.get(Uri.parse(url));
    return response.body;
  }

}