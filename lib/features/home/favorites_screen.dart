import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/core/widget/custom_discount_badge.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'favorites.title'.tr, centerTitle: false, showLeading: false),
      body: ListView.separated(
        padding: EdgeInsets.all(AppSizes.w(24)),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(AppSizes.w(12)),
            height: AppSizes.h(114),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
              borderRadius: AppRadius.medium,
              boxShadow: AppShadows.mainSoftShadow,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: AppRadius.medium,
                        child: Image.asset('assets/images/252.png'),
                      ),
                      CustomDiscountBadge(discount: 50),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.w(14)),
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$10',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.sp(21),
                          color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Fresh Sandwitch',
                        maxLines: 1,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.accentGreenColor
                                        : LightColors.accentGreenColor,
                                size: AppSizes.r(20),
                              ),
                              SizedBox(width: AppSizes.w(12)),
                              Text(
                                '4.5',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color:
                                      Get.isDarkMode
                                          ? DarkColors.accentGreenColor
                                          : LightColors.accentGreenColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color:
                                    Get.isDarkMode ? DarkColors.textSupColor : LightColors.textSupColor,
                                size: AppSizes.r(20),
                              ),
                              Text(
                                '30',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color:
                                      Get.isDarkMode
                                          ? DarkColors.textSupColor
                                          : LightColors.textSupColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppSizes.h(30),
                  width: AppSizes.w(30),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
                    borderRadius: AppRadius.medium,
                  ),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: AppSizes.r(20),
                    color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.h(14));
        },
        itemCount: 2,
      ),
    );
  }
}

