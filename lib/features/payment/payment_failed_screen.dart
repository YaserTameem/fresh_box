import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:get/get.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'payment.success.title'.tr, showActions: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w(38), vertical: AppSizes.h(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.h(100)),
            SvgPicture.asset('assets/images/Unhappy.svg'),
            SizedBox(height: AppSizes.h(20)),
            Text(
              'payment.failed.headline'.tr,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: AppSizes.sp(32)),
            ),
            Text(
              textAlign: TextAlign.center,
              'payment.failed.message'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
                fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h(50)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'payment.failed.cta'.tr,
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

