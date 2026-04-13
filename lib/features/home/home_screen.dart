import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/localization/localization_service.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/services/language_service.dart';
import 'package:fresh_box/core/services/theme_service.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/home/components/product_card.dart';
import 'package:fresh_box/features/home/components/section_header.dart';
import 'package:fresh_box/features/home/models/products_model.dart';
import 'package:fresh_box/features/home/popular_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int currentPage = 0;
  late TextEditingController searchController;
  late PageController pageController;
  final themeService = Get.find<ThemeService>();
  final languageService = Get.find<LanguageService>();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.w(24), vertical: AppSizes.h(14)),
                title: Text(
                  'home.location_label'.tr,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color:
                        Get.isDarkMode
                            ? DarkColors.secondaryLabelColor
                            : LightColors.secondaryLabelColor,
                    fontSize: AppSizes.sp(13),
                  ),
                ),
                subtitle: Text(
                  '9224 Jailyn Terrace, block 2',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: Image.asset('assets/images/profile_ph.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async {
                      final newLocale =
                          languageService.isArabic
                              ? LocalizationService.englishLocale
                              : LocalizationService.arabicLocale;
                      await languageService.changeLanguage(newLocale);
                    },
                    icon: const Icon(Icons.language),
                  ),
                  Obx(
                    () => IconButton(
                      onPressed: themeService.toggleTheme,
                      icon: Icon(themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.h(6),
                  left: AppSizes.w(25),
                  right: AppSizes.w(25),
                  bottom: AppSizes.h(26),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Get.isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSizes.r(10))),
                    hintText: 'home.search_hint'.tr,
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color:
                          Get.isDarkMode
                              ? DarkColors.textSecondaryColor
                              : LightColors.textSecondaryColor,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: AppSizes.w(14),
                      right: AppSizes.w(14),
                      bottom: AppSizes.h(14),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(AppSizes.w(6)),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                          borderRadius: BorderRadius.circular(AppSizes.r(10)),
                        ),
                        child: Icon(
                          Icons.mic_rounded,
                          color:
                              Get.isDarkMode
                                  ? DarkColors.textPrimaryColor
                                  : LightColors.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.h(40),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsetsDirectional.only(start: AppSizes.w(24)),
                  itemCount: catgoriy.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = catgoriy[index];
                    final isSelected = index == currentIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            Text(
                              item,
                              style:
                                  isSelected
                                      ? Theme.of(context).textTheme.labelMedium
                                      : Theme.of(
                                        context,
                                      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                            ),
                            if (isSelected) ...[
                              SizedBox(height: AppSizes.h(8)),
                              Container(
                                height: AppSizes.h(2),
                                decoration: BoxDecoration(
                                  color:
                                      Get.isDarkMode
                                          ? DarkColors.textPrimaryColor
                                          : LightColors.textPrimaryColor,
                                  borderRadius: BorderRadius.circular(AppSizes.r(10)),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: AppSizes.w(14));
                  },
                ),
              ),
              SizedBox(height: AppSizes.h(30)),
              SizedBox(
                height: AppSizes.h(112),
                child: ListView.separated(
                  padding: EdgeInsets.only(left: AppSizes.w(24)),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: AppSizes.h(111),
                      width: AppSizes.w(81),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                                borderRadius: BorderRadius.circular(AppSizes.r(10)),
                              ),
                              height: AppSizes.h(81),
                              width: AppSizes.w(81),
                              child: Image.asset('assets/images/item_1.png', fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: AppSizes.h(8)),
                          Text(
                            'home.category.breakfast'.tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: AppSizes.w(21));
                  },
                  itemCount: 4,
                ),
              ),
              SizedBox(height: AppSizes.h(30)),
              SizedBox(
                height: AppSizes.h(212),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: 3,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Image.asset('assets/images/sweet_pic.png'),
                        Positioned(
                          bottom: 30,
                          left: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fresh Sweet Truth',
                                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                      color:
                                          Get.isDarkMode
                                              ? DarkColors.buttonTextColor
                                              : LightColors.buttonTextColor,
                                    ),
                                  ),
                                  Text(
                                    'Bakery, Desserts',
                                    style: AppTextStyle.discStyle.copyWith(
                                      color: LightColors.buttonTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: AppSizes.w(14)),
                              Text(
                                '\$8.99',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color:
                                      Get.isDarkMode
                                          ? DarkColors.buttonTextColor
                                          : LightColors.buttonTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: AppSizes.h(30)),
              SectionHeader(
                title: 'home.section.popular_food'.tr,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.popular);
                },
              ),
              SizedBox(height: AppSizes.h(16)),
              SizedBox(
                height: AppSizes.h(310),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductsModel.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.h(20)),
                      child: ProductCard(index: index),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: AppSizes.w(16));
                  },
                ),
              ),
              SizedBox(height: AppSizes.h(30)),
              SectionHeader(
                title: 'home.section.nearby_restaurant'.tr,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.popular);
                },
              ),
              SizedBox(height: AppSizes.h(20)),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(AppSizes.w(12)),
                    height: AppSizes.h(222),
                    width: AppSizes.w(325),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                      borderRadius: BorderRadius.circular(AppSizes.r(10)),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/home_item.png'),
                            Positioned(
                              left: 12.5,
                              bottom: 14,
                              child: Container(
                                alignment: Alignment.center,
                                height: AppSizes.h(26),
                                width: AppSizes.w(78),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppSizes.r(10)),
                                  color:
                                      Get.isDarkMode
                                          ? DarkColors.surfaceColor
                                          : LightColors.surfaceColor,
                                ),
                                child: Text('1.2 Km', style: Theme.of(context).textTheme.headlineSmall),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.h(12)),
                        Row(
                          children: [
                            Text('Salad Factory', style: Theme.of(context).textTheme.labelMedium),
                            Spacer(),
                            Icon(
                              Icons.star,
                              color:
                                  Get.isDarkMode
                                      ? DarkColors.accentGreenColor
                                      : LightColors.accentGreenColor,
                              size: AppSizes.r(20),
                            ),
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.accentGreenColor
                                        : LightColors.accentGreenColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.h(6)),

                        Row(
                          children: [
                            Text(
                              '2464 Royal Ln. Mesa',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.addressTextColor
                                        : LightColors.addressTextColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Open at 10:00 AM',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color:
                                    Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: AppSizes.h(20));
                },
              ),
              SizedBox(height: AppSizes.h(38)),
            ],
          ),
        ),
      ),
    );
  }

  List<String> catgoriy = [
    'home.category.featured'.tr,
    'home.category.nearby'.tr,
    'home.category.trending'.tr,
    'home.category.newest'.tr,
  ];
}

