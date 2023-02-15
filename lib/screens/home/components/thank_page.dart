import 'package:flutter/material.dart';
import 'package:gwendels_sips_n_bites/screens/home/components/home_list.dart';
import 'package:gwendels_sips_n_bites/screens/home/home.dart';
import 'package:gwendels_sips_n_bites/widgets/food_list.dart';
import 'package:lottie/lottie.dart';

class ThankYouScreen extends StatefulWidget {
  ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Center(
          child: SizedBox(
              height: 500,
              width: 500,
              child: Lottie.asset('assets/lottie/thankyou.json')),
        ),
       const Text(
          'Gwnedels Got you...',
        ),

        const SizedBox(height: 20,),
        MaterialButton(
      onPressed:(){  Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            },
            
      color: Colors.green,
      height: 50,
      minWidth: 300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const Text(
        "Continue Shoping",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    )]));
  }
}

