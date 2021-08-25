import 'package:flutter/material.dart';
import 'package:flutter_doan/sharepre/sharepreferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'SCREEN/SCREEN_ADMIN/screen_page.dart';
import 'SCREEN/SCREEN_ADMIN/screen_product/screen_add_product.dart';
import 'SCREEN/SCREEN_USER/sreen/screen_dashboard/screen_dashboard.dart';
import 'SCREEN/screen_login/screen_login.dart';
import 'SCREEN/screen_test.dart';
import 'SCREEN/screen_test2.dart';
import 'model/model_cart.dart';
import 'model/model_like.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  SharePrefer sharePrefer = new SharePrefer();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: ModelLike(),
          ),
        ],
        child: MaterialApp(
          title: 'Web bán sách',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(

            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          home: Stack(
            children: [
              //ScreenPageAdmin(email: "",),
              // ScreenDashboard(email: "",),
              //MyAppAA(),
              ScreenAddProduct(),
              if(sharePrefer.getBoolLogin()== true && sharePrefer.getAdimORUser()=="USER")
                ScreenDashboard(email: sharePrefer.getAdimORUser(),),
              if(sharePrefer.getBoolLogin()== false)
                ScreenLogin(),
            ],
          ),
          // initialRoute: ScreenLogin.routeName,
          // routes: routes,
        )
    );
  }
}


