import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/home_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeLisItems(),
    );
  }
}