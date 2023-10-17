import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes_name.dart';
import '../widget/widget.dart';

// In this we use sharedPreferences to save the user as data locally so user don't need to sign in again and again
class UserPreferences {
  static bool? loggedIn;
  static String? uid;

  // Function of logout the user from the devices
  void logOutsetData(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: Loading());
      },
    );
    final SharedPreferences userData = await SharedPreferences.getInstance();
    userData.setString("email", "");
    userData.setBool("uid", false);
    // ignore: use_build_context_synchronously
    context.go(RoutesName.loginScreen);
  }

  // to get the user data which is stores locally
  void getUserInfo() async {
    final SharedPreferences userData = await SharedPreferences.getInstance();
    loggedIn = userData.getBool("loggedIn");
    uid = userData.getString("uid");
    log(uid.toString());
  }

  // to store the user data locally
  Future saveLoginUserInfo(bool userLoggedIn, String uid) async {
    SharedPreferences userCredentials = await SharedPreferences.getInstance();
    userCredentials.setBool("loggedIn", userLoggedIn);
    userCredentials.setString("uid", uid);
  }
}
