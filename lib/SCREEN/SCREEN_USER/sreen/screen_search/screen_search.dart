import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_doan/service.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_detail/screen_detail.dart';
import 'package:flutter_doan/wiget/custom_item_product.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';


class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  _ScreenSearchState createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {

    bool isSearch=false;
   int currentItemProduct =-1;
   List<ModelSanPham> models=[];
   List<ModelSanPham> modelAll=[];
    List<String> listTenSP=[];
    TextEditingController textEditingController =new TextEditingController();

    ScrollController scrollController =new ScrollController();

    //String searchInput="";
    SanPham sanPham =new SanPham();

    _searchSanPhamWithTenSP(tenSp){
      sanPham.searchSanPhamWithTenSP(tenSp).then((value){
        models =value;
      });
    }

    _getAllSanPham(){
      sanPham.getSanPham_all().then((value){
        modelAll =value;
        for(var i =0; i< modelAll.length ;i++){
          listTenSP.add(modelAll[i].tenSP);
        }

      });
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllSanPham();
    if (scrollController.hasClients)
      scrollController.jumpTo(50.0);

  }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body:SingleChildScrollView(
        child:  SafeArea(
            child: Column(
              children: [
                Container(
                  height: size.height/4,
                  decoration: BoxDecoration(
                  ),
                  child: Image.asset(
                    "assets/banner_1.png",
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height/5,
                  ),
                ),

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: size.height*2,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Search",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),
                            textEditingController.text.length ==0
                                ?Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "    Không có kết quả",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Expanded(
                              child: Container(
                                height: size.height/1.5,
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: models.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio:   size.width / size.height/3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index){
                                    return CustomItemListProduct(
                                      isHover: currentItemProduct == index,
                                      models: models[index],
                                      size: size,
                                      function: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>ScreenDetail(modelSanPham: models[index]))
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child:  Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: textEditingController.text.length !=0 ? size.height/1.25 : 40,
                          width:  size.width,
                          decoration: BoxDecoration(
                            color: textEditingController.text.length !=0  ? Colors.deepPurple : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                offset: Offset(2,2),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: TextField(
                                      // autofocus: true,
                                      controller: textEditingController,
                                      scrollController: scrollController,
                                      onChanged: (value){
                                        setState(() {
                                          // models=[];
                                          TextSelection previousSelection = textEditingController.selection;
                                          textEditingController.text = value;
                                          _searchSanPhamWithTenSP(textEditingController.text);
                                          textEditingController.selection = previousSelection;
                                        });
                                      },

                                      textInputAction: TextInputAction.search,

                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color:  textEditingController.text.length ==0 ? Colors.grey.shade500 : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15
                                      ),
                                      keyboardType: TextInputType.multiline,

                                      decoration: InputDecoration(
                                        hintText: "Search...",
                                        contentPadding: EdgeInsets.all(12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color:  textEditingController.text.length ==0 ? Colors.grey.shade500 : Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search_rounded,
                                          color:  textEditingController.text.length ==0 ? Colors.grey.shade500 : Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                                textEditingController.text.length ==0
                                    ?Container()
                                    : Expanded(
                                    flex: 6,
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 1.5,
                                          color: Colors.white,
                                        ),

                                        Expanded(
                                          child:  ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: models.length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index){
                                                return InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      //models=[];
                                                      // textEditingController.text = listTenSP[index];
                                                      // _searchSanPhamWithTenSP(textEditingController.text);
                                                      // print("TenSP : "+textEditingController.text);
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.all(7),
                                                    padding: EdgeInsets.all(7),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.search_off_outlined,
                                                          color: Colors.grey.shade500,
                                                        ),
                                                        SizedBox(width: 8,),
                                                        Expanded(
                                                          child: Text(
                                                            models[index].tenSP.toString(),
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                          ),)
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}

