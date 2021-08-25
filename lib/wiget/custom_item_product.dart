import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/reponesive/app_reponsive.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/model/model_tools.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_dashboard.dart';

class CustomItemListProduct extends StatefulWidget {
  bool isHover;
  ModelSanPham models;
  Size size;
  Function() function;
  CustomItemListProduct({
    required this.isHover,
    required this.models,
    required this.size,
    required this.function,
});

  @override
  _CustomItemListProductState createState() => _CustomItemListProductState();
}

class _CustomItemListProductState extends State<CustomItemListProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child:  Stack(
        children: [
          InkWell(
            onHover: (value){
              if (value){
                setState(() {
                  widget.isHover =value;
                });
              }else{
                setState(() {
                  widget.isHover =value;
                });
              }

            },
            onTap: widget.function,
            child: Container(
              width:AppReponsive.isMobile(context) ? widget.size.width/3 : widget.size.width/6,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: widget.isHover ? Colors.purpleAccent : Colors.grey.shade400,
                    offset: Offset(1,1),
                    blurRadius: 4
                  ),
                ],
                border: Border.all(
                  color:widget.isHover ? Colors.purple : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.models.hinhAnh,
                  ),
                  Text(
                    widget.models.tenSP,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17
                    ),
                  ),
                  Text(
                    widget.models.moTa,
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            widget.models.luotXem,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 12
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      Text(
                        widget.models.donGia+ "vnd",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         Align(
           alignment: Alignment.topCenter,
           child:  widget.isHover ? CustomAlertDialog(size: widget.size, modelSanPham: widget.models,) : Container(),)

        ],
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  Size size;
  ModelSanPham modelSanPham;
  CustomAlertDialog({
    required this.size,
    required this.modelSanPham,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(

        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.deepPurple,
                offset: Offset(2,2),
                blurRadius: 5
            ),
          ],
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Text(
                  modelSanPham.tenSP,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 5,),
                Text(
                  "NSX :"+modelSanPham.tenNSX,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "NSB :"+modelSanPham.tenNCC,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5,),
              ],
            )
        ),
      ),
    );
  }
}
