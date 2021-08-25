import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_loai_sp.dart';
import 'package:flutter_doan/model/model_nxb.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/service.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_detail/screen_detail.dart';
import 'package:flutter_doan/wiget/custom_item_product.dart';


class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  _ScreenCategoryState createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {

  List<ModelLoaiSP> modelsLoaiSP =[];
  List<ModelNXB> modelsNXB =[];
  List<ModelSanPham> modelsSanPham =[];

  SanPham sanPham =new SanPham();
  int currentCategory=0;
  int currentItemProduct =-1;
  String maSanPham ="1";
  String imageCate ="https://cdn0.fahasa.com/media/wysiwyg/Thang-08-2021/Minh%20Long_1920-v3.jpg";

  _getSanPhamtheoLoai(masp){
    sanPham.sanPhamTheoTheLoai(masp).then((value){
      setState(() {
        modelsSanPham =value;
      });
    });
  }


  _getNhaXuatBan(){
    sanPham.nhaXuatBan().then((value){
     setState(() {
       modelsNXB =value;
     });
    });

    sanPham.loaiSanPham().then((value){
      setState(() {
        modelsLoaiSP =value;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _getNhaXuatBan();
    _getSanPhamtheoLoai(maSanPham);
  }



  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  SafeArea(
          child: Column(
            children: [
              Container(
                height: size.height/4,
                decoration: BoxDecoration(
                ),
                child: Image.asset(
                  "assets/banner_1.png",
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height/5,
                ),
              ),

              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(
                    top: 20,
                    left: 120,
                    right: 120
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: size.height*2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: Offset(2,2),
                                    blurRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "  Category",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 20,),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: modelsLoaiSP.length,
                                    itemBuilder: (context, index){
                                      return InkWell(
                                        onHover: (value){
                                          setState(() {
                                            currentCategory=index;
                                            maSanPham= modelsLoaiSP[index].MaLoaiSP;
                                            _getSanPhamtheoLoai(modelsLoaiSP[index].MaLoaiSP);
                                           // imageCate = modelsLoaiSP[index].Icon;
                                          });
                                        },
                                        onTap: (){
                                          setState(() {
                                            maSanPham= modelsLoaiSP[index].MaLoaiSP;
                                            _getSanPhamtheoLoai(modelsLoaiSP[index].MaLoaiSP);
                                            //imageCate = modelsLoaiSP[index].Icon;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: currentCategory == index? Colors.purple : Colors.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                modelsLoaiSP[index].TenLoai,
                                                style: TextStyle(
                                                    color: currentCategory == index? Colors.white : Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400
                                                ),
                                                maxLines: 2,
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: currentCategory == index? Colors.white : Colors.grey,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),

                        Expanded(
                          flex: 7,
                          child: Container(
                            height: size.height*2,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(2,2),
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nhà xuất bản",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 20,),

                                GridView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: modelsNXB.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.5,
                                  ),
                                  itemBuilder: (context, index){
                                    return Column(
                                      children: [
                                        Image.network(
                                          "https://cdn0.fahasa.com/media/wysiwyg/Thang-08-2021/logo_tanviet-v2.jpg",
                                          height: 80,
                                          width: 80,
                                        ),
                                        Text(modelsNXB[index].TenNSX)
                                      ],
                                    );
                                  },
                                ),

                                Image.network(
                                  imageCate,
                                  width: size.width,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),

                                SizedBox(height: 15,),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 15,),

                                modelsSanPham.length ==0 ? Text(
                                  "SAN PHAM",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ) : Expanded(
                                  child: Container(
                                    height: size.height*2,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(8.0),
                                      scrollDirection: Axis.vertical,
                                      itemCount: modelsSanPham.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio:   size.width / size.height/3.5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemBuilder: (context, index){
                                        return CustomItemListProduct(
                                          isHover: currentItemProduct == index,
                                          models: modelsSanPham[index],
                                          size: size,
                                          function: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>ScreenDetail(modelSanPham: modelsSanPham[index]))
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
