import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/SCREEN/screen_test2.dart';
import 'package:flutter_doan/model/model_loai_sp.dart';
import 'package:flutter_doan/model/model_ncc.dart';
import 'package:flutter_doan/model/model_nxb.dart';
import 'package:flutter_doan/wiget/SelectDropList.dart';
import 'package:flutter_doan/wiget/droplist_ncc.dart';
import 'package:flutter_doan/wiget/droplist_nsx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as Path;
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:path_provider/path_provider.dart';
import '../../../service.dart';
class ScreenAddProduct extends StatefulWidget {
  const ScreenAddProduct({Key? key}) : super(key: key);

  @override
  _ScreenAddProductState createState() => _ScreenAddProductState();
}

class _ScreenAddProductState extends State<ScreenAddProduct> {
  String tenSP="";
  String donGia="";
  String ngayCapNhap="";
  String chiTiet="";
  String moTa="";
  String hinhAnh="";
  String soLuongTon="";

  String maNCC="1";
  String maNSX="1";
  String maLoaiSP="1";



  List<String> _textPages = [
    "Thong tin co ban",
    "Thong tin ban hang"
  ];

  html.File? _cloudFile;
  var _fileBytes;
  Image? _imageWidget;
  Image? pickedImage;
  String mine ="";

  Future<void> getFiles() async{
    Image? fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.widget) as Image;
    if (fromPicker != null) {
      setState(() {
        pickedImage = fromPicker;

      });
    }

  }
  Future<void> getMultipleImageInfos() async {


    var mediaData = await ImagePickerWeb.getImageInfo;
    String mimeType = mime(Path.basename(mediaData.fileName as String))!;
    html.File mediaFile =
    new html.File(mediaData.data as Uint8List, mediaData.fileName as String, {'type': mimeType});


    if (mediaFile != null) {
      setState((){
        String base64Image = base64Encode(mediaData.data!.toList());
        String fileName = mediaFile.name.split("/").last;
        _cloudFile = mediaFile;
        _fileBytes = mediaData.data;
        _imageWidget = Image.memory(mediaData.data as Uint8List);
        mine = base64Image;
      });
    }
  }

  List<ModelLoaiSP> modelsLoaiSP =[];
  List<ModelNXB> modelsNXB =[];
  List<ModelNCC> modelsNCC =[];

  SanPham sanPham =new SanPham();
  NCC ncc =new NCC();
  final _controller = new PageController();
  int _currentPage =1;

  _getNhaXuatBan(){
    ncc.nha_cung_cap().then((value){
      setState(() {
        modelsNCC =value;
      });
    });

    sanPham.loaiSanPham().then((value){
      setState(() {
        modelsLoaiSP =value;
      });
    });
    sanPham.nhaXuatBan().then((value){
      setState(() {
        modelsNXB =value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getNhaXuatBan();
  }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    List<Widget> _samplePages = [
      Container(
        height: size.height*1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: size.height*1.5,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thông tin cơ bản",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                ),
              ),
              SizedBox(height: size.height*0.01,),

              CustomInfoProduct(
                  title: "Tên Sản Phẩm",
                  hintText: "Nhập vào",
                  onChanged: (value){
                    setState(() {
                      tenSP =value;
                    });
                  },
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                maxLine: 2,
              ),

              SizedBox(height: size.height*0.01,),
              CustomInfoProduct(
                title: "Mô tả",
                hintText: "Nhập vào",
                onChanged: (value){
                  setState(() {
                    moTa =value;
                  });
                },
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLine: 5,
              ),

              SizedBox(height: size.height*0.01,),
              CustomInfoProduct(
                title: "Chi tiết",
                hintText: "Nhap vao",
                onChanged: (value){
                  setState(() {
                    chiTiet =value;
                  });
                },
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLine: 10,
              ),
              SizedBox(height: size.height*0.01,),
              CustomInfoProduct(
                title: "Số Lượng",
                hintText: "Nhập vào",
                onChanged: (value){
                  setState(() {
                    soLuongTon =value;
                  });
                },
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLine: 2,
              ),
              SizedBox(height: size.height*0.01,),
              CustomInfoProduct(
                title: "Đơn Giá",
                hintText: "Nhập vào",
                onChanged: (value){
                  setState(() {
                    donGia =value;
                  });
                },
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLine: 2,
              ),

              SizedBox(height: size.height*0.01,),

              SizedBox(height: size.height*0.01,),
            ],
          ),
        )
      ),

      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  SingleChildScrollView(
            child: Container(
              height: size.height*1.5,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thông tin khác",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:  Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17
                    ),
                  ),
                  SizedBox(height: size.height*0.01,),
                  Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                                "Mã Loại SP"
                            ),
                          ),
                          modelsLoaiSP.length == 0
                              ? Container()
                              :  Expanded(
                            flex: 7,
                            child: SelectDropList(
                              modelsLoaiSP.first,
                              modelsLoaiSP,
                                  (optionItem){
                                setState(() {
                                  maLoaiSP =optionItem.MaLoaiSP;
                                });
                              },
                            ),
                          ),

                        ],
                      )
                  ),

                  SizedBox(height: size.height*0.01,),
                  Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                                "Mã NCC"
                            ),
                          ),
                          modelsNCC.length == 0
                              ? Container()
                              :  Expanded(
                            flex: 7,
                            child: SelectDropListNCC(
                              modelsNCC.first,
                              modelsNCC,
                                  (optionItem){
                                setState(() {
                                  maNCC =optionItem.MaNCC;
                                });
                              },
                            ),
                          ),

                        ],
                      )
                  ),

                  SizedBox(height: size.height*0.01,),
                  Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                                "Mã NXB"
                            ),
                          ),
                          modelsNXB.length == 0
                              ? Container()
                              :  Expanded(
                            flex: 7,
                            child: SelectDropListNSX(
                              modelsNXB.first,
                              modelsNXB,
                                  (optionItem){
                                setState(() {
                                  maNSX =optionItem.MaNSX;
                                });

                              },
                            ),
                          ),

                        ],
                      )
                  ),

                  SizedBox(height: size.height*0.01,),
                  Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                                "Ngay Cap"
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child:Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black87,
                                    width: 1
                                ),
                              ),
                              child:DatePickerDemo(),
                            ),
                          ),

                        ],
                      )
                  ),
                  SizedBox(height: size.height*0.01,),
                  Text("MaLoai "+ maLoaiSP),
                  Text("MaNSX "+ maNSX),
                  Image.memory(base64Decode(mine))
                ],
              ),
            ),
          ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 70,  right: 70),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(_textPages.length, (index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 30,
                                width: _currentPage == index ? 3 :  3,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color:  _currentPage == index ? Colors.deepOrange : Color(0xFFD8D8D8)
                                ),
                              ),

                              Text(
                                _textPages[index],
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                    color:  _currentPage == index ? Colors.deepOrange : Color(0xFFD8D8D8)
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
            ),
            SizedBox(width:size.width*0.02 ,),
            Expanded(
              flex: 5,
                child: Container(
                  child:  Column(
                    children: <Widget>[
                      Flexible(
                        child: PageView.builder(
                          onPageChanged: (value){
                            setState(() {
                              _currentPage = value;
                            });
                          },
                          scrollDirection: Axis.vertical,
                          controller: _controller,
                          itemCount: _samplePages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: _samplePages[_currentPage],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(width:size.width*0.02 ,),
            Expanded(
                flex: 2,
                child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(5),
                 ),
                  child: Column(
                    children: [
                      SizedBox(width:size.height*0.02 ,),

                     Container(
                       child:  _imageWidget != null
                           ? _imageWidget
                           : Icon(
                         Icons.cloud_upload_outlined,
                         color: Colors.grey,
                         size: 80,
                       ),
                     ),

                      InkWell(
                        onTap: (){
                          getMultipleImageInfos();
                        },
                        child:Container(
                          padding: EdgeInsets.all(10),
                          margin:  EdgeInsets.all(10),
                          width: size.width/3,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.cloud_upload_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Choose a file",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //
                      // Text(
                      //   "Location : "+mine,
                      // ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = new DateFormat("dd/MM/yyyy");

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              _selectDate(context);
            },
            child: Icon(Icons.event, color: Colors.black87,),
          ),
          SizedBox(width: 15,),
          Text(
            dateFormat.format(selectedDate),
             style: TextStyle( color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
class CustomInfoProduct extends StatelessWidget {
  String title;
  String hintText;
  Function(String) onChanged;
  TextInputType textInputType;
  TextInputAction textInputAction;
  int maxLine;
  CustomInfoProduct({
    required this.title,
    required this.hintText,
    required this.onChanged,
    required this.textInputType,
    required this.textInputAction,
    required this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color:  Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                ),
              ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 7,
            child:  Container(
              height: maxLine*24.0,
              child: TextFormField(
                maxLines: maxLine,
                textInputAction: textInputAction,
                onChanged: onChanged,
                keyboardType: textInputType,
                cursorColor: Colors.black26,
                cursorWidth: 2,
                //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.black38
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: maxLine*14  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}