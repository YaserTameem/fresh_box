import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late TextEditingController instructionsController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    instructionsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: " Fresh Sandwitch",
        icon: Icons.more_vert,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                      color: Get.isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground,
                      borderRadius: AppRadius.small,
                    ),
                    child: Container(
                      height: AppSizes.h2,
                      width: AppSizes.w10,
                      color: Get.isDarkMode ? DarkColors.textBodyColor : LightColors.textBodyColor,
                    ),
                  ),
                ),
                Text(
                  '10',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Get.isDarkMode ? DarkColors.textBodyColor : LightColors.textBodyColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: AppSizes.h30,
                    width: AppSizes.w30,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground,
                      borderRadius: AppRadius.medium,
                    ),
                    child: Icon(
                      Icons.add,
                      size: AppSizes.r20,
                      color: Get.isDarkMode ? DarkColors.textBodyColor : LightColors.textBodyColor,
                    ),
                  ),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(AppSizes.w184, AppSizes.h50)),
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/sandwitch.png',
                  height: AppSizes.h200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppSizes.ph30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 3,
                      'Authentic\nJapanese\nFresh Sandwitch',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color:
                            Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
                      ),
                    ),
                  ),
                  Text(
                    '\$12',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                      fontSize: AppSizes.sp27,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.ph4),
              Text(
                'Lorem ipsum et dolor sit amet, and consectetur eadipiscing elit. Ametmo magna the cursus yum dolor praesenta the  pulvinar tristique the food.',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Get.isDarkMode ? DarkColors.actionMutedColor : LightColors.actionMutedColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: AppSizes.ph4),
              Text('Reviews', style: Theme.of(context).textTheme.labelMedium),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 80),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            width: AppSizes.w52,
                            height: AppSizes.h50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: AppSizes.pw16);
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(height: AppSizes.ph30),
              Text('Add Instructions', style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: AppSizes.ph12),
              TextField(
                controller: instructionsController,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Write Instructions',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.textHintColor,
                  ),
                  filled: true,
                  fillColor: Get.isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
