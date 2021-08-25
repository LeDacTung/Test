import 'dart:async';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/reponesive/app_reponsive.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/widget/widget_barchart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_detail/screen_detail.dart';
import 'package:flutter_doan/wiget/custom_item_product.dart';


import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../service.dart';
import 'model/model_tools.dart';
class PageDashboard extends StatefulWidget {
  const PageDashboard({Key? key}) : super(key: key);

  @override
  _PageDashboardState createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {

  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;
  bool isHover=false;

  List<ModelSanPham> models_1=[];
  List<ModelSanPham> models_2=[];
  List<ModelSanPham> models_3=[];
  List<ModelSanPham> models_4=[];

  SanPham sanPham =new SanPham();
  _getSanPham() {
    sanPham.getSanPham_1().then((value){
        setState(() {
          models_1 = value;
        });
    });

    sanPham.getSanPham_2().then((value){
    setState(() {
      models_2 = value;
    });
  });

    sanPham.getSanPham_3().then((value){
    setState(() {
      models_3 = value;
    });
  });

    sanPham.getSanPham_4().then((value){
    setState(() {
      models_4 = value;
    });
  });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    });

    _getSanPham();

  }
  int currentItemProduct=-1;
  @override
  Widget build(BuildContext context) {
    String searchInput="";
    bool isSearch=false;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 35) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: [
            Container(
              height: size.height/4,
              decoration: BoxDecoration(
              ),
              child: Image.asset(
                "assets/banner_1.png",
                fit: BoxFit.cover,
                width: size.width,
                height: size.height/5,
              ),
            ),

            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(
                left: 70,
                right: 70
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        flex:3,
                          child: Container(
                            height: size.height*4.5/10,
                            child: Stack(
                              children: [
                                Container(
                                  height: size.height*4.5/10,
                                  color: Colors.white,
                                  child: PageView.builder(
                                      controller: _pageController,
                                      onPageChanged: (value){
                                        setState(() {
                                          _currentPage = value;
                                        });
                                      },
                                      itemCount: models_1.length,
                                      itemBuilder: (context, index){
                                        return InkWell(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ScreenDetail(modelSanPham: models_1[index],))
                                            );
                                          },
                                          child: Image.network(
                                            models_1[index].hinhAnh,
                                            // fit: BoxFit.fitWidth,
                                          ),
                                        );
                                      }
                                  ),
                                ),
                                Positioned(
                                  left: size.width*0.2,
                                  bottom: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(models_1.length, (index){
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height: 8,
                                        width: _currentPage == index ? 30 :  8,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:  _currentPage == index ? Colors.deepPurple : Color(0xFFD8D8D8)
                                        ),
                                      );
                                    }),
                                  ),
                                ),

                              ],
                            ),
                          ),
                      ),
                      SizedBox(width: 20,),
                      if(size.width>=1300)
                      Expanded(
                        flex:2,
                        child: Container(
                          color: Colors.grey.shade100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://cdn0.fahasa.com/media/wysiwyg/Thang-08-2021/cambridge-07-08-12-081920.png"
                              ),
                              SizedBox(height:size.height*0.04,),
                              Image.network(
                                  "https://cdn0.fahasa.com/media/wysiwyg/Thang-08-2021/cambridge-07-08-12-081920.png"
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Text(
                    models_1.length == 0 ? "Loai SP" : models_1[0].tenLoai,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          blurRadius:2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomGridViewDashboard(models: models_1, currentItemProduct: currentItemProduct, size: size),

                  SizedBox(height: 20,),
                  Text(
                    models_2.length == 0 ? "Loai SP" : models_2[0].tenLoai,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          blurRadius:2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomGridViewDashboard(models: models_2, currentItemProduct: currentItemProduct, size: size),


                  SizedBox(height: 20,),
                  Text(
                    models_3.length == 0 ? "Loai SP" : models_3[0].tenLoai,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          blurRadius:2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomGridViewDashboard(models: models_3, currentItemProduct: currentItemProduct, size: size),

                  SizedBox(height: 20,),
                  Text(
                    models_3.length == 0 ? "Loai SP" : models_3[0].tenLoai,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          blurRadius:2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomGridViewDashboard(models: models_4, currentItemProduct: currentItemProduct, size: size)

                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class CustomGridViewDashboard extends StatelessWidget {
  List<ModelSanPham> models;
  int currentItemProduct;
  Size size;
  CustomGridViewDashboard({
    required this.models,
    required this.currentItemProduct,
    required this.size,
});

  @override
  Widget build(BuildContext context) {

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Row(
      children: [
        models.length == 0
            ? Container()
            : Expanded(
          child: Container(
            height: size.height/1.85,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              controller: new ScrollController(keepScrollOffset: false),
              itemCount: models.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppReponsive.isMobile(context) ? 2 : 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio:AppReponsive.isMobile(context) ?  size.height / size.width/1.5 : size.width / size.height/3
              ),
              itemBuilder: (context, index){
                return CustomItemListProduct(
                  isHover: currentItemProduct == index,
                  models: models[index],
                  size: size,
                  function: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ScreenDetail(modelSanPham: models[index]))
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}




class CustomItemThongKe extends StatefulWidget {
  String text, count;
  int percent;
  Size size;
  CustomItemThongKe({
    required this.text,
    required this.count,
    required this.percent,
    required this.size,
});
  @override
  _CustomItemThongKeState createState() => _CustomItemThongKeState();
}

class _CustomItemThongKeState extends State<CustomItemThongKe> {

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (widget.percent <0){
      color =Colors.red;
    }else if (widget.percent == 0){
      color =Colors.orange;
    }else if (widget.percent > 0){
      color =Colors.green;
    }

    return Container(
      height: 80,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.count,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),

              Row(
                children: [
                  Icon(
                    Icons.show_chart,
                    color: color,
                  ),
                  Text(
                    widget.percent.toString()+"%",
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
