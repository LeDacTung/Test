import 'dart:html';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_page.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/screen_dashboard.dart';
import 'package:flutter_doan/bloc/login_bloc.dart';
import 'package:flutter_doan/model/model_thanhvien.dart';
import 'package:flutter_doan/service.dart';
import 'package:flutter_doan/sharepre/sharepreferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenLogin extends StatefulWidget {
  static String routeName = "/login";
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool isHover =false;
  bool isScreen =false;

  String emailSignIn="";
  String passSignIn="";

  String emailSignUp="";
  String passSignUp="";
  String nameSignUp="";
  String phoneSignUp="";
  String addressSignUp="";
  String answerSignUp="";




  LoginBloc bloc = new LoginBloc();

  List<ModelThanhVien> modelTvs=[];

  SharePrefer prefer = new SharePrefer();

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                   child: Stack(
                     children: [
                       Image.asset(
                         "assets/bg.png",
                         fit: BoxFit.cover,
                         height: size.height,
                         width: size.width,
                       ),
                       Positioned(
                           left: 10,
                           top: 10,
                           child:  Row(
                             children: [
                               Container(
                                 padding: EdgeInsets.all(4),
                                 decoration: BoxDecoration(
                                   color: Colors.transparent,
                                   shape: BoxShape.circle,
                                   border: Border.all(
                                       color: Colors.white,
                                       width: 3
                                   ),
                                 ),
                                 child:  Icon(
                                   Icons.book,
                                   color: Colors.white,
                                 ),
                               ),
                               SizedBox(width: 8,),
                               Text(
                                 "WEB BOOK",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.white,
                                   fontSize: 18,
                                 ),
                               ),
                             ],
                           ),
                       ),
                       Positioned.fill(
                         child: Align(
                             alignment: Alignment.center,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Text(
                                   "WELCOME BACK",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w800,
                                     color: Colors.white,
                                     fontSize: 28,
                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Text(
                                   "To keep connected with us please\nlogin with your personal info",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontWeight: FontWeight.w100,
                                     color: Colors.green.shade100,
                                     fontSize: 16,
                                   ),
                                 ),
                                 SizedBox(height: size.height*0.1,),
                                 CustomBtnSignInUp(
                                   isHover: isHover,
                                   func: (){
                                     setState(() {
                                       isScreen = !isScreen;
                                     });
                                   },
                                   size: size,
                                   text: isScreen ? "Sign In" : "Sign Up",
                                 ),

                               ],
                             ),
                         ),
                       ),


                     ],
                   ),
                ),
              ),
              Expanded(
                flex: 5,
                child: isScreen
                    // Sign up
                    ? Container(
                  color: Colors.white,
                  child:SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SIGN UP TO THE WEB BOOK",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xff045808),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          Text(
                            "Sign up continue\nHãy điền đủ thông tin để đăng ký tài khoản",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.green.shade200,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: size.height*0.05,),
                          CustomTextFielEmail(
                              iconData: Icons.email_outlined,
                              size: size,
                              hintText: "Email",
                              errorText: "",
                              onChanged: (value){

                              },
                              textInputAction: TextInputAction.next
                          ),

                          SizedBox(height: size.height*0.01,),
                          CustomTextFielEmail(
                              iconData: Icons.people_outline,
                              size: size,
                              hintText: "Name",
                              errorText: "",
                              onChanged: (value){

                              },
                              textInputAction: TextInputAction.next
                          ),

                          SizedBox(height: size.height*0.01,),
                          CustomTextFielEmail(
                              iconData: Icons.phone_outlined,
                              size: size,
                              hintText: "Phone",
                              errorText: "",
                              onChanged: (value){

                              },
                              textInputAction: TextInputAction.next
                          ),

                          SizedBox(height: size.height*0.01,),
                          CustomTextFielEmail(
                              iconData: Icons.location_on_outlined,
                              size: size,
                              hintText: "Address",
                              errorText: "",
                              onChanged: (value){

                              },
                              textInputAction: TextInputAction.next
                          ),

                          SizedBox(height: size.height*0.01,),
                          CustomTextFielPasseword(
                              iconData: Icons.lock_outline_rounded,
                              size: size,
                              hintText: "Password",
                              errorText: "",
                              onChanged: (value){

                              },
                              textInputAction: TextInputAction.next
                          ),

                          SizedBox(height: size.height*0.02,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "  Question : Bạn thích con vật gì",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.green.shade500,
                                  fontSize: 16,
                                ),
                              ),

                              CustomTextFielPasseword(
                                  iconData: Icons.lock_outline_rounded,
                                  size: size,
                                  hintText: "Answer",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next
                              ),
                            ],
                          ),


                          SizedBox(height: size.height*0.05,),
                          InkWell(
                            onHover: (value){
                            },
                            onTap: (){},
                            child: Container(
                              width:size.width/3,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:  Color(0xff045808),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child:Text(
                                "Sign Up",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white ,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  )
                )

                    // Sign in
                    : Container(
                        color: Colors.white,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "SIGN IN TO THE WEB BOOK",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xff045808),
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "Sign in continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.green.shade200,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: size.height*0.1,),

                            StreamBuilder(
                              stream: bloc.userStream,
                                builder: (context, snapshot){
                                  return CustomTextFielEmail(
                                      iconData: Icons.email_outlined,
                                      size: size,
                                      hintText: "Email",
                                      onChanged: (value){
                                        setState(() {
                                          emailSignIn = value;
                                        });
                                      },
                                      errorText: snapshot.hasError ? snapshot.error.toString() : "",
                                      textInputAction: TextInputAction.next
                                  );
                                }
                            ),


                            SizedBox(height: size.height*0.01,),

                            StreamBuilder(
                                stream: bloc.passStream,
                                builder: (context, snapshot){
                                  return  CustomTextFielPasseword(
                                      iconData: Icons.lock_outline_rounded,
                                      size: size,
                                      hintText: "Password",
                                      errorText: snapshot.hasError ? snapshot.error.toString() : "",
                                      onChanged: (value){
                                        setState(() {
                                          passSignIn = value;
                                        });
                                      },
                                      textInputAction: TextInputAction.next
                                  );
                                }
                            ),


                            SizedBox(height: size.height*0.01,),
                            Text(
                              "Forget password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.green.shade200,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: size.height*0.2,),
                            InkWell(
                              onHover: (value){
                              },
                              onTap: (){
                                if( bloc.isValiInfo(emailSignIn, passSignIn)){
                                  Fluttertoast.showToast(msg:"AAA");
                                }else{
                                  Fluttertoast.showToast(msg:"Loi");
                                }

                                //
                                // loginAdminUser(emailSignIn, passSignIn).then((value){
                                //   modelTvs =value;
                                //   if(modelTvs.length == 0){
                                //     Fluttertoast.showToast(msg:"Error");
                                //   }else{
                                //     if(modelTvs[0].MaLoaiTV == "1"){
                                //       Fluttertoast.showToast(msg:"ADMIN");
                                //       Navigator.pushNamed(context, ScreenPageAdmin.routeName);
                                //       // Navigator.push(
                                //       //     context,
                                //       //     MaterialPageRoute(builder: (context) => ScreenPageAdmin(email: modelTvs[0].EmailThanhVien))
                                //       // );
                                //     }else if(modelTvs[0].MaLoaiTV == "2"){
                                //       Fluttertoast.showToast(msg:"USER");
                                //       prefer.putBoolLogin(true);
                                //       prefer.putAdminORUser("USER");
                                //       // Navigator.push(
                                //       //     context,
                                //       //     MaterialPageRoute(builder: (context) => ScreenDashboard(email: modelTvs[0].EmailThanhVien))
                                //       // );
                                //     }
                                //   }
                                // });
                              },
                              child: Container(
                                width:size.width/3,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:  Color(0xff045808),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child:Text(
                                  "Sign In",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white ,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 22
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class CustomBtnSignInUp extends StatefulWidget {
  bool isHover;
  Function() func;
  Size size;
  String text;
  CustomBtnSignInUp({
    required this.isHover,
    required this.func,
    required this.size,
    required this.text,
});
  @override
  _CustomBtnSignInUpState createState() => _CustomBtnSignInUpState();
}

class _CustomBtnSignInUpState extends State<CustomBtnSignInUp> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onHover: (value){
        if (value){
          setState(() {
            widget.isHover =value;
          });
        }else{
          setState(() {
            widget.isHover =value;
          });
        }
      },
      onTap: widget.func,
      child: Container(
        width:widget.size.width/4,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.isHover ?  Colors.transparent : Color(0xf023216) ,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child:Text(
          widget.text,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white ,
              fontWeight: FontWeight.w200,
              fontSize: 22
          ),
        ),
      ),
    );
  }

}



class CustomTextFielEmail extends StatelessWidget {
  Size size;
  IconData iconData;
  String hintText;
  var errorText;
  Function(String) onChanged;
  TextInputAction textInputAction;

  CustomTextFielEmail({
    required this.iconData,
    required this.size,
    required this.hintText,
    required this.onChanged,
    required this.textInputAction,
    required this.errorText,
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child:  Container(
          width:  size.width/3,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: onChanged,
                textInputAction: textInputAction,
                cursorColor: Colors.white,
                style: TextStyle(
                    color:  Color(0xff045808),
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                ),
                keyboardType: TextInputType.multiline,

                decoration: InputDecoration(
                  hintText: hintText,
                  // errorText: errorText,
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                      color:   Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                  ),
                  prefixIcon: Icon(
                    iconData,
                    color:  Color(0xff045808),
                    size: 20,
                  ),
                ),
              ),
              errorText.length == 0
                  ? Container()
                  : Column(
                children: [
                  Divider(
                    thickness: 0.5,
                    color: Colors.deepOrange,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.deepOrange,
                        size: 12,
                      ),
                      Text(
                        errorText,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
      )
    );
  }
}

class CustomTextFielPasseword extends StatelessWidget {
  Size size;
  IconData iconData;
  String hintText;
  var errorText;
  Function(String) onChanged;
  TextInputAction textInputAction;

  CustomTextFielPasseword({
    required this.iconData,
    required this.size,
    required this.hintText,
    required this.onChanged,
    required this.textInputAction,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        width:  size.width/3,
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: true,
              onChanged:onChanged,

              textInputAction: textInputAction,

              cursorColor: Colors.white,
              style: TextStyle(
                  color:  Color(0xff045808),
                  fontWeight: FontWeight.w400,
                  fontSize: 15
              ),
              keyboardType: TextInputType.multiline,

              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.all(12),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                    color:  Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                ),
                prefixIcon: Icon(
                  iconData,
                  color:  Color(0xff045808),
                  size: 20,
                ),
              ),
            ),
            errorText.length == 0
                ? Container()
                : Column(
              children: [
                Divider(
                  thickness: 0.5,
                  color: Colors.deepOrange,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.deepOrange,
                      size: 12,
                    ),
                    Text(
                      errorText,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

