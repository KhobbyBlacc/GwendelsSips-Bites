import 'package:flutter/material.dart';

class WishListItem {
  final String id;
  final String foodImage;
  final String foodName;
  final int quantity;
  final double price;

  WishListItem(
      {required this.id,
      required this.foodImage,
      required this.foodName,
      required this.quantity,
      required this.price});
}

class WishList with ChangeNotifier {
  Map<String, WishListItem> _items = {};

  Map<String, WishListItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String id, String foodName, String foodImage, double price) {
    //update cart items
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingWishListItem) => WishListItem(
                id: DateTime.now().toString(),
                foodName: existingWishListItem.foodName,
                foodImage: existingWishListItem.foodImage,
                price: existingWishListItem.price,
                quantity: existingWishListItem.quantity + 1,
              ));
    }
    //add to empty cart
    else {
      _items.putIfAbsent(
          id,
          () => WishListItem(
              id: DateTime.now().toString(),
              foodName: foodName,
              foodImage: foodImage,
              quantity: 1,
              price: price));
    }
//notify state after a change or update
    notifyListeners();
  }

  //remove cart items from cart
  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  //remove single cart item from cart
  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (existingWishListItem) => WishListItem(
              id: DateTime.now().toString(),
              foodName: existingWishListItem.foodName,
              foodImage: existingWishListItem.foodImage,
              quantity: existingWishListItem.quantity - 1,
              price: existingWishListItem.price));
    }
    notifyListeners();
  }

//total Amount Function
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, WishListItem) {
      total += WishListItem.price * WishListItem.quantity;
    });
    return total;
  }

  //clear cart list
  void clear() {
    _items = {};
    notifyListeners();
  }
}
