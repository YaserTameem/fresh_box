import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'notifications.title'.tr, centerTitle: false, showLeading: false),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.w(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("notifications.today_offers".tr, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: AppSizes.h(20)),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: AppSizes.h(112),
                    padding: EdgeInsets.only(
                      left: AppSizes.w(20),
                      right: AppSizes.w(8),
                      top: AppSizes.h(20),
                      bottom: AppSizes.h(20),
                    ),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                      borderRadius: BorderRadius.circular(AppSizes.r(12)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Get.isDarkMode ? DarkColors.cardShadowColor : LightColors.cardShadowColor,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/star_bucks.png'),
                        SizedBox(width: AppSizes.w(20)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Starbucks", style: Theme.of(context).textTheme.labelMedium),
                              SizedBox(height: AppSizes.h(4)),
                              Text(
                                "Buy 1 get 1 free for small sizes until Nov 30, 2020",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: AppSizes.h(15)),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
