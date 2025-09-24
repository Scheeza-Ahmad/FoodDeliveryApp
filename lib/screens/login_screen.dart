import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:food/controller/tick_controller.dart';
import 'package:food/screens/forgetpassword_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/signin_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/icon_button.dart';
import 'package:food/widgets/input_password.dart';
import 'package:food/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final EyeController controller = EyeController();
    final TickController tickController = TickController();

    Future<void> loginUser(String email, String password) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        int index = emails.indexOf(email);
        if (passwords[index] == password) {
          // ✅ Save login status
          await pref.setBool("isLoggedIn", true);
          Fluttertoast.showToast(
            msg: 'Login successful!',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colorutil.color,

            textColor: Colors.white,
            fontSize: 16.0,
          );
          Get.offAll(() => Homescreen());
        } else {
          Fluttertoast.showToast(
            msg: 'Wrong password!',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colorutil.color,

            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: 'No account found. Please signup first.',
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colorutil.color,

          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.to(() => const Signin());
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(color: const Color(0xFF121223)),

            // 🔹 Heading
            Positioned(
              bottom: 470,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: Stringutil.headingsize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please Sign In to your existing Account',
                    style: TextStyle(
                      fontSize: Stringutil.mainsize,
                      color: const Color(0xFFC2C2C7),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Form Area
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
                        // Email field
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
                          cont: emailController,
                          type: TextInputType.emailAddress,
                          hint: 'example@gmail.com',
                          option: false,
                        ),
                        const SizedBox(height: 27),

                        // Password field
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
                          cont: passwordController,
                          type: TextInputType.text,
                          hint: 'Password',
                          controller: controller,
                        ),
                        const SizedBox(height: 12),

                        // Remember Me + Forget Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => IconButton(
                                    onPressed: () {
                                      tickController.toogle();
                                    },
                                    icon: Icon(
                                      tickController.tick.value
                                          ? Icons.check_box
                                          : Icons
                                                .check_box_outline_blank_outlined,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w400,
                                    fontSize: Stringutil.mainsize,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => Forgetpassword());
                              },
                              child: const Text(
                                'Forget Password',
                                style: TextStyle(
                                  color: Color(0xFFFF7622),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 17),

                        // Login Button
                        Button(
                          color: const Color(0xFFFF7622),
                          text: 'LOGIN',
                          action: () {
                            var email = emailController.text.trim();
                            var password = passwordController.text.trim();
                            if (email.isNotEmpty && password.isNotEmpty) {
                              loginUser(email, password);
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Please enter all fields',
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colorutil.color,

                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 14),

                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 152, 152),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const Signin());
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Color(0xFFFF7622),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Divider OR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 60,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.2,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Social login buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Iconbutton(
                              color: const Color(0xff395998),
                              image: AssetUtil.facebook,
                              action: () {},
                            ),
                            Iconbutton(
                              color: const Color(0xff1CB7EB),
                              image: AssetUtil.twitter,
                              action: () {},
                            ),
                            Iconbutton(
                              color: Colors.black,
                              image: AssetUtil.apple,
                              action: () {},
                            ),
                          ],
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
