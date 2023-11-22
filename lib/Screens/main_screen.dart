import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_hub/Screens/home_screen.dart';
import 'package:food_hub/models/user/user_model.dart';
import 'package:food_hub/router/app_router.gr.dart';

import '../configs/constant_varible.dart';
import '../configs/style.dart';
import '../controller/api_controller.dart';
import '../controller/login_controller.dart';
import '../controller/switch_method_controller.dart';
import '../custom_icons_icons.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  static const String id = "main screen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  // int _selectedIndex = 0;
  // final List<Widget> _widgetOptions = <Widget>[
  //   const HomeScreen(),
  //   Container(),
  //   Container(
  //     color: Colors.red,
  //     child: Center(
  //         child: Text(
  //       "Cart",
  //       style: TextStyle(color: Colors.black),
  //     )),
  //   ),
  //   Container(),
  //   Container(),
  // ];

  final List<IconData> _icons = [
    CustomIcons.discover_1,
    CustomIcons.delivery_1,
    CustomIcons.shop_1,
    CustomIcons.favor_1,
    CustomIcons.bell_1,
  ];

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool isActive = ref.watch(getswitchProvider);
    bool isLogin = ref.watch(isLoginProvider);
    UserModel? userModel = ref.watch(userController);
    return Builder(
      builder: (context) {
        if (isActive) {
          if (isLogin) {
            return ZoomDrawer(
                controller: zoomDrawerController,
                style: DrawerStyle.defaultStyle,
                boxShadow: const [
                  BoxShadow(
                      color: kWhiteShadowColor, blurRadius: 8, spreadRadius: 5)
                ],
                mainScreenTapClose: true,
                menuScreenTapClose: true,
                moveMenuScreen: false,
                androidCloseOnBackTap: true,
                menuBackgroundColor: kWhiteColor,
                openCurve: Curves.easeIn,
                closeCurve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
                slideWidth: MediaQuery.of(context).size.width * 0.75,
                angle: 0,
                menuScreen: menuScreen(userModel),
                mainScreen: apiBody(userModel));
          }
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else {
          if (user == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
          return Container();
        }
      },
    );
  }

  Scaffold menuScreen(UserModel? userModel) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //avatar
            Container(
              width: 140,
              height: 140,
              margin: const EdgeInsets.only(top: 15, left: 5),
              padding: const EdgeInsets.all(21),
              child: Container(
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(avatarAssetsPath), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: RichText(
                text: TextSpan(
                  text: "${userModel?.userName}\n",
                  style: k20w600blackColorStyle,
                  children: [
                    TextSpan(
                        text: userModel?.email, style: k14w400FF9EA1B1Color),
                  ],
                ),
              ),
            ),
            Column(
              children: drawerItems
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 22, bottom: 20),
                        child: Row(
                          children: [
                            Icon(
                              e["icon"],
                              color: kGreyColor,
                              size: 23.sp,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Text(
                              e["title"],
                              style: k16w400blackColor,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: CustomButton(
                  onTap: () async {
                    await ref.read(apiControlProvider.notifier).logOut();
                  },
                  color: kPrimaryColor,
                  padding: const EdgeInsets.only(
                      left: 9, bottom: 9, top: 9, right: 14),
                  radius: 28,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/logout.png",
                        width: 25.w,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        "Log Out",
                        style: k16w400whiteColor,
                      )
                    ],
                  )),
            ),
          ],
        ));
  }

  Widget apiBody(UserModel? user) {
    return AutoTabsRouter.tabBar(
      routes: const [
        HomeRoute(),
        DeliveryRoute(),
        CartRoute(),
        FavoriteRoute(),
        NotificationRoute(),
      ],
      builder: (context, child, tabController) {
        final tabsRouter = AutoTabsRouter.of(context);  
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kWhiteColor,
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 26, top: 26, right: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      zoomDrawerController.toggle!();
                    },
                    shadowColor: kGreyShadowColor,
                    color: kWhiteColor,
                    elevation: 1,
                    padding: const EdgeInsets.all(7),
                    radius: 15,
                    child: const Icon(
                      CustomIcons.menu,
                      color: kBlackColor,
                      size: 15,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Deliver to",
                        style: TextStyle(
                            color: kGreyTextColor,
                            fontFamily: fontFamily,
                            fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "4102 Pretty View Lane",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: kPrimaryColor,
                            fontFamily: fontFamily),
                      )
                    ],
                  ),
                  //avatar
                  Container(
                    width: 59,
                    height: 59,
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(avatarAssetsPath),
                            fit: BoxFit.cover),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: child,
          backgroundColor: kWhiteColor,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: kbottomBarColor, blurRadius: 2)]),
            child: BottomNavigationBar(
              backgroundColor: kWhiteColor,
              elevation: 2,
              type: BottomNavigationBarType.fixed,
              items: List<BottomNavigationBarItem>.generate(
                  _icons.length,
                  (index) => BottomNavigationBarItem(
                      icon: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Padding(
                          padding: index == 2
                              ? const EdgeInsets.only(bottom: 6)
                              : EdgeInsets.zero,
                          child: Icon(
                            _icons[index],
                            size: index == 2 ? 26.sp : 28.sp,
                          ),
                        ),
                      ),
                      label: "")),
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: kUnselectedIcon,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: tabsRouter.setActiveIndex,
            ),
          ),
        );
      },
    );
  }

  // Scaffold body(User user) {
  //   return Scaffold(
  //     backgroundColor: kWhiteColor,
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       backgroundColor: kWhiteColor,
  //       elevation: 0,
  //       flexibleSpace: Padding(
  //         padding: const EdgeInsets.only(left: 26, top: 26, right: 15),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const CustomButton(
  //               shadowColor: kGreyShadowColor,
  //               color: kWhiteColor,
  //               elevation: 1,
  //               padding: EdgeInsets.all(7),
  //               radius: 15,
  //               child: Icon(
  //                 CustomIcons.menu,
  //                 color: kBlackColor,
  //                 size: 15,
  //               ),
  //             ),
  //             Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   "Deliver to",
  //                   style: TextStyle(
  //                       color: kGreyTextColor,
  //                       fontFamily: fontFamily,
  //                       fontSize: 14.sp),
  //                 ),
  //                 SizedBox(
  //                   height: 4.h,
  //                 ),
  //                 Text(
  //                   "4102 Pretty View Lane",
  //                   style: TextStyle(
  //                       fontSize: 15.sp,
  //                       color: kPrimaryColor,
  //                       fontFamily: fontFamily),
  //                 )
  //               ],
  //             ),
  //             //avatar
  //             Container(
  //               width: 59,
  //               height: 59,
  //               padding: const EdgeInsets.all(5),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: kPrimaryColor,
  //                   borderRadius: BorderRadius.circular(15),
  //                   image: user.photoURL != null
  //                       ? DecorationImage(
  //                           image: NetworkImage(user.photoURL!),
  //                           fit: BoxFit.cover)
  //                       : const DecorationImage(
  //                           image: AssetImage(avatarAssetsPath),
  //                           fit: BoxFit.cover),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //     body: Center(
  //       child: _widgetOptions.elementAt(_selectedIndex),
  //     ),
  //     bottomNavigationBar: Container(
  //       decoration: const BoxDecoration(
  //           boxShadow: [BoxShadow(color: kbottomBarColor, blurRadius: 2)]),
  //       child: BottomNavigationBar(
  //         backgroundColor: kWhiteColor,
  //         elevation: 2,
  //         type: BottomNavigationBarType.fixed,
  //         items: List<BottomNavigationBarItem>.generate(
  //             _icons.length,
  //             (index) => BottomNavigationBarItem(
  //                 icon: Container(
  //                   margin: const EdgeInsets.symmetric(vertical: 12),
  //                   child: Padding(
  //                     padding: index == 2
  //                         ? const EdgeInsets.only(bottom: 5)
  //                         : EdgeInsets.zero,
  //                     child: Icon(
  //                       _icons[index],
  //                       size: index == 2 ? 25.sp : 28.sp,
  //                     ),
  //                   ),
  //                 ),
  //                 label: "")),
  //         currentIndex: _selectedIndex,
  //         selectedItemColor: kPrimaryColor,
  //         unselectedItemColor: kUnselectedIcon,
  //         showSelectedLabels: false,
  //         showUnselectedLabels: false,
  //         onTap: _onItemTapped,
  //       ),
  //     ),
  //   );
  // }
}
