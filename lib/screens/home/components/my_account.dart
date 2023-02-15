import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
        ),
        body: Container(
            margin: EdgeInsets.all(15),
            width: double.maxFinite,
            child: UserDetails()));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final padding = EdgeInsets.all(50);

    return Builder(builder: (context) {
      return GestureDetector(
        child: UserDetails(),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      );
    });
  }
}

class UserDetails extends StatelessWidget {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                width: 170,
                height: 170,
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
              // Positioned(
              //     bottom: 0,
              //     right: 0,
              //     child: Container(
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(width: 4, color: white),
              //           color: darkBlue),
              //       child: Icon(
              //         Icons.edit_rounded,
              //         color: white,
              //       ),
              //     ))
            ],
          ),
        ),
        SizedBox(height: 30),
        buildTextField("Full Name", "", false),
        buildTextField("Email", "", false),
        // buildTextField("Password", "********", true),
        buildTextField("Adress", "", false),
        buildTextField("Phone", "", false),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Update',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.green,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Fluttertoast.showToast(
            //         msg: "Profile Updated ",
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.BOTTOM,
            //         timeInSecForIosWeb: 2,
            //         backgroundColor: darkBlue,
            //         textColor: white,
            //         fontSize: 15);
            //   },
            //   // ignore: prefer_const_constructors
            //   child: TextButton(
            //     child: Text(
            //       "Save",
            //       style: TextStyle(
            //         fontSize: 15,
            //         letterSpacing: 2,
            //         color: white,
            //       ),
            //     ),
            //     onPressed: () {
            //       editProfile();
            //     },
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     primary: Color.fromARGB(255, 13, 11, 43),
            //     padding: EdgeInsets.symmetric(horizontal: 50),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20)),
            //   ),
            // ),
          ],
        )
      ],
    );
  }

  Widget buildTextField(
      String labelText, String placeHolder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
          obscureText: isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
              suffix: isPasswordTextField
                  ? IconButton(
                      onPressed: () {
                        // setState(() {
                        isObscurePassword = !isObscurePassword;
                      },
                      icon: const Icon(Icons.remove_red_eye_rounded,
                          color: Colors.grey),
                    )
                  : null,
              contentPadding: const EdgeInsets.only(bottom: 5),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeHolder,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))),
    );
  }
}
