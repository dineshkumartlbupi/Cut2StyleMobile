import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartList = [];

  List<Map<String, dynamic>> get cartList => _cartList;

  int get cartCount => _cartList.length;

  void addToCart(Map<String, dynamic> product) {
    int index =
        _cartList.indexWhere((item) => item['title'] == product['title']);
    if (index == -1) {
      _cartList.add({...product, 'quantity': 1});
      notifyListeners();
    }
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartList.removeWhere((item) => item['title'] == product['title']);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartList[index]['quantity'] += 1;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartList[index]['quantity'] > 1) {
      _cartList[index]['quantity'] -= 1;
    } else {
      _cartList.removeAt(index);
    }
    notifyListeners();
  }

  double get totalAmount {
    return _cartList.fold(0.0, (sum, item) {
      return sum + (double.parse(item['price'].toString()) * item['quantity']);
    });
  }

  void clearCart() {
    cartList.clear();
    notifyListeners();
  }

  void updateQuantityAtIndex(int index, int quantity) {
    if (index >= 0 && index < _cartList.length) {
      _cartList[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  double get gst => totalAmount * 0.18;

  double get grandTotal => totalAmount + gst;
}
