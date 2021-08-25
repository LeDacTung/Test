import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_doan/model/model_cart.dart';
class CustomItemCart extends StatefulWidget {
  Size size;
  String id;
  String title;
  int quantity;
  double price;
  String hinhAnh;
  Cart cart ;
  Function() functionDelete;


  CustomItemCart({
    required this.size,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.hinhAnh,
    required this.functionDelete,
    required this.cart,
  });


  @override
  _CustomItemCartState createState() => _CustomItemCartState();
}

class _CustomItemCartState extends State<CustomItemCart> {
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
              widget.hinhAnh,
            ),

            SizedBox(width: 10,),

            Expanded(
              child: Container(
              width: widget.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tên Sản Phẩm : "+widget.title,
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
                    "Mã Sản Phẩm : "+widget.id,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w800,
                        fontSize: 17
                    ),
                  ),

                  Spacer(),

                  Row(
                    children: [
                      Text(
                        "Số Lượng : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 17
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
                            Row(
                              children: [
                                SizedBox(width: 15,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(widget.quantity > 1){
                                        widget.quantity--;
                                        widget.cart.Soluong(widget.id,widget.quantity );
                                      }
                                      else if(widget.quantity <= 1) {
                                        widget.quantity=1;
                                      }
                                    });
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  ),
                                ),
                                SizedBox(width: 30,),
                                Text(
                                  widget.quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17
                                  ),

                                ),
                                SizedBox(width: 30,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      widget.quantity++;
                                      widget.cart.Soluong(widget.id,widget.quantity );
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  ),
                                ),
                                SizedBox(width: 15,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Text(
                    "Thành Tiền : "+"${widget.price*widget.quantity}"+" vnd",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                    ),
                  ),



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

