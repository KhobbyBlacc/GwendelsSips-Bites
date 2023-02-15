import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/home_list.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/notification.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/search.dart';

import '../../../Models/food_model.dart';
import 'my_account.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

//list of NavItems
enum BottomsIcons {
  Home,
  Account,
  Favorites,
}

class _BottomNavState extends State<BottomNav> {
  BottomsIcons bottomsIcons = BottomsIcons.Home;

  @override
  Widget build(BuildContext context) {

    List<FoodModel> cart = [];

    return Scaffold(
        body: Stack(children: <Widget>[
      //calling Fragments from the bottomNav
      bottomsIcons == BottomsIcons.Home
          ? Center(
              child: HomeLisItems(),
            )
          : Container(),
      bottomsIcons == BottomsIcons.Favorites
          ? Center(
              child: MySearchList(),
            )
          : Container(),
      bottomsIcons == BottomsIcons.Account
          ? Center(
              child: MyAccount(),
            )
          : Container(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
       //   padding: EdgeInsets.only(left: 24, right: 24, bottom: 19),
            child: Container(
             padding: EdgeInsets.only(top:10, bottom: 10, left: 2),
              height: 75,
               decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
               // blurRadius: 10,
                //offset: Offset(0, 10),
              )
            ],
          //  borderRadius: BorderRadius.circular(50),
          ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomsIcons = BottomsIcons.Home;
                      });
                    },
                    child: bottomsIcons == BottomsIcons.Home
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Icon(
                                  EvaIcons.home,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.homeOutline, 
                        color: Colors.white,),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomsIcons = BottomsIcons.Favorites;
                      });
                    },
                    child: bottomsIcons == BottomsIcons.Favorites
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children:const[
                                Icon(
                                    EvaIcons.heartOutline,
                                    color: Colors.green,
                                
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Wishlist",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Icon(EvaIcons.heartOutline, 
                        color: Colors.white),
                  ),
                
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomsIcons = BottomsIcons.Account;
                      });
                    },
                    child: bottomsIcons == BottomsIcons.Account
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Icon(
                                  EvaIcons.personAddOutline,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Account",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.personAddOutline, 
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          
        ),
      ),
    ]));
  }
}
