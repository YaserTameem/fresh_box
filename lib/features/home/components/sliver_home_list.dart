import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/features/home/models/recommended_model.dart';

class SliverHomeList extends StatelessWidget {
  const SliverHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph32),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          final model = RecommendedModel.recommendedList[index];
          return Container(
            height: AppSizes.h150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: RecommendedModel.cardColors[index % RecommendedModel.cardColors.length],
              borderRadius: AppRadius.large,
            ),
            child: Row(
              children: [
                Expanded(child: Image.asset(model.image, height: AppSizes.h104, width: AppSizes.w104)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(model.name, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(height: AppSizes.ph4),
                      Text(model.disc, maxLines: 2, style: AppTextStyle.discStyle),
                      SizedBox(height: AppSizes.ph12),
                      Text('\$${model.price}', style: Theme.of(context).textTheme.headlineLarge),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.ph30);
        },
        itemCount: RecommendedModel.recommendedList.length,
      ),
    );
  }
}
