import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:food/controller/tick_controller.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/screens/Signin.dart';
import 'package:food/screens/forgetpassword.dart';
import 'package:food/utils/Stringutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/iconbutton.dart';
import 'package:food/widgets/input_password.dart';
import 'package:food/widgets/inputfield.dart';
import 'package:get/get.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final EyeController controller = EyeController();
    final TickController control = TickController();
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
                    'Log In',
                    style: TextStyle(
                      fontSize: Stringutil.headingsize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please Sign In to your exsisting Account',
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
                            'Email',
                            style: TextStyle(
                              fontSize: Stringutil.mainsize,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
      
                        Inputfield(
                          cont: namecontroller,
                          type: TextInputType.emailAddress,
                          hint: 'example@gmail.com',
                          option: false,
                        ),
      
                        const SizedBox(height: 27),
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
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => IconButton(
                                    onPressed: () {
                                      control.toogle();
                                    },
                                    icon: Icon(
                                      control.tick.value
                                          ? Icons.check_box_outline_blank_outlined
                                          : Icons.check_box,
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
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                  color: Color(0xFFFF7622),
                                  fontWeight: FontWeight.w400,
                                  fontSize: Stringutil.mainsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 17),
                        Button(
                          color: Color(0xFFFF7622),
                          text: 'LOGIN',
                          action: () {
                            Get.snackbar(
                              "Successful Login",
                              "Welcome Back!Glad to see you Again",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: const Color.fromARGB(
                                255,
                                139,
                                139,
                                139,
                              ),
                              colorText: Colors.white,
                            );
                            Get.to(() => Homescreen());
                          },
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 153, 152, 152),
                                fontSize: Stringutil.mainsize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => Signin());
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Color(0xFFFF7622),
                                  fontSize: Stringutil.mainsize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
      
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
      
                              child: Divider(color: Colors.grey, thickness: 1.2),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Divider(color: Colors.grey, thickness: 1.2),
                            ),
                          ],
                        ),
      
                        SizedBox(height: 16),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Iconbutton(
                                color: Color(0xff395998),
                                image: 'assets/images/facebook.png',
                                action: () {
                                  Get.to('');
                                },
                              ),
                              Iconbutton(
                                color: Color(0xff1CB7EB),
                                image: 'assets/images/twitter.png',
      
                                action: () {
                                  Get.to('');
                                },
                              ),
                              Iconbutton(
                                color: Colors.black,
                                image: 'assets/images/apple.png',
      
                                action: () {
                                  Get.to('');
                                },
                              ),
                            ],
                          ),
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
