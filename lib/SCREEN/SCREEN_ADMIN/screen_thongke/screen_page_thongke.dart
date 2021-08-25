import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_thongke/widget/chart/chart_pie.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_thongke/widget/chart/chart_sample2.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_thongke/widget/chart/chart_sample3.dart';
import 'package:flutter_doan/model/model_dondathang.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/model/model_thanhvien.dart';
import 'package:flutter_doan/service.dart';
import 'package:ionicons/ionicons.dart';

class ScreenPageThongKe extends StatefulWidget {
  static String routeName = "/admin/home";
  const ScreenPageThongKe({Key? key}) : super(key: key);

  @override
  _ScreenPageThongKeState createState() => _ScreenPageThongKeState();
}

class _ScreenPageThongKeState extends State<ScreenPageThongKe> {

  Count count =new Count();
  String sCountUser="";
  String sCountProduct="";
  String sCountMoney="";
  String sCountOrder="";


  _getData(){
    count.count_user().then((value){
      setState(() {
        sCountUser =value;
      });
    });

    count.count_product().then((value){
      setState(() {
        sCountProduct =value;
      });
    });

    count.count_order().then((value){
      setState(() {
        sCountOrder =value;
      });
    });

    count.count_money().then((value){
      setState(() {
        sCountMoney =value;
      });
    });
  }

  List<ModelThanhVien> modelTvs=[];
  _getAllThanhVien(){
    allThanhVien().then((value){
      setState(() {
        modelTvs =value;
      });
    });
  }

  List<ModelSanPham> models_1=[];
  SanPham sanPham =new SanPham();
  _getSanPham() {
    sanPham.getSanPham_1().then((value) {
      setState(() {
        models_1 = value;
      });
    });
  }

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
    // TODO: implement initState
    super.initState();
    _getData();
    _getSanPham();
    _getAllThanhVien();
    _getDonHang();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard Main",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                ),

                SizedBox(height: size.height*0.02,),

                Container(
                 width: size.width,
                 child:  GridView.count(
                   crossAxisCount: 4,
                   childAspectRatio: 3,
                   mainAxisSpacing: 20,
                   crossAxisSpacing: 20,
                   shrinkWrap: true,
                   children: [
                     CustomHeaderThongKe(
                         size: size,
                         color: Colors.green,
                         subTitle: sCountOrder,
                         title: "Total Orders :",
                         iconData: Icons.shopping_cart_outlined
                     ),
                     CustomHeaderThongKe(
                         size: size,
                         color: Colors.deepPurple,
                         subTitle: sCountUser,
                         title: "Total Users :",
                         iconData: Icons.supervised_user_circle_outlined
                     ),
                     CustomHeaderThongKe(
                         size: size,
                         color: Colors.indigo,
                         subTitle: sCountProduct,
                         title: "Total Product :",
                         iconData: Icons.book_outlined
                     ),
                     CustomHeaderThongKe(
                         size: size,
                         color: Colors.deepOrange,
                         subTitle:sCountMoney,
                         title: "Total Money :",
                         iconData: Icons.monetization_on_outlined
                     ),

                   ],
                 ),
               ),
                SizedBox(height: size.height*0.03,),
                Container(
                  width: size.width,
                  height: size.height/2,
                  child: Row(
                    children: [
                      Expanded(
                        flex:6,
                          child: Container(
                            height: size.height/2,
                            child: BarChartSample2(models: models_dondh,),
                          ),
                      ),
                      Expanded(
                        flex:5,
                        child: Container(
                          height: size.height/2-5,
                          child: PieChartSample2(),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height*0.03,),
                Container(
                  width: size.width,
                  height: size.height/1.5,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child:SingleChildScrollView(
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Most Product",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black87,
                                    fontSize: 19,
                                  ),
                                ),
                                SizedBox(height: size.height*0.01,),
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
                                        tableHeader( text: 'Mã SP',),
                                        tableHeader( text: 'Hình ảnh',),
                                        tableHeader( text: 'Tên SP',),
                                        tableHeader( text: 'SL Mua',),
                                        tableHeader( text: 'Loại SP',),
                                      ],

                                    ),
                                  ],
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: models_1.length,
                                    itemBuilder: (context, index){
                                      return Table(
                                        children: [
                                          tableRowProduct(
                                            context,
                                            size,
                                            tensp: models_1[index].tenSP,
                                            mua: models_1[index].soLanMua,
                                            ha: models_1[index].hinhAnh,
                                            loai:  models_1[index].tenLoai,
                                            masp:  models_1[index].maSP,
                                          ),
                                        ],
                                      );
                                    }
                                ),

                              ],
                            ),
                          ),
                        )
                      ),
                      SizedBox(width: size.width*0.012,),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                  fontSize: 19,
                                ),
                              ),
                              SizedBox(height: size.height*0.01,),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),

                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: modelTvs.length,
                                  itemBuilder: (context, index){
                                    return CustomUser(
                                      size: size,
                                      email: modelTvs[index].EmailThanhVien,
                                      hoten: modelTvs[index].HoTen,
                                    );
                                  }
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomHeaderThongKe extends StatelessWidget {
  Size size;
  Color color;
  String title, subTitle;
  IconData iconData;
  CustomHeaderThongKe({
    required this.size,
    required this.color,
    required this.subTitle,
    required this.title,
    required this.iconData,

});
  @override
  Widget build(BuildContext context) {
    return  Container(
     width: size.width/4,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: color,
                    blurRadius: 15,
                    offset: Offset(-2,2)
                ),
              ],
            ),
            child: Icon(
            iconData,
              color:Colors.white,
              size: size.height*0.04,
            ),
          ),
          SizedBox(width: size.width*0.02,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: size.height*0.01,),
              Text(
                subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class tableHeader extends StatelessWidget {
  String text;
  tableHeader({
    required this.text,
});

  @override
  Widget build(BuildContext context) {
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

class CustomUser extends StatelessWidget {
  Size size;
  String email, hoten;

  CustomUser({
    required this.size,
    required this.email,
    required this.hoten,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Ionicons.person_circle_outline,
              color:Color(0xff2c4260),
              size: 53,
            ),
            SizedBox(width: size.width*0.01,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: size.height*0.002,),
                Text(
                  hoten,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            Spacer(),
            Container(
              height: 15,
              width: 15,
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            SizedBox(width: size.width*0.01,),
          ],
        ),

        Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}


TableRow tableRowProduct(context,size, {masp, ha, tensp, mua, loai}){
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
              masp,
            )
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 0),
          child: Image.network(ha),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(
              tensp,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(mua,style: TextStyle(color: Colors.red),),
        ),
      ),

      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child:  Container(
          margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
          child: Text(
            loai,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ],
  );
}