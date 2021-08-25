import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/model/model_dondathang.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:popup_menu/popup_menu.dart';

import '../../../service.dart';
class ScreenOrder extends StatefulWidget {
  static String routeName = "/admin/order";
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  bool isDownUpID = false;
  bool isDownUpDate = false;
  bool isDownUpAmount = false;
  int currentOrders=-1;

  String _selection ="";
  List<ModelDonDH> models_dondh=[];
  DonHang donHang =new DonHang();
  _getDonHang(){
    donHang.get_don_dat_hang().then((value){
      setState(() {
        models_dondh =value;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _getDonHang();
  }

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    final RenderObject? overlay = Overlay.of(context)!.context.findRenderObject();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                // onHover: (vale){
                //
                // },
                // onTap: (){
                //
                // },
                onTapUp: (TapUpDetails details){

                },
                child: Text(
                  "Dashboard Order",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                ),
              ),

              SizedBox(height: size.height*0.02,),

              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5
                                )
                            ),
                          ),
                          children: [
                            tableHeader(
                              text: "Order ID",
                              isBool: isDownUpID,
                              fuc: (){
                                setState(() {
                                  isDownUpID = !isDownUpID;
                                  Fluttertoast.showToast(msg:"OrdersID :" +isDownUpID.toString());
                                });
                              },
                              isShow: true,
                            ),

                            tableHeader(
                              text: "Customer Name",
                              isBool: false,
                              fuc:(){},
                              isShow: false,
                            ),

                            tableHeader(
                              text: "Date",
                              isBool: isDownUpDate,
                              fuc: (){
                                setState(() {
                                  isDownUpDate = !isDownUpDate;
                                  Fluttertoast.showToast(msg:"Date :" + isDownUpDate.toString());
                                });
                              },
                              isShow: true,
                            ),


                            tableHeader(
                              text: "Location",
                              isBool: false,
                              fuc:(){},
                              isShow: false,
                            ),

                            tableHeader(
                              text: "Amount",
                              isBool: isDownUpAmount,
                              fuc: (){
                                setState(() {
                                  isDownUpAmount = !isDownUpAmount;
                                  Fluttertoast.showToast(msg:"OrdersID :" +isDownUpAmount.toString());
                                });
                              },
                              isShow: true,
                            ),

                            tableHeader(
                              text: "Status",
                              isBool: false,
                              fuc:(){},
                              isShow: false,
                            ),

                            tableHeader(
                              text: "",
                              isBool: false,
                              fuc:(){},
                              isShow: false,
                            ),

                          ],

                        ),
                      ],
                    ),


                    models_dondh.length == 0
                        ? Container()
                        : ListView.builder(
                        shrinkWrap: true,
                        itemCount: models_dondh.length,
                        itemBuilder: (context, index){
                          return InkWell(
                              onHover: (value){

                              },
                              onTap: (){

                              },
                              onTapDown: (TapDownDetails details){

                                setState(() {
                                  currentOrders =index;
                                  _showPopupMenu(
                                      details.globalPosition,
                                      overlay,
                                      (){
                                        Fluttertoast.showToast(msg: "Aceept ID : " + models_dondh[index].MaChiTietDDH);
                                      },
                                      (){
                                        Fluttertoast.showToast(msg: "Delete ID : " + models_dondh[index].MaChiTietDDH);
                                      },
                                  );
                                });
                              },
                              child:Stack(
                                children: [
                                  Table(
                                    children: [
                                      tableRow(
                                        context,
                                        size,
                                        id: models_dondh[index].MaChiTietDDH,
                                        date:models_dondh[index].NgayDat,
                                        location: models_dondh[index].DiaChi,
                                        amount: models_dondh[index].DonGia,
                                        status: models_dondh[index].TinhTrangGiaoHang,
                                        name: models_dondh[index].TenKH,
                                        isBool: currentOrders == index,
                                      ),
                                    ],
                                  ),

                                  currentOrders == index
                                      ? Container()
                                      : Container(),
                                ],
                              )
                          );
                        }
                    ),




                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
  void _showPopupMenu(_tapPosition, overlay, funcAccept, funcDelete) async {
    await showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromRect(
          _tapPosition & Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
      ),
      items: [
        PopupMenuItem(
          value: 1,
          child:  InkWell(
            onTap: funcAccept,
            child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "Accept Order",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child:  InkWell(
            onTap: funcDelete,
            child: Row(
              children: [
                Icon(
                  Icons.delete_sharp,
                  color: Colors.deepOrange,
                ),
                SizedBox(width: 5,),
                Text(
                  "Reject Order",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          )
        ),
      ],
      elevation: 8.0,
    ).then((value){



      if(value!=null)
        print(value);

    });
  }


}
TableRow tableRow(context,size, {id, name, date, location, amount, status, isBool}){
  return TableRow(
    decoration: BoxDecoration(
      color:isBool?  Colors.grey.shade100 : Colors.white,
    ),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child:Text(
              id,
            )
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(name),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(date),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(location),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(
              amount +" d",
            style: TextStyle(
                color: Colors.red
            ),
          ),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Row(
            children: [
              if(status == "dang")
                Container(
                  width: size.width*0.08,
                  padding: EdgeInsets.all(7),
                  decoration:BoxDecoration(
                    color:  Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Wait",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                ),
              if(status == "ok")
                Container(
                  width: size.width*0.08,
                  padding: EdgeInsets.all(7),
                  decoration:BoxDecoration(
                    color: Colors.greenAccent.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
        ),
      ),
    ],
  );
}

class tableHeader extends StatelessWidget {
  String text;
  bool isBool, isShow;
  Function() fuc;

  tableHeader({
    required this.text,
    required this.isBool,
    required this.fuc,
    required this.isShow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child:Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          isShow ? isBool
              ? InkWell(
            onTap: fuc,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          )
              : InkWell(
            onTap: fuc,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.black,
            ),
          )
              : Container(),
        ],
      )
    );
  }
}
