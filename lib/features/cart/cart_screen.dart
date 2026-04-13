import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/core/widget/custom_order_review.dart';
import 'package:fresh_box/features/cart/components/cart_list_view.dart';
import 'package:fresh_box/features/cart/components/custom_list_tile.dart';
import 'package:fresh_box/features/home/popular_screen.dart';
import 'package:fresh_box/features/home/product_details_screen.dart';
import 'package:fresh_box/features/payment/payment_screen.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'cart.title'.tr,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24), vertical: AppSizes.h(32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardListView(),
              Text('cart.recipient_address'.tr, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: AppSizes.h(20)),
              Container(
                padding: EdgeInsets.only(left: AppSizes.w(16), top: AppSizes.h(14)),
                height: AppSizes.h(104),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground,
                  borderRadius: AppRadius.medium,
                ),
                child: Text(
                  maxLines: 3,
                  '9224 Jailyn Terrace, block 2, North\nMaryjaneton, Tanzania, 4387242',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: AppSizes.h(30)),
              OrderReview(
                buttonText: 'cart.checkout'.tr,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.payment);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

