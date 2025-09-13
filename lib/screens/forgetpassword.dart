import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:food/screens/Loginscreen.dart';
import 'package:food/utils/Stringutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/input_password.dart';
import 'package:food/widgets/inputfield.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();
    final EyeController controler = EyeController();
    Future<void> resetPassword(String email, String newPassword) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        int index = emails.indexOf(email);
        passwords[index] = newPassword;
        await pref.setStringList("passwords", passwords);

        Get.snackbar("Success", "Password updated successfully!");
        Get.off(() => const Loginscreen()); 
      } else {
        Get.snackbar("Error", "No account found with this name.");
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
                    'FORGET PASSWORD',
                    style: TextStyle(
                      fontSize: Stringutil.headingsize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please Sign In to Your Existing Account',
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

                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'New Password',
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
                          controller: controler,
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm Password',
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
                          controller: controler,
                        ),
                        SizedBox(height: 16),

                        Button(
                          color: Color(0xFFFF7622),
                          text: 'REGISTER AGAIN',
                          action: () {
                            String name = namecontroller.text.trim();
                            String newPass = passwordcontroller.text.trim();
                            String confirmPass = confirmpasswordcontroller.text
                                .trim();
                            if (name.isNotEmpty &&
                                newPass.isNotEmpty &&
                                confirmPass.isNotEmpty) {
                              resetPassword(name, newPass);
                            } else {
                              Get.snackbar("Error", "Please fill all fields");
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
