import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/onboarding/controllers/onboarding_controller.dart';
import 'package:fresh_box/features/onboarding/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/onboarding_logo.svg'),
              SizedBox(height: AppSizes.h(72)),
              SizedBox(
                height: AppSizes.h(495),
                child: PageView.builder(
                  onPageChanged: controller.onPageChange,
                  controller: controller.pageController,
                  itemCount: OnboardingModel.onboardingData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = OnboardingModel.onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.image),
                        SizedBox(height: AppSizes.h(30)),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color:
                                Get.isDarkMode
                                    ? DarkColors.textPrimaryColor
                                    : LightColors.textPrimaryColor,
                            fontSize: AppSizes.sp(27),
                          ),
                        ),
                        SizedBox(height: AppSizes.h(20)),
                        Text(
                          textAlign: TextAlign.center,
                          item.supTitle,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: AppSizes.h(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(OnboardingModel.onboardingData.length, (index) {
                  final isCurrentPage = index == controller.currentPage.value;
                  return AnimatedContainer(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.w(8)),
                    duration: Duration(milliseconds: 300),
                    height: AppSizes.h(8),
                    width: isCurrentPage ? AppSizes.w(20) : AppSizes.w(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.r(20)),
                      color:
                          isCurrentPage
                              ? Get.isDarkMode
                                  ? DarkColors.textSecondaryColor
                                  : LightColors.textSecondaryColor
                              : Get.isDarkMode
                              ? DarkColors.neutralGreyColor
                              : LightColors.neutralGreyColor,
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSizes.h(20)),
              Visibility(
                visible: controller.currentPage.value == OnboardingModel.onboardingData.length - 1,
                replacement: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          controller.pageController.animateToPage(
                            OnboardingModel.onboardingData.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'onboarding.skip'.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Get.isDarkMode
                                  ? DarkColors.textPrimaryColor
                                  : LightColors.textPrimaryColor,
                          fixedSize: Size(AppSizes.w(154), AppSizes.h(50)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r(10)),
                          ),
                        ),
                        onPressed: () {
                          if (controller.currentPage.value < OnboardingModel.onboardingData.length - 1) {
                            controller.pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          'onboarding.next'.tr,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color:
                                Get.isDarkMode
                                    ? DarkColors.buttonTextColor
                                    : LightColors.buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.textSecondaryColor : LightColors.textSecondaryColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h(50)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(10))),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    'onboarding.get_started'.tr,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
