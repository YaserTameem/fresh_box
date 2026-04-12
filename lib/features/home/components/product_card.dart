import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_discount_badge.dart';
import 'package:fresh_box/features/home/models/products_model.dart';
import 'package:fresh_box/features/home/product_details_screen.dart';
import 'package:get/get.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.index});

  final int index;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final model = ProductsModel.products[widget.index];
    return GestureDetector(
      onTap: () {
        Get.to(() => AppRoutes.productDetails);
      },
      child: Container(
        height: AppSizes.h270,
        width: AppSizes.w154,
        padding: EdgeInsets.all(AppSizes.pw12),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          borderRadius: AppRadius.medium,
          boxShadow: AppShadows.mainSoftShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    ClipRRect(borderRadius: AppRadius.medium, child: Image.asset(model.imageUrl)),
                    model.discount == null
                        ? SizedBox.shrink()
                        : CustomDiscountBadge(discount: model.discount),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.ph12),
            Text(model.name, style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: AppSizes.ph8),
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.watch_later,
                  color: Get.isDarkMode ? DarkColors.textSupColor : LightColors.textSupColor,
                  size: AppSizes.r20,
                ),
                Text(
                  '${model.time}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Get.isDarkMode ? DarkColors.textSupColor : LightColors.textSupColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.ph4),
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.star,
                  color: Get.isDarkMode ? DarkColors.accentGreenColor : LightColors.accentGreenColor,
                  size: AppSizes.r20,
                ),
                Expanded(
                  child: Text(
                    '${model.rating}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Get.isDarkMode ? DarkColors.accentGreenColor : LightColors.accentGreenColor,
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      model.isFavorite = !model.isFavorite;
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/favourite_off.svg',
                    colorFilter: ColorFilter.mode(
                      model.isFavorite
                          ? Get.isDarkMode
                              ? DarkColors.primaryColor
                              : LightColors.primaryColor
                          : Get.isDarkMode
                          ? DarkColors.cardBackground
                          : LightColors.cardBackground,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
