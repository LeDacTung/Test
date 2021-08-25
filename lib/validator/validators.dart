class Validations{
  static String isValidationsUser(String user){
    String result="";
    if(user.isEmpty){
      result="Thong tin khong duoc trong";
    }else if(!user.contains("@")){
      result="Gmail phai co @";
    }else if(user.length <=6){
      result="Ky tu user qua ngan";
    }else{
      result ="";
    }
    return result;
    //return user != "" && user.length >=6;
  }

  static String isValidationsPass(String pass){
    String result="";
    if(pass == ""){
      result="Thong tin khong duoc trong";
    }else if(pass.length <=6){
      result="Pass qua ngan";
    }else{
      result ="";
    }

    return result;
  //  return pass != "" && pass.length >=6;
  }
}