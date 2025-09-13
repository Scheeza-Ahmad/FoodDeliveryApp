import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/screens/Loginscreen.dart';
import 'package:food/utils/Stringutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/input_password.dart';
import 'package:food/widgets/inputfield.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final EyeController controller = EyeController();
    Future<void> signupUser(String name, String password) async {
      final pref = await SharedPreferences.getInstance();
      List<String> names = pref.getStringList("names") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (names.contains(name)) {
        // agar user already hai → Login pe bhej do
        Get.snackbar('Error', 'You are already a user. Please Login');
        Get.to(() => const Loginscreen());
      } else {
        // new user save karna
        names.add(name);
        passwords.add(password);
        await pref.setStringList("names", names);
        await pref.setStringList("passwords", passwords);

        Get.snackbar('Success', 'Signup successful. Welcome!');
        Get.to(() => const Homescreen());
      }
    }

    return SafeArea(
      child: Scaffold(
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
                        InputPassword(
                          cont: passwordcontroller,
                          type: TextInputType.text,
                          hint: 'Password',
                          controller: controller,
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
                        InputPassword(
                          cont: confirmpasswordcontroller,
                          type: TextInputType.text,
                          hint: 'Confirm Password',
                          controller: controller,
                        ),
                        SizedBox(height: 16),

                        Button(
                          color: Color(0xFFFF7622),
                          text: 'Sign Up',
                          action: () {
                            var name = namecontroller.text.trim();
                            var password = passwordcontroller.text.trim();
                            if (name.isNotEmpty && password.isNotEmpty) {
                              signupUser(name, password);
                            } else {
                              Get.snackbar("Error", "Please enter all fields");
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
    );
  }
}
