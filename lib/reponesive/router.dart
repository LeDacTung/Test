import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_order/screen_order.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_page.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_product/screen_page_product.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_thongke/screen_page_thongke.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_user/screen_page_user.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_cart/screen_cart.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/page/page_dashboard.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/screen_dashboard.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_detail/screen_detail.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_like/screen_like.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_search/screen_search.dart';
import 'package:flutter_doan/SCREEN/screen_login/screen_login.dart';

final Map<String, WidgetBuilder> routes = {
  //ScreenDetail.routeName: (context) => ScreenDetail(modelSanPham: ,),
  // PageDashboard.routeName: (context) => PageDashboard(),
  // ScreenCart.routeName: (context) => ScreenCart(),
  ScreenLogin.routeName: (context) => ScreenLogin(),
  // ScreenLike.routeName: (context) => ScreenLike(),
  // ScreenSearch.routeName: (context) => ScreenSearch(),
  // ScreenOrder.routeName: (context) => ScreenOrder(),
  ScreenPageUser.routeName: (context) => ScreenPageUser(),
  ScreenPageProduct.routeName: (context) => ScreenPageProduct(),
  ScreenPageThongKe.routeName: (context) => ScreenPageThongKe(),
  ScreenPageAdmin.routeName: (context) => ScreenPageAdmin(email: "",),
  ScreenDashboard.routeName: (context) => ScreenDashboard(email: "",),
  ScreenCart.routeName: (context) => ScreenCart(),
};
