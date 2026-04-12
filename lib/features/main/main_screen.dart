import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/cart/cart_screen.dart';
import 'package:fresh_box/features/home/favorites_screen.dart';
import 'package:fresh_box/features/home/home_screen.dart';
import 'package:fresh_box/features/home/orders_screen.dart';
import 'package:fresh_box/features/notifcations/notifications_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    OrdersScreen(),
    CartScreen(),
    FavoritesScreen(),
    NotificationsScreen(),
  ];

  void inTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onFabPressed() {
    setState(() {
      currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        onPressed: () {
          onFabPressed();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.shopping_bag_rounded,
            color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: AppSizes.h65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 2.h,
                    width: AppSizes.w56,
                    color:
                        currentIndex == 0
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Colors.transparent,
                  ),

                  SizedBox(height: AppSizes.ph22),
                  IconButton(
                    onPressed: () {
                      inTabTapped(0);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/home_off.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 0
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Get.isDarkMode
                            ? DarkColors.cardBackground
                            : LightColors.cardBackground,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 2.h,
                    width: AppSizes.w56,
                    color:
                        currentIndex == 1
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Colors.transparent,
                  ),
                  SizedBox(height: AppSizes.ph22),

                  IconButton(
                    onPressed: () {
                      inTabTapped(1);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/Order_off.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 1
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Get.isDarkMode
                            ? DarkColors.cardBackground
                            : LightColors.cardBackground,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 2.h,
                    width: AppSizes.w56,
                    color:
                        currentIndex == 3
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Colors.transparent,
                  ),
                  SizedBox(height: AppSizes.ph22),

                  IconButton(
                    onPressed: () {
                      inTabTapped(3);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/favourite_off.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 3
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Get.isDarkMode
                            ? DarkColors.cardBackground
                            : LightColors.cardBackground,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 2.h,
                    width: AppSizes.w56,
                    color:
                        currentIndex == 4
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Colors.transparent,
                  ),
                  SizedBox(height: AppSizes.ph22),
                  IconButton(
                    onPressed: () {
                      inTabTapped(4);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/Notification_off.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 4
                            ? Get.isDarkMode
                                ? DarkColors.textSecondaryColor
                                : LightColors.textSecondaryColor
                            : Get.isDarkMode
                            ? DarkColors.cardBackground
                            : LightColors.cardBackground,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
