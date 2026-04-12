import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/cart/components/custom_list_tile.dart';
import 'package:fresh_box/features/payment/payment_screen.dart';
import 'package:get/get.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Review', style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: AppSizes.ph24),
        CustomListTile(title: 'Full Vegie Salad (1 items)', trailing: '\$10'),
        CustomListTile(title: 'Toasted Sandwich (1 items)', trailing: '\$10'),
        CustomListTile(title: 'Delivery Fee', trailing: '\$5'),
        CustomListTile(title: 'Discount', trailing: '\$-8'),
        SizedBox(height: AppSizes.ph16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
              ),
            ),
            Text(
              '\$15',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
            fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21.sp, fontFamily: "Montserrat"),
          ),
        ),
      ],
    );
  }
}
