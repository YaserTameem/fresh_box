import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/features/main/main_screen.dart';
import 'package:get/get.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(title: 'payment.success.title'.tr, showActions: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w(38), vertical: AppSizes.h(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.h(100)),
            SvgPicture.asset('assets/images/happy.svg'),
            SizedBox(height: AppSizes.h(20)),
            Text(
              'payment.success.congrats'.tr,
              style: theme.headlineLarge?.copyWith(fontSize: AppSizes.sp(32)),
            ),
            Text(textAlign: TextAlign.center, 'payment.success.message'.tr, style: theme.headlineMedium),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
                fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h(50)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              child: Text(
                'payment.success.cta'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppSizes.sp(21),
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

