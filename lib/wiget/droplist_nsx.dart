import 'package:flutter/material.dart';
import 'package:flutter_doan/model/dropdown/dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_doan/model/model_loai_sp.dart';
import 'package:flutter_doan/model/model_nxb.dart';


class SelectDropListNSX extends StatefulWidget {
  final ModelNXB itemSelected;
  final List<ModelNXB> dropListModel;
  final Function(ModelNXB optionItem) onOptionSelected;

  SelectDropListNSX(this.itemSelected, this.dropListModel, this.onOptionSelected);

  @override
  _SelectDropListState createState() => _SelectDropListState(itemSelected, dropListModel);
}

class _SelectDropListState extends State<SelectDropListNSX> with SingleTickerProviderStateMixin {

  ModelNXB optionItemSelected;
  final  List<ModelNXB> dropListModel;

  AnimationController? expandController;
  Animation<double>? animation;

  bool isShow = false;

  _SelectDropListState( this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 350)
    );
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if(isShow) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Colors.grey,
                  width: 1
              ),
            ),
            child:InkWell(
              onTap: (){
                this.isShow = !this.isShow;
                _runExpandCheck();
                setState(() {

                });
              },
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      optionItemSelected.TenNSX.length ==0
                          ? "Vui long chon"
                          : optionItemSelected.TenNSX
                  ),
                  Icon(
                    isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                    color: Colors.grey,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation!,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(-4,4)
                      ),
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          offset: Offset(2,-2)
                      ),
                    ],
                  ),
                  child: _buildDropListOptions(dropListModel, context)
              )
          ),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<ModelNXB> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(ModelNXB item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Text(item.TenNSX,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          this.optionItemSelected = item;
          isShow = false;
          expandController!.reverse();
          widget.onOptionSelected(item);
        },
      ),
    );
  }

}


