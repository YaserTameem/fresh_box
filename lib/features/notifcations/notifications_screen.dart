import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: CustomAppBar(title: 'Notification', centerTitle: false, showLeading: false),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today (2 Offers)", style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 112.h,
                    padding: EdgeInsets.only(left: 20.w, right: 8.h, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                      borderRadius: BorderRadius.circular(12.r),
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
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Starbucks", style: Theme.of(context).textTheme.labelMedium),
                              SizedBox(height: 4.h),
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
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
