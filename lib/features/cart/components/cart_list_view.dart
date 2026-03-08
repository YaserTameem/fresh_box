import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_discount_badge.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: AppSizes.ph30),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(AppSizes.pw12),
          height: AppSizes.h114,
          decoration: BoxDecoration(
            color: LightColors.surfaceColor,
            borderRadius: AppRadius.medium,
            boxShadow: AppShadows.mainSoftShadow,
          ),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: AppRadius.medium,
                      child: Image.asset('assets/images/252.png'),
                    ),
                    CustomDiscountBadge(discount: 50),
                  ],
                ),
              ),
              SizedBox(width: AppSizes.pw14),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$10',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.sp21,
                        color: LightColors.primaryColor,
                      ),
                    ),
                    Text('Fresh Sandwitch', maxLines: 1, style: Theme.of(context).textTheme.bodySmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFF5BC439), size: AppSizes.r20),
                            SizedBox(width: AppSizes.pw12),
                            Text('4.5', style: AppTextStyle.ratingStyle),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: AppSizes.h30,
                                width: AppSizes.w30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD1CFD5),
                                  borderRadius: AppRadius.small,
                                ),
                                child: Container(
                                  height: AppSizes.h2,
                                  width: AppSizes.w10,
                                  color: Color(0xFF363D4E),
                                ),
                              ),
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF363D4E),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: AppSizes.h30,
                                width: AppSizes.w30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD1CFD5),
                                  borderRadius: AppRadius.medium,
                                ),
                                child: Icon(Icons.add, size: AppSizes.r20, color: Color(0xFF363D4E)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppSizes.h14);
      },
      itemCount: 2,
    );
  }
}
