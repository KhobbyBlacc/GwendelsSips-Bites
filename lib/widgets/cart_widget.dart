import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/Models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPrdt extends StatelessWidget {
  final String id;
  final String foodId;
  final String foodName;
  final String foodImage;
  final int quantity;
  final double price;

  CartPrdt(this.id, this.foodId, this.foodName, this.foodImage, this.quantity,
      this.price);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(color: Colors.red),
        onDismissed: ((direction) {
          Provider.of<Cart>(context, listen: false).removeItems(foodId);
        }),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 44, 199, 176)),
          child: Row(
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                      image: AssetImage(foodImage), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200.0,
                      child: Text(
                        foodName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Qty : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "GHC ${price * quantity}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
