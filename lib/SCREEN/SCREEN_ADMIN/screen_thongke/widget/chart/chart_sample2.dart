import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_doan/model/model_dondathang.dart';
import 'package:intl/intl.dart';

import '../../../../../service.dart';

class BarChartSample2 extends StatefulWidget {
  List<ModelDonDH> models;
  BarChartSample2({
    required this.models,
});
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;


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

    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 5);
    final barGroup3 = makeGroupData(2, 10);
    final barGroup4 = makeGroupData(3, 20);
    final barGroup5 = makeGroupData(4, 3);
    final barGroup6 = makeGroupData(5, 18);
    final barGroup7 = makeGroupData(6, 15);

    Random random =new Random();


    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    List<BarChartGroupData> item=[];

    if(models_dondh.length !=0){
      for (int i =0 ; i< models_dondh.length ;i++){
         double rand=  double.parse(random.nextInt(20).toString());
        item.add(makeGroupData(i,  rand));
      }


    }


    rawBarGroups = item;

    showingBarGroups = rawBarGroups;

    // String string0="";
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    //
    // DateTime dateTime0 = dateFormat.parse("15-08-2021 09:10 PM");
    // if(models_dondh.length!=0){
    //
    //   string0 = dateFormat.format(DateTime.now());
    // }

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: 2
                          ),
                        ),
                        child:  Icon(
                          Icons.bubble_chart_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "Thống Kê :"+models_dondh.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (_a, _b, _c, _d) => null,
                          ),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (response.touchInput is PointerExitEvent ||
                                  response.touchInput is PointerUpEvent) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  var sum = 0.0;
                                  for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                                    sum += rod.y;
                                  }
                                  final avg =
                                      sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                  showingBarGroups[touchedGroupIndex] =
                                      showingBarGroups[touchedGroupIndex].copyWith(
                                        barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                          return rod.copyWith(y: avg);
                                        }).toList(),
                                      );
                                }
                              }
                            });
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {

                            switch (value.toInt()){
                              case 0 :
                                return  models_dondh[0].MaKH;
                              case 1 :
                                return models_dondh[1].MaKH;
                              case 2 :
                                return models_dondh[2].MaKH;
                              case 3 :
                                return models_dondh[3].MaKH;
                              case 4 :
                                return models_dondh[4].MaKH;
                              case 5 :
                                return models_dondh[5].MaKH;
                              case 6 :
                                return models_dondh[6].MaKH;

                            }
                            return '';
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 1) {
                              return '100k';
                            }else if (value == 5) {
                              return '500k';
                            }else if (value == 10) {
                              return '1m';
                            }else if (value == 20) {
                              return '2m';
                            } else{
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String date(String s){
    DateFormat dateFormat = DateFormat("EEEE");
    DateTime dateTime = dateFormat.parse(s);
    String string1 = dateFormat.format(dateTime);
    return s;
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      // BarChartRodData(
      //   y: y2,
      //   colors: [rightBarColor],
      //   width: width,
      // ),
    ]);
  }


}