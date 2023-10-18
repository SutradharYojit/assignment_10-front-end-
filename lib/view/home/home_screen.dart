import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/resources.dart';
import '../../services/services.dart';
import '../../widget/widget.dart';
import 'components/all_product.dart';
import 'components/product_list_provider.dart';
import 'components/search_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(productList.notifier).fetchProductItem();
    UserPreferences().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unFocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15.0, left: 15.0).w,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: ColorManager.whiteColor,
                    expandedHeight: 85.h,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const RichTxt(
                                  text_1: "Welcome\n",
                                  text_2: "Our Fashions App",
                                  textSize_1: 30,
                                  textSize_2: 25,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // context.push(RoutesName.userProfileScreen);
                                  },
                                  icon: CrcleAvatar(
                                    color: ColorManager.rgbWhiteColor,
                                    radius: 35,
                                    child: Image.asset(IconAssets.userIcon),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    textCtrl: _searchCtrl,
                    onPressed: () {},
                    child: IconButton(
                      iconSize: 0,
                      onPressed: () {
                        unFocus();
                      },
                      icon: CrcleAvatar(
                        radius: 23,
                        color: ColorManager.blackColor,
                        child: Image.asset(
                          IconAssets.filterIcon,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Items",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: ColorManager.blackColor,
                        ),
                      ),
                    ],
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final load = ref.read(productList.notifier).loading;
                      return const Expanded(
                        child: AllProduct(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void unFocus() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
