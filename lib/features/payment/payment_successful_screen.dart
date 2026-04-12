import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/features/main/main_screen.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Successful', showActions: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SvgPicture.asset('assets/images/happy.svg'),
            SizedBox(height: 20),
            Text('Congratulations!', style: theme.headlineLarge?.copyWith(fontSize: 32)),
            Text(
              textAlign: TextAlign.center,
              'You successfully maked a payment,\nenjoy our service!',
              style: theme.headlineMedium,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
                fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              child: Text(
                'Browse More',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21.sp, fontFamily: "Montserrat"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
