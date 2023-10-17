import 'dart:developer';
import 'package:assignement_10/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/user_profile_model.dart';
import '../../resources/resources.dart';
import '../../services/api_constants.dart';
import '../../widget/widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _userNameCtrl = TextEditingController();
  final TextEditingController _userEmailCtrl = TextEditingController();
  final List<UserData> userData = [];

  void getUserData() async {
    await ApiServices().postApi(
        api: "${APIConstants.baseUrl}user/getUser", data: {"userId": "GNb8iRPh57efgVqOOrYVRcOsb6R2"}).then((value) {
      userData.clear();
      userData.add(UserData.fromJson(value["data"]));
      _userEmailCtrl.text = userData.first.email!;
      _userNameCtrl.text = userData.first.username!;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(); // To unfocus on the text filled
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Profile"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.r),
                  child: PrimaryTextFilled(
                    controller: _userNameCtrl,
                    hintText: "User Name",
                    labelText: "User Name",
                    prefixIcon: const Icon(
                      Icons.text_format,
                      color: ColorManager.greyColor,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.r),
                  child: PrimaryTextFilled(
                    controller: _userEmailCtrl,
                    hintText: "Enter Email",
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: ColorManager.greyColor,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer(
            builder: (context, ref, child) {
              return PrimaryButton(
                onTap: () async {
                  log(UserPreferences.uid.toString());
                  await ApiServices().postApi(
                    api: "${APIConstants.baseUrl}user/updateUser",
                    data: {
                      "email": _userEmailCtrl.text.trim(),
                      "id": userData.first.docId,
                      "username":_userNameCtrl.text.trim()
                    },
                  ).then((value) {
                    if(value["success"]){
                      final bar = WarningBar();

                      final notExist = bar.snack("User profile Updated", ColorManager.greenColor);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(notExist);

                    }
                  });
                },
                title: "Update Profile",
                color: ColorManager.blackColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
