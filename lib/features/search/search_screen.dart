import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_discount_badge.dart';
import 'package:fresh_box/features/home/components/product_card.dart';
import 'package:fresh_box/features/home/models/products_model.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  bool isGrid = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 350,
        actionsPadding: EdgeInsets.only(left: 20, right: 27),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.mic_rounded),
              prefixIcon: Icon(Icons.search_outlined),
              hintText: 'Search',
              border: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
            child: SvgPicture.asset(
              isGrid ? 'assets/images/grid_icon.svg' : 'assets/images/list_icon.svg',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph30),
            height: AppSizes.h40,
            width: AppSizes.w325,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? DarkColors.tabBackgroundColor : LightColors.tabBackgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
            child: TabBar(
              controller: _tabController,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              dividerColor: Colors.transparent,
              indicatorColor:
                  Get.isDarkMode ? DarkColors.textSecondaryColor : LightColors.textSecondaryColor,

              tabs: [
                Text(
                  'Food',
                  style:
                      currentIndex == 0
                          ? theme.labelMedium
                          : theme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.textHintColor,
                          ),
                ),
                Text(
                  'Restaurant',
                  style:
                      currentIndex == 1
                          ? theme.labelMedium
                          : theme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.textHintColor,
                          ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [isGrid ? FoodListCard() : FoodGridCard(), RestaurantListCard()],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: BorderSide(color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor),
    );
  }
}

class RestaurantListCard extends StatelessWidget {
  const RestaurantListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(AppSizes.pw12),
          height: AppSizes.h222,
          width: AppSizes.w325,
          decoration: BoxDecoration(
            color:Get.isDarkMode?DarkColors.surfaceColor: LightColors.surfaceColor,
            borderRadius: BorderRadius.circular(AppSizes.r10),
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
                      height: AppSizes.h26,
                      width: AppSizes.w78,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.r10),
                        color:Get.isDarkMode?DarkColors.surfaceColor: LightColors.surfaceColor,
                      ),
                      child: Text('1.2 Km', style: theme.headlineSmall),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.ph12),
              Row(
                children: [
                  Text('Salad Factory', style: theme.labelMedium),
                  Spacer(),
                  Icon(Icons.star, color:Get.isDarkMode?DarkColors.accentGreenColor: LightColors.accentGreenColor, size: AppSizes.r20),
                  Text(
                    '4.5',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color:Get.isDarkMode?DarkColors.accentGreenColor: LightColors.accentGreenColor),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.ph6),

              Row(
                children: [
                  Text(
                    '2464 Royal Ln. Mesa',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color:Get.isDarkMode?DarkColors.addressTextColor: LightColors.addressTextColor),
                  ),
                  Spacer(),
                  Text(
                    'Open at 10:00 AM',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color:Get.isDarkMode?DarkColors.primaryColor: LightColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: AppSizes.ph20);
      },
    );
  }
}

class FoodListCard extends StatelessWidget {
  const FoodListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 25),

      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(AppSizes.pw12),
          height: AppSizes.h114,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
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
                        color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                      ),
                    ),
                    Text(
                      'Fresh Sandwitch',
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color:
                                  Get.isDarkMode
                                      ? DarkColors.accentGreenColor
                                      : LightColors.accentGreenColor,
                              size: AppSizes.r20,
                            ),
                            SizedBox(width: AppSizes.pw12),
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
                        Row(
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Get.isDarkMode ? DarkColors.textSupColor : LightColors.textSupColor,
                              size: AppSizes.r20,
                            ),
                            Text(
                              '30',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color:
                                    Get.isDarkMode ? DarkColors.textSupColor : LightColors.textSupColor,
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
      itemCount: 10,
    );
  }
}

class FoodGridCard extends StatelessWidget {
  const FoodGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
      child: GridView.builder(
        itemCount: ProductsModel.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: AppSizes.w154 / AppSizes.h270,
          crossAxisSpacing: AppSizes.w10,
          mainAxisSpacing: AppSizes.h10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(index: index);
        },
      ),
    );
  }
}
