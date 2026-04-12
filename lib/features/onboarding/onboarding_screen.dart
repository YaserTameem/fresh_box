import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/auth/login_screen.dart';
import 'package:fresh_box/features/onboarding/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SvgPicture.asset('assets/images/onboarding_logo.svg'),
              SizedBox(height: AppSizes.h72),
              SizedBox(
                height: AppSizes.h495,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: pageController,
                  itemCount: OnboardingModel.onboardingData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = OnboardingModel.onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.image),
                        SizedBox(height: AppSizes.h30),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color:
                                Get.isDarkMode
                                    ? DarkColors.textPrimaryColor
                                    : LightColors.textPrimaryColor,
                            fontSize: AppSizes.sp27,
                          ),
                        ),
                        SizedBox(height: AppSizes.h20),
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
              SizedBox(height: AppSizes.ph24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(OnboardingModel.onboardingData.length, (index) {
                  final isCurrentPage = index == currentPage;
                  return AnimatedContainer(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.pw8),
                    duration: Duration(milliseconds: 300),
                    height: AppSizes.h8,
                    width: isCurrentPage ? AppSizes.w20 : AppSizes.w8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
              SizedBox(height: AppSizes.ph20),
              Visibility(
                visible: currentPage == OnboardingModel.onboardingData.length - 1,
                replacement: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          pageController.animateToPage(
                            OnboardingModel.onboardingData.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text('Skip', style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Get.isDarkMode
                                  ? DarkColors.textPrimaryColor
                                  : LightColors.textPrimaryColor,
                          fixedSize: Size(AppSizes.w154, AppSizes.h50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (currentPage < OnboardingModel.onboardingData.length - 1) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          'Next',
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
                    fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    'Get Started',
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
