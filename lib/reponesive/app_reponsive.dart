import 'package:flutter/material.dart';



class AppReponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget deskstop;
  AppReponsive({
    required this.deskstop,
    required this.mobile,
    required this.tablet
});
  static bool isMobile(context) =>MediaQuery.of(context).size.width <900;
  static bool isTablet(context) =>MediaQuery.of(context).size.width >=900 && MediaQuery.of(context).size.width <1100;
  static bool isDesktop(context) =>MediaQuery.of(context).size.width >=1100;

  @override
  Widget build(BuildContext context) {



    Size size =MediaQuery.of(context).size;

    if (isDesktop(context)){
      return deskstop;
    }else if (isTablet(context)){
      return tablet;
    }else if (isMobile(context)){
      return mobile;
    }
    return Container();
  }
}
