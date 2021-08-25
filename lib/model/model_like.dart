import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/model/model_sanpham.dart';

class ModelLikeItem{
  ModelSanPham modelSanPham;
  ModelLikeItem({
    required this.modelSanPham
});
}
class ModelLike with ChangeNotifier {
  Map<String, ModelLikeItem> _items = {};

  Map<String, ModelLikeItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }



  void addItem(ModelSanPham modelSanPham) {
      _items.putIfAbsent(
        modelSanPham.maSP,
            () => ModelLikeItem(
         modelSanPham:modelSanPham,
        ),
      );

    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}