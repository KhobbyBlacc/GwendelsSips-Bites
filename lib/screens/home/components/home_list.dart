import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/Models/banner.dart';
import 'package:gwendels_sips_n_bites/Models/food_model.dart';
import 'package:gwendels_sips_n_bites/widgets/food_list.dart';
import 'package:provider/provider.dart';

import '../../../Models/cart_model.dart';
import '../../../Models/wish_list.dart';
import '../custom_app_bar.dart';

class HomeLisItems extends StatelessWidget {
  HomeLisItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //food model using provider
    final foodData = Provider.of<Products>(context);
    final productFoodData = foodData.food;

    //add to cart provider
    final cart = Provider.of<Cart>(context);
     final wish = Provider.of<WishList>(context);

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Container(
       padding: const EdgeInsets.only(top: 70),
        child: const CusAppBar())),
        body: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: Material(
                child: CarouselSlider(
                    options: CarouselOptions(
                       // height: 250,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.easeIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                           const Duration(milliseconds: 800)),
                    items: bannerImage
                        .map((e) => Stack(
                          children: [
                            Container(
                              height: 180,
                              margin:const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                 // color: Colors.greenAccent,
                                  image: DecorationImage(
                                        image: AssetImage(e),
                                        fit: BoxFit.contain))),

                        Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                            child:const Text("Pastries for all ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                )
                           ],
                              
                        ))
                        .toList()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: productFoodData.length,
                itemBuilder: (BuildContext context, int index) => 
                ChangeNotifierProvider.value(value: productFoodData[index],
                child: FoodList(foodImage: productFoodData[index].foodImage.toString(),
                                price: productFoodData[index].price,
                                foodName: productFoodData[index].foodName.toString(), 
                                description: productFoodData[index].description.toString(),),
                )
                 
                  
                ,
              ),
            ),
            const SizedBox(
              height: 45,
            )
          ],
        ));
  }
}
