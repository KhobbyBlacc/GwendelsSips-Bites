import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwendels_sips_n_bites/Models/banner.dart';
import 'package:gwendels_sips_n_bites/Models/food_model.dart';
import 'package:gwendels_sips_n_bites/screens/cart.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../Models/cart_model.dart';
import '../../Models/wish_list.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/productDetails';

  ProductDetails();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decreseCount() {
    if (_count < 2) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  final bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedFood = Provider.of<Products>(context).findById(foodId);

    final cart = Provider.of<Cart>(context);
    final wish = Provider.of<WishList>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loadedFood.foodImage),
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
            left: 30,
            top: 30 + MediaQuery.of(context).padding.top,
            child: InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: ClipOval(
                child: Container(
                  height: 45,
                  width: 42,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ]),
                  child:
                      const Center(child: Icon(EvaIcons.arrowIosBackOutline)),
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 30 + MediaQuery.of(context).padding.top,
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              }),
              child: ClipOval(
                child: Container(
                  height: 45,
                  width: 42,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ]),
                  child: Center(
                    child: Icon(EvaIcons.shoppingCartOutline),
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, -4),
                      )
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                " ${loadedFood.foodName}",
                                style: TextStyle(fontSize: 36),
                              ),
                            ),
                            LikeButton(
                              // onTap: onLikeButtonTapped,
                              size: 30,
                              isLiked: _isFav,
                              likeBuilder: (_isFav) {
                                final color =
                                    _isFav ? Colors.pink : Colors.black;
                                return Icon(
                                  EvaIcons.heart,
                                  size: 40,
                                  color: color,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Row(children: [
                          Text(
                            "GHC ${loadedFood.price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 25),
                          ),
                          Text(
                            " / ${loadedFood.description} ",
                            style: TextStyle(color: Colors.grey),
                          )
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Text(
                            "Can be delivered to you or call for pickup",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            "A sweet, baked, breadlike food, made with or without shortening, and usually containing flour, sugar, baking powder or soda, eggs, and liquid flavoring.",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 49,
                                width: 49,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(228, 228, 228, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: _decreseCount,
                                  child: const Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              Container(
                                  height: 49,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "${_count}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Container(
                                height: 49,
                                width: 49,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 117, 184, 120),
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: _incrementCount,
                                  child: const Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.07),
                                  offset: Offset(0, -3),
                                  blurRadius: 12)
                            ]),
                        child: Row(children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Total ",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              Text("GhC 120.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20)),
                            ],
                          )),
                          Material(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "Item Added to cart");
                                cart.addItem(foodId, loadedFood.foodName,
                                    loadedFood.foodImage, loadedFood.price);
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                    // color: Color.fromRGBO(243, 175, 45, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Add to cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20)),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }
}
