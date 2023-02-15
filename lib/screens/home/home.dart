import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/bottom_nav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNav());
  }
}
