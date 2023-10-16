import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../../resources/resources.dart';
import '../../routes/routes_name.dart';
import '../../services/services.dart';

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    navigation();
  }

  void navigation() {
    Duration duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
          () {
        if (UserPreferences.loggedIn==true) {
          // its yes move to dashboard screen
          log(UserPreferences.email.toString());
          context.go(RoutesName.homeScreen);
        } else {
          // its no move to login screen
          context.go(RoutesName.loginScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
      body: Center(
        child: Lottie.asset(AnimationAssets.splashAnimation),
      ),
    );
  }
}
