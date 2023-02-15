import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwendels_sips_n_bites/Models/cart_model.dart';
import 'package:provider/provider.dart';

import '../Models/food_model.dart';
import '../screens/details_screen/home_datails.dart';

class FoodList extends StatelessWidget {
  final String foodName;
  final String foodImage;
  final double price;
  final String description;

  // ignore: use_key_in_widget_constructors
  FoodList(
      {required this.foodName,
      required this.foodImage,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    //product provider
    final foodPdt = Provider.of<FoodModel>(context);
    //provider cart
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: (() {
        Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: foodPdt.id);
      }),
      child: Container(
        decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, spreadRadius: 2.0, blurRadius: 5.0),
            ]),
        margin:const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children:[ SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    foodImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
           ] ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName.toString(),
                      style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: Text(
                        description.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "GHC $price",
                    style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black),
                    child: InkWell(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Item Added to cart");
                        cart.addItem(
                          foodPdt.id,
                          foodPdt.foodName,
                          foodPdt.foodImage,
                          foodPdt.price,
                        );
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
