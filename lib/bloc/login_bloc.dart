import 'dart:async';

import 'package:flutter_doan/validator/validators.dart';

class LoginBloc{
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;


  bool isValiInfo(String username, String pass){
    if(Validations.isValidationsUser(username) != ""){
      _userController.sink.addError(Validations.isValidationsUser(username));
      return false;
    }

    _userController.sink.add("OK");

    if(Validations.isValidationsPass(pass) != ""){
      _passController.sink.addError(Validations.isValidationsPass(pass));
      return false;
    }
    _passController.sink.add("OK");

    return true;
  }

  void dispose(){
    _userController.close();
    _passController.close();
  }

}