import 'package:flutter/material.dart';
import 'package:food/models/user_model.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/screens/signin_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/profile_photo.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  Future<void> _logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("isLoggedIn", false); // 👈 logout status reset
    Get.offAll(() => const Loginscreen()); // 👈 login page par bhej do
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ Profile Image Picker
            const ProfileImagePicker(),
            const SizedBox(height: 16),

            // ✅ Name
            Text(
              UserModel.user?.name ?? "Guest User",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 6),

            // ✅ Email
            Text(
              UserModel.user?.email ?? "No email available",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // ✅ Small Divider
            const Divider(
              thickness: 0.8,
              color: Colors.grey,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 8),

            // ✅ Extra option buttons (optional)
            Button(
              color: Colorutil.color,
              text: 'Logout',
              action: () {
                _logout();
              },
            ),
            SizedBox(height: 10),
            Button(
              color: Colorutil.color,
              text: 'Use Different Account',
              action: () {
                Get.offAll(() => Signin());
              },
            ),
          ],
        ),
      ),
    );
  }
}
