import 'package:shared_preferences/shared_preferences.dart';

class SharePrefer{

  putAdminORUser(cate) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Cate", cate);
  }

  getAdimORUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sCate = prefs.getString("Cate");
    return sCate;
  }

  putBoolLogin(isLogin) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", isLogin);
  }

  getBoolLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool("isLogin");
    return isLogin;
  }
}