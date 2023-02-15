import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwendels_sips_n_bites/Models/orders.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/thank_page.dart';
import 'package:provider/provider.dart';
import '../Models/cart_model.dart';

import 'package:gwendels_sips_n_bites/widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
//call provider for cart
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowIosBack,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Shopping Cart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 470,
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => CartPrdt(
                        cart.items.values.toList()[index].id,
                        cart.items.keys.toList()[index],
                        cart.items.values.toList()[index].foodName,
                        cart.items.values.toList()[index].foodImage,
                        cart.items.values.toList()[index].quantity,
                        cart.items.values.toList()[index].price,
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "GHC ${cart.totalAmount}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Delivery charge",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "GHC 0.00",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sub Total",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "GHC ${cart.totalAmount}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            CheckOutButton(cart: cart),
            // MaterialButton(
            //   onPressed: () {},
            //   color: Colors.green,
            //   height: 50,
            //   minWidth: double.infinity,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15)),
            //   child: Text(
            //     "Proceed To Checkout",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class CheckOutButton extends StatefulWidget {
  CheckOutButton({Key? key, required this.cart}) : super(key: key);

  final Cart cart;

  @override
  State<CheckOutButton> createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.cart.totalAmount < 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);

              widget.cart.clear();
              Fluttertoast.showToast(msg: "Make payments");

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ThankYouScreen()));
            },
      color: Colors.green,
      height: 50,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const Text(
        "Proceed To Checkout",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
