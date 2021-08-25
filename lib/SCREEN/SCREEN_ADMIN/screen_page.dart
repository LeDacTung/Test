import 'package:flutter/material.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_order/screen_order.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_product/screen_page_product.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_thongke/screen_page_thongke.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_user/screen_page_user.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/model/model_tools.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_tools.dart';

import 'model/tools.dart';
class ScreenPageAdmin extends StatefulWidget {
  static String routeName = "/admin/thongke";
  String email;
  ScreenPageAdmin({
    required this.email
  });

  @override
  _ScreenPageAdminState createState() => _ScreenPageAdminState();
}

class _ScreenPageAdminState extends State<ScreenPageAdmin> {
  int currentTools=2;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                              "ADMIN",
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
                                  itemCount: listToolsAdmin.length,
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
                                        });
                                      },
                                      child: CustomItemsDashboard(
                                        iconData: listToolsAdmin[index]["icon"],
                                        title: listToolsAdmin[index]["text"],
                                        isSelect:  currentTools == index,
                                        size:   size.width <=900 && size.width >=1300,
                                      ),
                                    );
                                  }),
                            ),
                          ],
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
                      ScreenPageThongKe(),
                    if(currentTools ==1)
                       ScreenPageUser(),
                    if(currentTools ==2)
                      ScreenPageProduct(),
                    if(currentTools ==3)
                      ScreenOrder(),

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
