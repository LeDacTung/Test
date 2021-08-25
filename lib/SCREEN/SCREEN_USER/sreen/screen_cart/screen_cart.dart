import 'dart:ui';

import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doan/model/model_cart.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/reponesive/app_reponsive.dart';
import 'package:flutter_doan/service.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_detail/screen_detail.dart';
import 'package:flutter_doan/wiget/custom_country_state.dart';
import 'package:flutter_doan/wiget/custom_item_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatefulWidget {
  static String routeName = "/user/cart";
  const ScreenCart({Key? key}) : super(key: key);

  @override
  _ScreenCartState createState() => _ScreenCartState();
}

String id ="1";
String title="Đứa Con Gái Hoang Đàng - The Prodigal Daughter Đứa Con Gái Hoang Đàng ";
int quantity=1;
double price=51.500;
String hinhAnh="https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_234117.jpg";



class _ScreenCartState extends State<ScreenCart> {

  bool isThanhToan =false;
  DonHang donHang =new DonHang();
  String emailInput="";
  String nameInput="";
  String addressInput="";
  String sdtInput="";
  String strKhachHang="";
  String strDonDatHang="";
  String strChitietDonDatHang="";

  TextEditingController countryController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController cityController=TextEditingController();

  String countryValue="";
  String stateValue="";
  String cityValue="";

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    var totalPrice =0.0;
    bool isLoading =false;
    if (cart.itemCount !=0){
      for (int i =0 ;i < cart.itemCount ;i++){
        totalPrice += cart.items.values.toList()[i].quantity* cart.items.values.toList()[i].price;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Container(
          height: size.height*2,
          margin:  EdgeInsets.only(
              left:size.width <= 700 ? 40 : 80,
              right: size.width <= 700 ? 40 : 80,
              top: 20
          ),
          padding: EdgeInsets.all(10),
          color: Colors.grey.shade100,
          child: Row(
            children: [
              if(size.width >= 1200  || (size.width < 1200  && size.width >900))
              Expanded(
                flex: 4,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:  Container(
                      height: size.height*2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(2,2),
                              blurRadius: 2
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child:  Text(
                              "Giỏ Hàng" ,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),

                          cart.itemCount ==0
                              ? Container()
                              :  ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: cart.itemCount,
                              itemBuilder: (context, index){
                                return CustomItemCart(
                                    size: size,
                                    id: cart.items.values.toList()[index].id,
                                    title: cart.items.values.toList()[index].title,
                                    quantity: cart.items.values.toList()[index].quantity,
                                    price: cart.items.values.toList()[index].price,
                                    hinhAnh: cart.items.values.toList()[index].hinhAnh,
                                    functionDelete: (){
                                        setState(() {
                                          cart.removeItem(cart.items.values.toList()[index].id);
                                        });
                                    },
                                  cart: cart,
                                );
                              }
                          ),

                        ],
                      ),
                    ),
                  ),
              ),
              SizedBox(width: 20,),

              if(size.width <= 900 || size.width >= 1200)
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: Offset(2,2),
                                      blurRadius: 2
                                  ),
                                ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Địa chỉ giao hàng" ,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.grey,
                                ),


                                SizedBox(height: 10,),
                                CustomItemDiaChiGiaoHang(
                                  title: "Tên Khách Hàng",
                                  hintText: "Nhập tên khách hàng",
                                  onChanged: (value){
                                    setState(() {
                                      nameInput =value;
                                    });
                                  },
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                                nameInput.length==0
                                    ? Text(
                                  "Thông tin không thể trống",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:  Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ) : Container(),


                                SizedBox(height: size.height*0.03,),
                                Text(
                                  "Địa chỉ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:  Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20
                                  ),
                                ),
                                CountryStateCity(
                                  size: size,
                                  country: countryController,
                                  state: stateController,
                                  city: cityController,
                                  textFieldInputBorder: UnderlineInputBorder(),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value){
                                      setState(() {
                                        addressInput = value;
                                      });
                                  },
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Colors.black26,
                                  cursorWidth: 2,
                                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    hintText: "Số nhà  - Phường",
                                    hintStyle: TextStyle(
                                        color: Colors.black38
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ),


                                addressInput.length==0
                                    ? Text(
                                  "Thông tin không thể trống",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:  Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ) : Container(),


                                SizedBox(height: size.height*0.03,),
                                CustomItemDiaChiGiaoHang(
                                  title: "Email",
                                  hintText: "Nhập email",
                                  onChanged: (value){
                                    setState(() {
                                      emailInput =value;
                                    });
                                  },
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                                emailInput.length==0
                                    ? Text(
                                  "Thông tin không thể trống",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:  Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ) : Container(),

                                SizedBox(height: size.height*0.03,),
                                CustomItemDiaChiGiaoHang(
                                  title: "Số Điện Thoại",
                                  hintText: "Nhập số điện thoại",
                                  onChanged: (value){
                                    setState(() {
                                      sdtInput =value;
                                    });
                                  },
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                                sdtInput.length==0
                                    ? Text(
                                  "Thông tin không thể trống",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:  Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ) : Container(),

                              ],
                            ),
                          ),
                      ),
                      SizedBox(height: 15,),
                      Expanded(
                        flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: Offset(2,2),
                                    blurRadius: 2
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Thông tin thanh toán" ,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.grey,
                                ),

                                SizedBox(height: 10,),
                                CustomInfoProduct(title: "Thành tiền", text: totalPrice.toString()+" đ", color: Colors.redAccent, size: size),

                                SizedBox(height: 10,),
                                CustomInfoProduct(title: "Phí vận chuyển", text: "0 đ", color: Colors.redAccent, size: size),

                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tổng Tiền",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19
                                      ),
                                    ),

                                    Text(
                                      totalPrice.toString()+" đ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color:  Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19
                                      ),
                                    ),
                                  ],
                                ),

                                Spacer(),
                                InkWell(
                                  onHover: (value){
                                    if (value){
                                      setState(() {
                                        isThanhToan =value;
                                      });
                                    }else{
                                      setState(() {
                                        isThanhToan =value;
                                      });
                                    }
                                  },
                                  onTap: () {
                                    if(nameInput == ""){
                                      Fluttertoast.showToast(msg:"name null");
                                    }else if(sdtInput == ""){
                                      Fluttertoast.showToast(msg:"sdt null");
                                    }else if(emailInput == ""){
                                      Fluttertoast.showToast(msg:"email null");
                                    }else if(addressInput == ""){
                                      Fluttertoast.showToast(msg:"address null");
                                    }
                                    else {
                                      donHang.postKhachHang(
                                        emailInput.toString(),
                                        nameInput.toString(),
                                        addressInput.toString()+"-"+ cityController.text+"-"+ stateController.text+"-" + countryController.text,
                                        sdtInput.toString(),
                                      ).then((value){
                                        setState(() {
                                          strKhachHang = value;
                                          if(strKhachHang.isEmpty){
                                          }else{
                                            final df = new DateFormat('dd-MM-yyyy hh:mm a');
                                            DateTime date = DateTime.now();
                                            String strNow = df.format(date);

                                            DateTime newDate = new DateTime(date.year, date.month, date.day+7);
                                            String strGiao = df.format(newDate);
                                            donHang.postDonDatHang(
                                              strNow,
                                              strGiao,
                                              strKhachHang,
                                            ).then((value){
                                              setState(() {
                                                strDonDatHang = value;
                                                if(strDonDatHang.isEmpty){

                                                }else{
                                                  for (var index =0; index<= cart.itemCount ; index++){
                                                    donHang.postChiTietDonDatHang(
                                                      strDonDatHang,
                                                      cart.items.values.toList()[index].id,
                                                      cart.items.values.toList()[index].title,
                                                      "${cart.items.values.toList()[index].quantity}",
                                                      "${ cart.items.values.toList()[index].quantity*cart.items.values.toList()[index].price}",
                                                    ).then((value){
                                                      setState(() {
                                                        strChitietDonDatHang = value;
                                                        showAlertDialog(context, size);
                                                        cart.clear();
                                                      });
                                                    });
                                                  }
                                                }

                                              });
                                            });
                                          }

                                        });
                                      });

                                    }

                                  },
                                  child:  Container(
                                    //width: size.width/4,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: hoverCart ? Colors.deepOrange : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.payments_outlined,
                                          color:hoverCart ? Colors.white : Colors.deepOrange,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          "Add to cart",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: hoverCart ? Colors.white : Colors.deepOrange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

showAlertDialogLoad(BuildContext context, Size size) {
  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: size.height/2.5,
      width: size.width/3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: CircularProgressIndicator(),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}


showAlertDialog(BuildContext context, Size size) {
  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: size.height/2.5,
      width: size.width/3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              Center(
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xff045318),
                  size: 140,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                  "Thanh toan thanh cong\nDoi giao hang!!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          )
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}

class CustomItemDiaChiGiaoHang extends StatelessWidget {
  String title;
  String hintText;
  Function(String) onChanged;
  TextInputType textInputType;
  TextInputAction textInputAction;
  CustomItemDiaChiGiaoHang({
    required this.title,
    required this.hintText,
    required this.onChanged,
    required this.textInputType,
    required this.textInputAction,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20
            ),
          ),
        SizedBox(height: 10),
          TextFormField(
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
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class CustomAlertDialogSuccess extends StatelessWidget {
  Size size;

  CustomAlertDialogSuccess({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        width: size.width/3,
        height: size.height/2,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.deepPurple,
                offset: Offset(2,2),
                blurRadius: 2
            ),
          ],
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Stack(
              children: [
                GestureDetector(
                  onTap: (){},
                  child:Container(
                    height: 75,
                    width: 75,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:  Colors.deepOrange,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white ,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "Add to cart",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: hoverCart ? Colors.white : Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 22
                            ),
                          ),
                          Text(
                            "Add to cart",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: hoverCart ? Colors.white : Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 22
                            ),
                          ),
                        ],
                      ),
                    ),
                )
              ],
            ),
        ),
      ),
    );
  }
}

