import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_thanhvien.dart';
import 'package:flutter_doan/service.dart';
class ScreenPageUser extends StatefulWidget {
  static String routeName = "/admin/user";
  const ScreenPageUser({Key? key}) : super(key: key);

  @override
  _ScreenPageUserState createState() => _ScreenPageUserState();
}

class _ScreenPageUserState extends State<ScreenPageUser> {

  List<ModelThanhVien> modelTvs=[];

  _getAllThanhVien(){
    allThanhVien().then((value){
     setState(() {
       modelTvs =value;
     });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllThanhVien();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard User",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),

              SizedBox(height: size.height*0.02,),

              Text(
                "Note",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff031147),
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Text(
                        "Add user",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color:Colors.green,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.04,),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Text(
                        "Delete user",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color:Colors.deepOrange,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.04,),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Text(
                        "Edit user",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color:Colors.yellow,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height*0.01,),
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(width: size.width*0.005,),
                  Text(
                    "Seen user",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color:Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5
                                )
                            ),
                          ),
                          children: [
                            tableHeader("Họ tên"),
                            tableHeader("Địa chỉ"),
                            tableHeader("Số điện thoại"),
                            tableHeader("Email"),
                            tableHeader("Câu hỏi bảo mật"),
                            tableHeader("Loại thành viên"),
                          ],
                        ),

                      ],
                    ),

                    modelTvs.length ==0
                        ? Container(
                      child:  Text(
                        " Khong co user",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    )
                        :  ListView.builder(
                        shrinkWrap: true,
                        itemCount: modelTvs.length,
                        itemBuilder: (context, index){
                          return Table(
                            children: [
                              tableRow(
                                  context,
                                  size,
                                  email: modelTvs[index].EmailThanhVien,
                                  name:  modelTvs[index].HoTen,
                                  sdt:  modelTvs[index].SoDienThoai,
                                  cauhoi:  modelTvs[index].CauTraLoi,
                                  loaiTv:  modelTvs[index].MaLoaiTV,
                                  address:  modelTvs[index].DiaChi
                              )
                            ],
                          );
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  TableRow tableRow(context,size, {email, name, address, sdt, cauhoi, loaiTv}){
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey,
                width: 0.5
            )
        ),
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
              margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
              child:Text(
                name,
              )
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
              margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
              child: Text(address),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(sdt),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(email),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(cauhoi),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Row(
              children: [
                if(loaiTv == "1")
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow
                        ),
                      ),
                      SizedBox(width: size.width*0.005,),
                      Container(
                        height: 15,
                        width: 15,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                if(loaiTv == "2")
                  Container(
                    height: 15,
                    width: 15,
                    decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),
                  ),
              ],
            ),
          ),
        ),

      ],
    );
  }


  Widget tableHeader(text){
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

}

