import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_elevated_button.dart';
import 'package:fresh_box/core/widget/custom_text_form_field.dart';
import 'package:fresh_box/features/auth/components/custom_auth_elevated_button.dart';
import 'package:fresh_box/features/auth/login_screen.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class _SingUpScreenState extends State<SingUpScreen> {
  final int length = 5;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNode;
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(length, (index) => TextEditingController());
    focusNode = List.generate(length, (index) => FocusNode());
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNode) {
      f.dispose();
    }
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < length - 1) {
      focusNode[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNode[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.h(24), horizontal: AppSizes.w(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: AppSizes.h(22),
                      width: AppSizes.w(114),
                    ),
                  ),
                  SizedBox(height: AppSizes.h(38)),
                  Text('auth.signup.title'.tr, style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    'auth.signup.subtitle'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSizes.h(24)),
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'auth.signup.username.required'.tr;
                      }
                      return null;
                    },
                    hintText: 'auth.signup.username.hint'.tr,
                    title: 'auth.signup.username.label'.tr,
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'auth.signup.email.required'.tr;
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'auth.signup.email.hint'.tr,
                    title: 'auth.signup.email.label'.tr,
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  CustomTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'auth.signup.password.required'.tr;
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'auth.signup.password.hint'.tr,
                    title: 'auth.signup.password.label'.tr,
                  ),
                  SizedBox(height: AppSizes.h(30)),
                  CustomElevatedButton(
                    text: 'auth.signup.submit'.tr,
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        showOTPDialog(context);
                      }
                    },
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'auth.signup.have_account'.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          TextSpan(),
                          TextSpan(
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginScreen()),
                                    );
                                  },
                            text: 'auth.signup.sign_in'.tr,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  CustomAuthElevatedButton(
                    label: 'auth.signup.continue_google'.tr,
                    icon: 'assets/images/google_icon.svg',
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  CustomAuthElevatedButton(
                    isFacebook: true,
                    label: 'auth.signup.continue_facebook'.tr,
                    icon: 'assets/images/facebook_icon.svg',
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.accentBlueColor : LightColors.accentBlueColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showOTPDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(12))),
          backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          contentPadding: EdgeInsets.all(AppSizes.w(21)),
          title: Text(
            'auth.otp.title'.tr,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: AppSizes.sp(21),
              color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
            ),
          ),
          children: [
            Column(
              children: [
                Text(
                  'An authentication code has been sent to Karina63@yahoo.com',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: AppSizes.h(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(length, (index) {
                    return SizedBox(
                      width: AppSizes.w(48),
                      height: AppSizes.h(48),
                      child: Padding(
                        padding: EdgeInsets.only(right: AppSizes.w(10)),
                        child: TextField(
                          controller: controllers[index],
                          focusNode: focusNode[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLength: 1,
                          onChanged: (value) => _onChanged(value, index),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r(8)),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r(8)),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                              width: AppSizes.w(2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r(8)),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.cardBackground
                                        : LightColors.cardBackground,
                                width: AppSizes.w(1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: AppSizes.h(20)),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'auth.otp.no_code'.tr,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                      children: [
                        TextSpan(),
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  );
                                },
                          text: 'auth.otp.resend'.tr,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.h(50)),
                CustomElevatedButton(text: 'common.continue'.tr, onPressed: () {}),
              ],
            ),
          ],
        );
      },
    );
  }
}

