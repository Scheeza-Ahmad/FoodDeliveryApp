import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/input_password.dart';
import 'package:food/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final EyeController controller = EyeController();

    Future<void> signupUser(String email, String password) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        Fluttertoast.showToast(
          msg: 'You are already a user. Please Login',
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colorutil.color,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.to(() => const Loginscreen());
      } else {
        emails.add(email);
        passwords.add(password);
        await pref.setStringList("emails", emails);
        await pref.setStringList("passwords", passwords);

        Fluttertoast.showToast(
          msg: 'Signup successful. Welcome!',
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colorutil.color,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.offAll(() => Loginscreen());
      }
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Container(color: const Color(0xFF121223)),

              Positioned(
                bottom: 470,
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
                  height: 450,
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
                          const SizedBox(height: 16),

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
                          InputPassword(
                            cont: passwordcontroller,
                            type: TextInputType.text,
                            hint: 'Password',
                            controller: controller,
                          ),
                          const SizedBox(height: 16),

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
                          InputPassword(
                            cont: confirmpasswordcontroller,
                            type: TextInputType.text,
                            hint: 'Confirm Password',
                            controller: controller,
                          ),
                          const SizedBox(height: 16),

                          Button(
                            color: const Color(0xFFFF7622),
                            text: 'Sign Up',
                            action: () {
                              var email = emailcontroller.text.trim();
                              var password = passwordcontroller.text.trim();
                              var confirmPassword = confirmpasswordcontroller
                                  .text
                                  .trim();
                              var name = namecontroller.text.trim();

                              if (name.isEmpty ||
                                  email.isEmpty ||
                                  password.isEmpty ||
                                  confirmPassword.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'Please enter all fields',
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colorutil.color,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else if (password != confirmPassword) {
                                Fluttertoast.showToast(
                                  msg: 'Passwords do not match',
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else {
                                signupUser(email, password);
                              }
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
        ),
      ),
    );
  }
}
