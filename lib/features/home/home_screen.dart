import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/features/card/cart_screen.dart';
import 'package:fresh_box/features/home/components/sliver_home_grid.dart';
import 'package:fresh_box/features/home/components/sliver_home_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Popular Food'),
      body: CustomScrollView(
        slivers: [
          SliverHomeGrid(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended', style: Theme.of(context).textTheme.bodyLarge),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: AppRadius.xs),
                      backgroundColor: LightColors.textSecondaryColor,
                      fixedSize: Size(AppSizes.w78, AppSizes.h26),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                    },
                    child: Text('See All', style: AppTextStyle.buttonStyle),
                  ),
                ],
              ),
            ),
          ),
          SliverHomeList(),
        ],
      ),
    );
  }
}
