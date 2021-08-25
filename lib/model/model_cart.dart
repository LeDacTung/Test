import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String hinhAnh;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.hinhAnh,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void Soluong(productId, quantity){
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingValue) => CartItem(
          id: existingValue.id,
          title: existingValue.title,
          price: existingValue.price,
          quantity: quantity,
          hinhAnh: existingValue.hinhAnh ,
        ),
      );
    }
    notifyListeners();
  }


  void addItem(String productId, double price, String title, String hinhAnh, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingValue) => CartItem(
          id: existingValue.id,
          title: existingValue.title,
          price: existingValue.price,
          quantity: existingValue.quantity + 1,
              hinhAnh: existingValue.hinhAnh ,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: productId,
          price: price,
          title: title,
          quantity: quantity,
              hinhAnh: hinhAnh

        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
              hinhAnh: existingCartItem.hinhAnh,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
