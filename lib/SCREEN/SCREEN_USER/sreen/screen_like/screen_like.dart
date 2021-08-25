import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/model/model_cart.dart';
import 'package:flutter_doan/model/model_like.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/model/model_tools.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_dashboard.dart';
import 'package:flutter_doan/wiget/custom_item_cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class ScreenLike extends StatefulWidget {
  const ScreenLike({Key? key}) : super(key: key);

  @override
  _ScreenLikeState createState() => _ScreenLikeState();
}

class _ScreenLikeState extends State<ScreenLike> {
  int currentHover =-1;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    var likes = Provider.of<ModelLike>(context);
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(left: 80, right: 80, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Yêu Thích" ,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20,),

              likes.itemCount == 0
                  ? Container(
                      child: Text(
                        "Không có sản phẩm yêu thích" ,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  :ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: likes.itemCount,
                  itemBuilder: (context, index){
                    return CustomItemLike(
                      size: size,
                      modelSanPham: likes.items.values.toList()[index].modelSanPham,
                      functionDelete: (){
                        setState(() {
                          likes.removeItem(likes.items.values.toList()[index].modelSanPham.maSP);
                        });
                      },
                      hoverCart: currentHover== index,
                      cart: cart,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomItemLike extends StatefulWidget {
  ModelSanPham modelSanPham;
  Size size;
  Function() functionDelete;
  bool hoverCart;
  var cart;
  CustomItemLike({
    required this.modelSanPham,
    required this.size,
    required this.functionDelete,
    required this.hoverCart,
    required this.cart
});

  @override
  _CustomItemLikeState createState() => _CustomItemLikeState();
}

class _CustomItemLikeState extends State<CustomItemLike> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child:
      Container(
        height: widget.size.height/4,
        width: widget.size.width,
        margin:EdgeInsets.only(right: 20, top: 15, left: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(2,2),
                blurRadius: 2
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              widget.modelSanPham.hinhAnh,
            ),

            SizedBox(width: 10,),

            Expanded(
              child: Container(
                width: widget.size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên Sản Phẩm : "+widget.modelSanPham.tenSP,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                          fontSize: 19
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Mã Sản Phẩm : "+widget.modelSanPham.maSP,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w800,
                          fontSize: 17
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onHover: (value){
                        if (value){
                          setState(() {
                            widget.hoverCart =value;
                          });
                        }else{
                          setState(() {
                            widget.hoverCart =value;
                          });
                        }
                      },
                      onTap: (){
                        widget.cart.addItem(
                            widget.modelSanPham.maSP,
                            double.parse(widget.modelSanPham.donGia),
                            widget.modelSanPham.tenSP,
                            widget.modelSanPham.hinhAnh,
                            1
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return ScreenCart();
                            })
                        );
                      },
                      child:  Container(
                        width: widget.size.width/4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: widget.hoverCart ? Colors.deepPurple : Colors.white,
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
                              color:widget.hoverCart ? Colors.white : Colors.deepPurple,
                              size: 25,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "Add to cart",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: widget.hoverCart ? Colors.white : Colors.deepPurple,
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
              ),)



          ],
        ),
      ),
      secondaryActions: <Widget>[
        InkWell(
          onTap: widget.functionDelete,
          child:Container(
            height: 75,
            width: 75,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  Color(0xFFDF2C2C),
            ),
            child: Icon(
              Icons.delete_outline_outlined,
              color: Colors.white ,
            ),
          ),
        ),
      ],
    );
  }
}



