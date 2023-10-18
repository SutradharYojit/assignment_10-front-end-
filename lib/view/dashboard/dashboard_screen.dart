import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/resources.dart';
import '../view.dart';

ValueNotifier<int> pageIndex = ValueNotifier(0);

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final List _pages = [
    HomeScreen(),
    CartScreen(),
    WishListScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, value, child) {
            return _pages[value];
          },
        ),
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            color: ColorManager.rgbWhiteColor,
            boxShadow: [
              BoxShadow(
                color: ColorManager.greyOpacityColor,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.w),
              topRight: Radius.circular(25.w),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomTabButton(
                inDex: 0,
                onSelectImageAsset: IconAssets.homeIcon,
              ),
              BottomTabButton(
                inDex: 1,
                onSelectImageAsset: IconAssets.wishlistIcon,
              ),
              BottomTabButton(
                inDex: 2,
                onSelectImageAsset: IconAssets.heartIcon,
              ),
              BottomTabButton(
                inDex: 3,
                onSelectImageAsset: IconAssets.userIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTabButton extends StatelessWidget {
  BottomTabButton({
    super.key,
    required this.inDex,
    required this.onSelectImageAsset,
  });

  final int inDex;
  final String onSelectImageAsset;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        enableFeedback: false,
        onPressed: () {
          pageIndex.value = inDex;
        },
        icon: SizedBox(
          height: 30,
          child: Image.asset(
            onSelectImageAsset,
          ),
        ));
  }
}
