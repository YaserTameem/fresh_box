import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';

class PaymentFailedScreen extends StatelessWidget {

  const PaymentFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Successful', showActions: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SvgPicture.asset('assets/images/Unhappy.svg'),
            SizedBox(height: 20),
            Text(
              'Unfortunately!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 32),
            ),
            Text(
              textAlign: TextAlign.center,
              'You Payment failed,\nPlease try Again.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
                fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Try Again',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21.sp, fontFamily: "Montserrat"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
