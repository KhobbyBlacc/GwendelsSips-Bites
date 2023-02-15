
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/Models/food_model.dart';
import 'package:gwendels_sips_n_bites/Models/orders.dart';
import 'package:gwendels_sips_n_bites/screens/details_screen/home_datails.dart';

import 'package:gwendels_sips_n_bites/screens/login.dart';
import 'package:provider/provider.dart';

import 'Models/cart_model.dart';
import 'Models/wish_list.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: WishList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GwendelsSipsnBites',
        theme: ThemeData(
          // backgroundColor: Colors.black,
          primarySwatch: Colors.green,
        ),
        home: Login(),
        routes: {
          ProductDetails.routeName: (context) => ProductDetails(),
        },
      ),
    );
  }
}
