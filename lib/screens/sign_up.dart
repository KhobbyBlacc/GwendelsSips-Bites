
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwendels_sips_n_bites/Models/user_model.dart';
import 'package:gwendels_sips_n_bites/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   TextEditingController emailTextController = TextEditingController();
   TextEditingController nameTextController = TextEditingController();
   TextEditingController phoneTextController = TextEditingController();
   TextEditingController passwordTextController = TextEditingController();
   TextEditingController confirmPasswordTextController =
      TextEditingController();



  void signUp() async {
    // FirebaseAuthMethods(FirebaseAuth.instance)
    //     .signUpwithEmail(
    //         email: emailTextController.text,
    //         password: passwordTextController.text,
    //         context: context)
    //     .then((uid) {
    //   final userModel = UserModel(
    //       email: emailTextController.text,
    //       name: nameTextController.text,
    //       phone: phoneTextController.text,
    //       password: passwordTextController.text);
      //Fluttertoast.showToast(msg: "Account created successfully :) ");
     // saveData(userModel);
    // });
  }

  //save userModel data to firestore
  // saveData(UserModel userModel) async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(userModel.email)
  //       .set();
  // }

    @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    phoneTextController.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(
          // title: Container(
          //   width: 500,
          //   height: 200,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage('assets/images/appstore.png'),
          //   )),
          // ),
          // leading: Container(
          //     decoration: BoxDecoration(
          //       border: Border.all(width: 2, ),
          //       boxShadow: [
          //         BoxShadow(
          //             spreadRadius: 2,
          //             blurRadius: 10,
          //             color: Colors.black.withOpacity(0.1)),
          //       ],
          //       shape: BoxShape.circle,
          //     ),
          //     child: IconButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)))),
     // backgroundColor: Colors.black,
      body: SingleChildScrollView(
          padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Center(
            child:  Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)),
                    ],
                    shape: BoxShape.circle,
                    image:const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/appstore.png'),
                    )),
              ),
          ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameTextController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: Colors.black45, width: 3.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                      hintText: "Name")
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phoneTextController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                           const BorderSide(color: Colors.black45, width: 3.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                      hintText: "Phone"),
                      style:const TextStyle(
                      )
                ),
                const SizedBox(
                  height: 10,
                ),
               TextField(
                  controller: emailTextController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                          const  BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                           const BorderSide(color: Colors.black45, width: 3.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                      hintText: "Email or Phone number")
                ),
                const SizedBox(height: 15),
               
                TextField(
                  obscureText: true,
                  controller: passwordTextController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                           const BorderSide(color: Colors.black45, width: 3.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                      hintText: "Password")
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  controller: confirmPasswordTextController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                          const  BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                           const BorderSide(color: Colors.black45, width: 3.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                      hintText: "Confirm Password"),   
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: signUp,
                  color: Colors.green,
                  height: 70,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      },
                      child: const Text(
                        "Log in ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                )
              ])),
    );
  }
}
