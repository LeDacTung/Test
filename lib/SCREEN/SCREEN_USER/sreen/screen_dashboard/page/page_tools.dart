import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/model/model_tools.dart';

class PageTools extends StatefulWidget {
  const PageTools({Key? key}) : super(key: key);

  @override
  _PageToolsState createState() => _PageToolsState();
}

class _PageToolsState extends State<PageTools> {

  int currentTools=0;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
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
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.purple,
                    width: 2
                  ),
                ),
                child:  Icon(
                  Icons.bubble_chart_outlined,
                  color: Colors.purple,
                ),
              ),
              SizedBox(width: 8,),
              Text(
                "HRM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
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
                          setState(() {
                            currentTools = index;
                          });
                        },
                        onTap: (){
                          setState(() {
                            currentTools = index;
                          });
                        },
                        child: CustomItemsDashboard(
                          iconData: listTools[index]["icon"],
                          title: listTools[index]["text"],
                          isSelect:  currentTools == index,
                          size:  size.width <=900 && size.width >=1300,
                        ),
                      );
                    }),
              ),
            ],
          ),

          Spacer(),
          Image.asset(
              "assets/notification_image.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class CustomItemsDashboard extends StatefulWidget {
  IconData iconData;
  String title;
  bool isSelect;
  bool size;
  CustomItemsDashboard({
    required this.iconData,
    required this.title,
    required this.isSelect,
    required this.size
});

  @override
  _CustomItemsDashboardState createState() => _CustomItemsDashboardState();
}

class _CustomItemsDashboardState extends State<CustomItemsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 20, left: 0 , right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelect ? Colors.grey.shade200 : Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(
            widget.iconData,
            color: widget.isSelect ? Colors.purple :Colors.grey,
          ),
          SizedBox(width: 5,),

          Text(
            widget.title,
            style: TextStyle(
                color: widget.isSelect ? Colors.black87 : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}

