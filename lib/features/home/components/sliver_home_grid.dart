import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_discount_badge.dart';
import 'package:fresh_box/features/home/models/products_model.dart';

class SliverHomeGrid extends StatefulWidget {
  const SliverHomeGrid({super.key});

  @override
  State<SliverHomeGrid> createState() => _SliverHomeGridState();
}

class _SliverHomeGridState extends State<SliverHomeGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph24),
      sliver: SliverGrid.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: AppSizes.w154 / AppSizes.h270,
          crossAxisSpacing: AppSizes.w10,
          mainAxisSpacing: AppSizes.h10,
        ),
        itemBuilder: (BuildContext context, int index) {
          final model = ProductsModel.products[index];
          return Container(
            padding: EdgeInsets.all(AppSizes.pw12),
            decoration: BoxDecoration(
              color: LightColors.surfaceColor,
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
                    Icon(Icons.watch_later, color: LightColors.textSupColor, size: AppSizes.r20),
                    Text('${model.time}', style: AppTextStyle.discountTimeStyle),
                  ],
                ),
                SizedBox(height: AppSizes.ph4),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.star, color: Color(0xFF5BC439), size: AppSizes.r20),
                    Expanded(child: Text('${model.rating}', style: AppTextStyle.ratingStyle)),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          model.isFavorite = !model.isFavorite;
                        });
                      },
                      icon: Icon(
                        model.isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: model.isFavorite ? Colors.red : LightColors.textSupColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
