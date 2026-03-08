import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_app_bar.dart';
import 'package:fresh_box/features/cart/components/cart_list_view.dart';
import 'package:fresh_box/features/cart/components/custom_list_tile.dart';
import 'package:fresh_box/features/home/home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardListView(),
              Text('Recepient Address', style: AppTextStyle.body),
              SizedBox(height: AppSizes.ph20),
              Container(
                padding: EdgeInsets.only(left: AppSizes.pw16, top: AppSizes.ph14),
                height: AppSizes.h104,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightColors.cardBackground,
                  borderRadius: AppRadius.medium,
                ),
                child: Text(
                  maxLines: 3,
                  '9224 Jailyn Terrace, block 2, North\nMaryjaneton, Tanzania, 4387242',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: AppSizes.ph30),
              Text('Order Review', style: AppTextStyle.body),
              SizedBox(height: AppSizes.ph24),
              CustomListTile(title: 'Full Vegie Salad (1 items)', trailing: '\$10'),
              CustomListTile(title: 'Toasted Sandwich (1 items)', trailing: '\$10'),
              CustomListTile(title: 'Delivery Fee', trailing: '\$5'),
              CustomListTile(title: 'Discount', trailing: '\$-8'),
              SizedBox(height: AppSizes.ph16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Review', style: Theme.of(context).textTheme.bodyLarge),
                  Text('\$15', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              SizedBox(height: AppSizes.ph50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
                  fixedSize: Size(MediaQuery.of(context).size.width, AppSizes.h50),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  'Process to Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21.sp,
                    fontFamily: "Montserrat",
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
