import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_cart.dart';
import 'package:flutter_doan/reponesive/app_reponsive.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/model/model_tools.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_dashboard.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_tools.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_search//screen_search.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_offers/screen_offer.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_like/screen_like.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_category/screen_category.dart';
import 'package:provider/provider.dart';
class ScreenDashboard extends StatefulWidget {
  static String routeName = "/user/home";
  String email;
  ScreenDashboard({
    required this.email
});

  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}




class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  void initState() {
    super.initState();

  }

  int currentTools=0;
  bool isSelect= false;
  bool isCart = false;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);


    return Scaffold(
      drawer: Container(
        color: Colors.white,
        margin: EdgeInsets.only(left : 20),
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
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

            SizedBox(height: 20,),
            Text(
              "Tools",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              ),
            ),

            Column(
              children: [
                Container(
                  height: size.height/2,
                  child:  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listTools.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onHover: (value){
                            // setState(() {
                            //   currentTools = index;
                            //   isSelect = false;
                            // });
                          },
                          onTap: (){
                            setState(() {
                              currentTools = index;
                              isSelect = true;
                            });
                          },
                          child: CustomItemsDashboard(
                            iconData: listTools[index]["icon"],
                            title: listTools[index]["text"],
                            isSelect:  currentTools == index,
                            size:   size.width <=900 && size.width >=1300,
                          ),
                        );
                      }),
                ),
              ],
            ),

            SizedBox(height: 20,),
            InkWell(
              onHover: (value){
                setState(() {
                  isCart = false;
                });
              },
              onTap: (){
                setState(() {
                  isCart = false;
                });
              },
              child: CustomItemsDashboard(
                iconData: Icons.shopping_cart_outlined,
                title: "Giỏ Hàng",
                isSelect:  isCart,
                size:   size.width <=900 && size.width >=1300,
              ),
            ),

            Spacer(),
            Stack(
              children: [
                Image.asset(
                  "assets/notification_image.png",
                  fit: BoxFit.fill,
                  //color: Colors.deepPurple,
                ),
              ],
            ),
          ],
        ),
      ),
      body:  SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(size.width >=1300)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(2,2),
                        blurRadius: 8
                      ),
                    ],
                  ),
                  child:  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left : 20),
                    height: size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
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

                        SizedBox(height: 20,),
                        Text(
                          "Tools",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              height: size.height/2,
                              child:  ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listTools.length,
                                  itemBuilder: (context, index){
                                    return InkWell(
                                      onHover: (value){
                                        // setState(() {
                                        //   currentTools = index;
                                        //   isSelect = false;
                                        // });
                                      },
                                      onTap: (){
                                        setState(() {
                                          currentTools = index;
                                          isSelect = true;
                                        });
                                      },
                                      child: CustomItemsDashboard(
                                        iconData: listTools[index]["icon"],
                                        title: listTools[index]["text"],
                                        isSelect:  currentTools == index,
                                        size:   size.width <=900 && size.width >=1300,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        InkWell(
                          onHover: (value){
                            if (value){
                              setState(() {
                                isCart =value;
                              });
                            }else{
                              setState(() {
                                isCart =value;
                              });
                            }
                          },
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenCart()));
                            //Navigator.pushNamed(context, ScreenCart.routeName);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20, left: 0 , right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isCart ? Colors.grey.shade200 : Colors.transparent,
                            ),
                            child:Stack(
                              overflow: Overflow.visible,
                              children: [
                                cart.itemCount ==0 ? Container(): Positioned(
                                  top: -10,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isCart ? Colors.green : Colors.deepPurple,
                                    ),
                                    child: Text(
                                      ""+cart.itemCount.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: isCart ? Colors.purple :Colors.grey,
                                    ),
                                    SizedBox(width: 5,),

                                    Text(
                                      "Gio hang",
                                      style: TextStyle(
                                          color:isCart ? Colors.black87 : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),


                        Spacer(),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/notification_image.png",
                              fit: BoxFit.fill,
                              //color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey.shade100,
                  child: Stack(
                    children: [
                      if(currentTools ==0)
                        PageDashboard(),
                      if(currentTools ==1)
                        ScreenOffers(),
                      if(currentTools ==2)
                        ScreenLike(),
                      if(currentTools ==3)
                        ScreenCategory(),
                      if(currentTools ==4)
                        ScreenSearch(),
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
