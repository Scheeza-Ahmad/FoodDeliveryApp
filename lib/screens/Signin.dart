import 'package:flutter/material.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/utils/Stringutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/inputfield.dart';
import 'package:get/get.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();
    final emailcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(color: const Color(0xFF121223)),

          Positioned(
            bottom: 550,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: Stringutil.headingsize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please Sign Up to get Started',
                  style: TextStyle(
                    fontSize: Stringutil.mainsize,
                    color: const Color(0xFFC2C2C7),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: Stringutil.mainsize,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Inputfield(
                        cont: namecontroller,
                        type: TextInputType.text,
                        hint: 'John Doe',
                        option: false,
                      ),
                      SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: Stringutil.mainsize,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Inputfield(
                        cont: emailcontroller,
                        type: TextInputType.emailAddress,
                        hint: 'example@gmail.com',
                        option: false,
                      ),

                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: Stringutil.mainsize,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Inputfield(
                        cont: passwordcontroller,
                        type: TextInputType.visiblePassword,
                        hint: 'Enter password',
                        option: true,
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Re-type Password',
                          style: TextStyle(
                            fontSize: Stringutil.mainsize,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Inputfield(
                        cont: confirmpasswordcontroller,
                        type: TextInputType.visiblePassword,
                        hint: 'Enter password',
                        option: true,
                      ),
                      SizedBox(height: 16),

                      Button(
                        color: Color(0xFFFF7622),
                        text: 'Sign Up',
                        action: () {
                          Get.snackbar(
                            "Successful Sign Up",
                            "Welcome to our Team",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: const Color.fromARGB(
                              255,
                              139,
                              139,
                              139,
                            ),
                            colorText: Colors.white,
                          );
                          Get.to(()=>Homescreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
