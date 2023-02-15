import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart_model.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

//mthods for db
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = 'https://gwendelssipsnbites-default-rtdb.firebaseio.com/orders.json';

    final timeStamp = DateTime.now();
    //simple req to db

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'id': DateTime.now().toString(),
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.foodName,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
          }));
      //putting cart list into _orders[]
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              amount: total,
              dateTime: timeStamp,
              products: cartProducts));
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
