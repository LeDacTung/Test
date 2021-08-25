import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/model/model_cart.dart';
import 'package:flutter_doan/model/model_like.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_like/screen_like.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class ScreenDetail extends StatefulWidget {
  ModelSanPham modelSanPham;
  ScreenDetail({
    required this.modelSanPham,
});

  @override
  _ScreenDetailState createState() => _ScreenDetailState();
}


int countProduct=1;
bool hoverCart=false;

List<Cart>? carts;


class _ScreenDetailState extends State<ScreenDetail> {
 // final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context, listen: false);
    final like = Provider.of<ModelLike>(context, listen: false);



    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [

              Container(
                margin:  EdgeInsets.only(
                    left: 20,
                    top: 10
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.purple,
                            width: 4
                        ),
                      ),
                      child:  Icon(
                        Icons.book,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      "WEB BOOK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 26,
                        shadows: [
                          Shadow(
                              color: Colors.deepPurpleAccent,
                              blurRadius: 2,
                              offset: Offset(2,2)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                height: size.height*6/10,
                width: size.width,
                margin:  EdgeInsets.only(
                  left: size.width <=900?40: 120,
                  right:  size.width <=900?40: 120,
                  top: 20
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Row(
                  children: [

                    Expanded(
                        child:Image.network(
                          widget.modelSanPham.hinhAnh,
                        ),
                    ),

                    if(size.width>=770)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7,),
                          Text(
                            widget.modelSanPham.tenSP,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 23
                            ),
                          ),
                          SizedBox(height: 10,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Nhà xuất bản :",
                                  style: TextStyle(
                                      color: Colors.black38,
                                  ),
                                ),
                                TextSpan(
                                  text:widget.modelSanPham.tenNSX,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Nhà Cung Cấp :",
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),

                                ),
                                TextSpan(
                                  text:widget.modelSanPham.tenNCC,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Mô tả :",
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),

                                ),
                                TextSpan(
                                  text:widget.modelSanPham.moTa,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.modelSanPham.donGia+ " đ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  like.addItem(widget.modelSanPham);
                                  Fluttertoast.showToast(msg: "Đã thêm vào yêu thích");
                                },
                                child:Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  Color(0xFFDF2C2C),
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white ,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text(
                                "So luong :",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 15,),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(countProduct > 1){
                                            countProduct--;
                                          }
                                          else if(countProduct <= 1) {
                                            countProduct=1;
                                          }
                                        });
                                      },
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22
                                        ),

                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      countProduct.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18
                                      ),

                                    ),
                                    SizedBox(width: 30,),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                            countProduct++;
                                        });
                                      },
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22
                                        ),

                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                  ],
                                ),
                              )
                            ],
                          ),

                          Spacer(),
                          InkWell(
                            onHover: (value){
                              if (value){
                                setState(() {
                                  hoverCart =value;
                                });
                              }else{
                                setState(() {
                                  hoverCart =value;
                                });
                              }
                            },
                            onTap: (){
                              cart.addItem(
                                  widget.modelSanPham.maSP,
                                  double.parse(widget.modelSanPham.donGia),
                                  widget.modelSanPham.tenSP,
                                  widget.modelSanPham.hinhAnh,
                                  countProduct
                              );

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return ScreenCart();
                                  })
                              );
                              //Navigator.pushNamed(context, ScreenCart.routeName);
                            },
                            child:  Container(
                              width: size.width/4,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: hoverCart ? Colors.deepPurple : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.deepPurple,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color:hoverCart ? Colors.white : Colors.deepPurple,
                                    size: 25,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Add to cart",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: hoverCart ? Colors.white : Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                width: size.width,
                margin:  EdgeInsets.only(
                    left:  size.width<=900 ?40 : 120,
                    right:  size.width<=900 ?40 : 120,
                    top: 20
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thông tin sản phẩm",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color:  Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                      ),
                    ),
                    SizedBox(height: 10,),

                    if(size.width>=1200)
                    Column(
                      children: [
                        CustomInfoProduct(title: "Mã hàng", text: widget.modelSanPham.maSP , color: Colors.black, size: size),
                        SizedBox(height: 8,),

                        CustomInfoProduct(title: "Nhà Cung Cấp", text: widget.modelSanPham.tenNCC , color: Colors.blue, size: size),
                        SizedBox(height: 8,),

                        CustomInfoProduct(title: "Nhà Xuất Bản", text: widget.modelSanPham.tenNSX , color: Colors.black, size: size),
                        SizedBox(height: 8,),

                        CustomInfoProduct(title: "Năm Xuất Bản", text: widget.modelSanPham.ngayCapNhap , color: Colors.black, size: size),
                        SizedBox(height: 8,),

                        CustomInfoProduct(title: "Loại Sách", text: widget.modelSanPham.tenLoai , color: Colors.black, size: size),
                        SizedBox(height: 8,),

                        CustomInfoProduct(title: "Lượt Bình Chọn", text: widget.modelSanPham.luotBinhChon , color: Colors.red, size: size),
                        SizedBox(height: 8,),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Chi tiết : ",
                            style: TextStyle(
                              color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                            ),

                          ),
                          TextSpan(
                            text:widget.modelSanPham.chiTiet,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w100,
                                fontSize: 15
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInfoProduct extends StatelessWidget {
  String text, title;
  Size size;
  Color color;
  CustomInfoProduct({
    required this.title,
    required this.text,
    required this.color,
    required this.size,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color:  Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 16
            ),
          ),
          
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color:  color,
                fontWeight: FontWeight.w400,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}
