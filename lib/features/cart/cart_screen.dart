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
        title: 'Cart',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardListView(),
              Text('Recepient Address', style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: AppSizes.ph20),
              Container(
                padding: EdgeInsets.only(left: AppSizes.pw16, top: AppSizes.ph14),
                height: AppSizes.h104,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:Get.isDarkMode?DarkColors.cardBackground: LightColors.cardBackground,
                  borderRadius: AppRadius.medium,
                ),
                child: Text(
                  maxLines: 3,
                  '9224 Jailyn Terrace, block 2, North\nMaryjaneton, Tanzania, 4387242',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: AppSizes.ph30),
              OrderReview(
                buttonText: 'Process to Payment',
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
