
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwendels_sips_n_bites/screens/sign_up.dart';

import 'home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  void login() {
    // if (_formKey.currentState!.validate()) {
    //   FirebaseAuthMethods(FirebaseAuth.instance).signinWithEmail(
    //     email: emailTextEditingController.text.trim(),
    //     password: passwordTextEditingController.text.trim()
    //   );
    // }

    //Fluttertoast.showToast(msg: "you are logged in");
     Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
  }

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     // backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
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
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                     // color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // const Text(
                  //   "Log in with one of the following options",
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //    // color: Colors.white60,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //         padding: EdgeInsets.all(10),
                  //         height: 70,
                  //         width: 150,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(
                  //             15,
                  //           ),
                  //           border: Border.all(width: 2,),
                  //         ),
                  //         child: Center(
                  //           child: IconButton(
                  //               onPressed: () {},
                  //               icon: Image.asset(
                  //                 'assets/images/gmail.png',
                  //               )),
                  //         )),
                  //     Container(
                  //         padding: EdgeInsets.all(10),
                  //         height: 70,
                  //         width: 150,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(
                  //             15,
                  //           ),
                  //           border: Border.all(width: 2,),
                  //         ),
                  //         child: Center(
                  //           child: IconButton(
                  //               onPressed: () {},
                  //               icon: Image.asset(
                  //                 'assets/images/facebook.png',
                  //               )),
                  //         )),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Text(
                  //   "Email",
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:const BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                               const BorderSide(color: Colors.black, width: 3.0),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.black45.withOpacity(.8)),
                          hintText: "Email")),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Text(
                  //   "Password",
                  //   style: TextStyle(fontSize: 20,),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  TextFormField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                               const BorderSide(color: Colors.black, width: 3.0),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.black45.withOpacity(.8)),
                          hintText: "Password")),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: login,
                    color: Colors.green,
                    height: 70,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child:const Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account? ",
                        style: TextStyle(fontSize: 17, ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        child: const Text(
                          "Sign up ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                             ),
                        ),
                      )
                    ],
                  )
                ]),
          )),
    );
  }
}
