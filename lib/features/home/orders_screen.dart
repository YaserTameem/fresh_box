import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/enum/history_states_enum.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/core/widget/custom_elevated_button.dart';
import 'package:fresh_box/features/home/models/history_model.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  HistoryStatesEnum historyState = HistoryStatesEnum.initial;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getHistoryData();
  }

  void getHistoryData() {
    setState(() {
      if (HistoryModel.historyData.isEmpty) {
        historyState = HistoryStatesEnum.initial;
      } else {
        historyState = HistoryStatesEnum.loaded;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'orders.title'.tr,
        onTap: () {},
        centerTitle: false,
        showLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSizes.w(24), vertical: AppSizes.h(30)),
            height: AppSizes.h(40),
            width: AppSizes.w(325),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? DarkColors.tabBackgroundColor : LightColors.tabBackgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.r(10)),
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
                  'orders.tab.history'.tr,
                  style:
                      currentIndex == 0
                          ? Theme.of(context).textTheme.labelMedium
                          : Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.textHintColor,
                          ),
                ),
                Text(
                  'orders.tab.upcoming'.tr,
                  style:
                      currentIndex == 1
                          ? Theme.of(context).textTheme.labelMedium
                          : Theme.of(context).textTheme.headlineSmall?.copyWith(
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
              children: [
                switch (historyState) {
                  HistoryStatesEnum.initial => Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Unhappy2.png'),
                          SizedBox(height: AppSizes.h(20)),
                          Text(
                            'orders.empty.title'.tr,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color:
                                  Get.isDarkMode
                                      ? DarkColors.textPrimaryColor
                                      : LightColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: AppSizes.h(4)),
                          Text(
                            textAlign: TextAlign.center,
                            'orders.empty.message'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: AppSizes.h(56)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h(50)),
                            ),
                            onPressed: () {},
                            child: Text('orders.empty.cta'.tr),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HistoryStatesEnum.loaded => Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = HistoryModel.historyData[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSizes.w(20)),
                          height: AppSizes.h(150),
                          width: AppSizes.w(325),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                            borderRadius: BorderRadius.circular(AppSizes.r(10)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.cardShadowColor
                                        : LightColors.cardShadowColor,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: AppSizes.h(20)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(item.restaurantImage),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 4,
                                    children: [
                                      Text(
                                        item.restaurantName,
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(
                                        item.orderDate,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        item.orderStatus,
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                          fontSize: AppSizes.sp(13),
                                          color:
                                              item.isDelivered
                                                  ? Get.isDarkMode
                                                      ? DarkColors.accentGreenColor
                                                      : LightColors.accentGreenColor
                                                  : Get.isDarkMode
                                                  ? DarkColors.actionMutedColor
                                                  : LightColors.actionMutedColor,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    '\$${item.totalPrice}',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSizes.h(16)),
                              Row(
                                spacing: 13,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'orders.action.reorder'.tr,
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                          color:
                                              Get.isDarkMode
                                                  ? DarkColors.surfaceColor
                                                  : LightColors.surfaceColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showRateDialog(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Get.isDarkMode
                                                ? DarkColors.cardBackground
                                                : LightColors.cardBackground,
                                      ),
                                      child: Text(
                                        'orders.action.rate'.tr,
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: AppSizes.h(20));
                      },
                      itemCount: HistoryModel.historyData.length,
                    ),
                  ),
                },

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        Text(
                          'orders.section.in_progress'.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) {
                            final item = HistoryModel.historyData[index];
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.w(20)),
                              height: AppSizes.h(150),
                              width: AppSizes.w(325),
                              decoration: BoxDecoration(
                                color:
                                    Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                                borderRadius: BorderRadius.circular(AppSizes.r(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Get.isDarkMode
                                            ? DarkColors.cardShadowColor
                                            : LightColors.cardShadowColor,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: AppSizes.h(20)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(item.restaurantImage),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 4,
                                        children: [
                                          Text(
                                            item.restaurantName,
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                          Text(
                                            item.orderDate,
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            'orders.status.on_the_way'.tr,
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              fontSize: AppSizes.sp(13),
                                              color:
                                                  Get.isDarkMode
                                                      ? DarkColors.accentBlueColor
                                                      : LightColors.accentBlueColor,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Text(
                                        '\$${item.totalPrice}',
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizes.h(16)),
                                  Row(
                                    spacing: 13,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Get.isDarkMode
                                                    ? DarkColors.textHintColor
                                                    : LightColors.textHintColor,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'orders.action.track_order'.tr,
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              color:
                                                  Get.isDarkMode
                                                      ? DarkColors.surfaceColor
                                                      : LightColors.surfaceColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Get.isDarkMode
                                                    ? DarkColors.cancelActionColor
                                                    : LightColors.cancelActionColor,
                                          ),
                                          child: Text(
                                            'orders.action.cancel'.tr,
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              color:
                                                  Get.isDarkMode
                                                      ? DarkColors.surfaceColor
                                                      : LightColors.surfaceColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(height: AppSizes.h(20));
                          },
                          itemCount: HistoryModel.historyData.length - 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int selectedRating = 0;

void showRateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      int tempRating = selectedRating;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(12))),
            title: Text(
              textAlign: TextAlign.start,
              'orders.rate_dialog.title'.tr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: AppSizes.sp(21),
                color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
              ),
            ),
            content: Text(
              textAlign: TextAlign.start,
              'orders.rate_dialog.message'.tr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
            ),
            actions: [
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        tempRating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < tempRating ? Icons.star : Icons.star_border,
                      color:
                          Get.isDarkMode
                              ? DarkColors.textSecondaryColor
                              : LightColors.textSecondaryColor,
                      size: AppSizes.r(32),
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSizes.h(30)),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  fillColor:
                      Get.isDarkMode
                          ? DarkColors.inputBackgroundColor
                          : LightColors.inputBackgroundColor,
                  filled: true,
                  hintText: 'orders.rate_dialog.hint'.tr,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: AppSizes.h(20)),

              CustomElevatedButton(
                text: 'common.continue'.tr,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    },
  );
}

