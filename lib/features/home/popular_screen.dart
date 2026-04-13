import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/features/cart/cart_screen.dart';
import 'package:fresh_box/features/home/components/section_header.dart';
import 'package:fresh_box/features/home/components/sliver_home_grid.dart';
import 'package:fresh_box/features/home/components/sliver_home_list.dart';
import 'package:get/get.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'home.section.popular_food'.tr,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverHomeGrid(),
          SliverToBoxAdapter(
            child: SectionHeader(title: 'home.section.recommended'.tr, onPressed: () {}),
          ),
          SliverHomeList(),
        ],
      ),
    );
  }
}
