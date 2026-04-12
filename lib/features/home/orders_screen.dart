import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/enum/history_states_enum.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/core/widget/custom_elevated_button1.dart';
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
      appBar: CustomAppBar(title: 'My Orders', onTap: () {}, centerTitle: false, showLeading: false),
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
                  'History',
                  style:
                      currentIndex == 0
                          ? Theme.of(context).textTheme.labelMedium
                          : Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.textHintColor,
                          ),
                ),
                Text(
                  'Upcoming',
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
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Unhappy2.png'),
                          SizedBox(height: AppSizes.ph20),
                          Text(
                            'Empty History',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color:
                                  Get.isDarkMode
                                      ? DarkColors.textPrimaryColor
                                      : LightColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: AppSizes.ph4),
                          Text(
                            textAlign: TextAlign.center,
                            "You don't have a transaction\nhistory. Let’s Order Something",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: AppSizes.ph56),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
                            ),
                            onPressed: () {},
                            child: Text('Order Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HistoryStatesEnum.loaded => Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = HistoryModel.historyData[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw20),
                          height: AppSizes.h150,
                          width: AppSizes.w325,
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                            borderRadius: BorderRadius.circular(AppSizes.r10),
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
                              SizedBox(height: AppSizes.ph20),
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
                                          fontSize: AppSizes.sp13,
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
                              SizedBox(height: AppSizes.ph16),
                              Row(
                                spacing: 13,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Re-order',
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
                                        'Rate',
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
                        return SizedBox(height: AppSizes.ph20);
                      },
                      itemCount: HistoryModel.historyData.length,
                    ),
                  ),
                },

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        Text('Order in progress', style: Theme.of(context).textTheme.labelMedium),
                        ListView.separated(
                          itemBuilder: (context, index) {
                            final item = HistoryModel.historyData[index];
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.pw20),
                              height: AppSizes.h150,
                              width: AppSizes.w325,
                              decoration: BoxDecoration(
                                color:
                                    Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                                borderRadius: BorderRadius.circular(AppSizes.r10),
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
                                  SizedBox(height: AppSizes.ph20),
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
                                            'On the Way',
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              fontSize: AppSizes.sp13,
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
                                  SizedBox(height: AppSizes.ph16),
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
                                            'Track Order',
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
                                            'Cancel',
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
                            return SizedBox(height: AppSizes.ph20);
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(
              textAlign: TextAlign.start,
              'Rate This Food',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: AppSizes.sp21,
                color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
              ),
            ),
            content: Text(
              textAlign: TextAlign.start,
              'How is your experience enjoying this food? Let me know what you think.',
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
                      size: 32,
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSizes.ph30),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  fillColor:
                      Get.isDarkMode
                          ? DarkColors.inputBackgroundColor
                          : LightColors.inputBackgroundColor,
                  filled: true,
                  hintText: 'This food really\ntasty',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: AppSizes.ph20),

              CustomElevatedButton1(
                text: 'Continue',
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
