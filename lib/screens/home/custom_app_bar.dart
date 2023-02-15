import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../cart.dart';

class CusAppBar extends StatelessWidget {
  const CusAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 30 * 2,
          right: 10,
        ),
        child: Container(
          height: size.height * 0.20,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                  width: 250,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    icon: Icon(EvaIcons.search),
                  ),
                ),
              )
            ],
          ),
        ),
                    Container(
                      height: 50,
                      width: 50,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black.withOpacity(0.4)),
                      //     borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CartScreen()));
                        },
                        icon: Icon(
                          EvaIcons.shoppingCartOutline,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ));
  }
}
