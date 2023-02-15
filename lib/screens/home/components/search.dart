import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/Models/wish_list.dart';
import 'package:provider/provider.dart';

import '../../../Models/cart_model.dart';
import '../../../widgets/cart_widget.dart';

class MySearchList extends StatefulWidget {
  MySearchList({Key? key}) : super(key: key);

  @override
  State<MySearchList> createState() => _MySearchListState();
}

class _MySearchListState extends State<MySearchList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            Row(
              children:const [
                 Text(
                  "My WishList",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10,),
                Icon(Icons.favorite, color: Colors.red, size: 50,)
              ],
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
          
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
