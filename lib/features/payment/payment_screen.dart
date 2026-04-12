import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: CustomAppBar(title: 'Payment Method', showActions: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentItem(
              cardType: 'Mastercard',
              method: PaymentMethod.mastercard,
              paymentMethodImage: 'assets/images/mastercard.svg',
            ),
            SizedBox(height: 20),
            paymentItem(
              cardType: 'Visa Card',
              method: PaymentMethod.visa,
              paymentMethodImage: 'assets/images/visa.svg',
            ),
            SizedBox(height: 20),

            paymentItem(
              cardType: 'PayPal',
              method: PaymentMethod.paypal,
              paymentMethodImage: 'assets/images/paypal.svg',
            ),
            SizedBox(height: 40),
            OrderReview(
              buttonText: '\$17 Pay Now',
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
        padding: EdgeInsets.all(25),
        height: 74,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          borderRadius: BorderRadius.circular(10),
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
            SizedBox(width: 20),
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
