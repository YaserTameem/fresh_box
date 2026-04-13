import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/enum/payment_method.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/core/widget/custom_order_review.dart';
import 'package:fresh_box/features/payment/payment_failed_screen.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod selectedMethod = PaymentMethod.mastercard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'payment.method_title'.tr, showActions: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24), vertical: AppSizes.h(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentItem(
              cardType: 'payment.method.mastercard'.tr,
              method: PaymentMethod.mastercard,
              paymentMethodImage: 'assets/images/mastercard.svg',
            ),
            SizedBox(height: AppSizes.h(20)),
            paymentItem(
              cardType: 'payment.method.visa'.tr,
              method: PaymentMethod.visa,
              paymentMethodImage: 'assets/images/visa.svg',
            ),
            SizedBox(height: AppSizes.h(20)),

            paymentItem(
              cardType: 'payment.method.paypal'.tr,
              method: PaymentMethod.paypal,
              paymentMethodImage: 'assets/images/paypal.svg',
            ),
            SizedBox(height: AppSizes.h(40)),
            OrderReview(
              buttonText: 'payment.pay_now'.tr,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.paymentFailed);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentItem({
    required String cardType,
    required PaymentMethod method,
    required String paymentMethodImage,
  }) {
    final bool isSelected = selectedMethod == method;
    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.all(AppSizes.w(25)),
        height: AppSizes.h(74),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          borderRadius: BorderRadius.circular(AppSizes.r(10)),
          boxShadow: [
            BoxShadow(
              color: Get.isDarkMode ? DarkColors.softGreyShadowColor : LightColors.softGreyShadowColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(paymentMethodImage),
            SizedBox(width: AppSizes.w(20)),
            Text(cardType, style: Theme.of(context).textTheme.headlineMedium),
            Spacer(),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color:
                  isSelected
                      ? Get.isDarkMode
                          ? DarkColors.actionMutedColor
                          : LightColors.actionMutedColor
                      : Get.isDarkMode
                      ? DarkColors.actionDisabledColor
                      : LightColors.actionDisabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
