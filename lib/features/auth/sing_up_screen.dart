import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_elevated_button1.dart';
import 'package:fresh_box/core/widget/custom_text_form_field.dart';
import 'package:fresh_box/features/auth/components/custom_elevated_button.dart';
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
              padding: EdgeInsets.symmetric(vertical: AppSizes.ph24, horizontal: AppSizes.pw24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: AppSizes.h22,
                      width: AppSizes.w114,
                    ),
                  ),
                  SizedBox(height: AppSizes.ph38),
                  Text('Let’s get Started', style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    'Create an account to continue!',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSizes.ph24),
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    hintText: 'Enter your username',
                    title: 'Username',
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'Enter your email',
                    title: 'Email Id',
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your Password';
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'Enter your password',
                    title: 'Password',
                  ),
                  SizedBox(height: AppSizes.ph30),
                  CustomElevatedButton1(
                    text: 'Sing Up',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        showOTPDialog(context);
                      }
                    },
                  ),
                  SizedBox(height: AppSizes.ph20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
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
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomElevatedButton(
                    label: 'Continue With Google',
                    icon: 'assets/images/google_icon.svg',
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomElevatedButton(
                    isFacebook: true,
                    label: 'Continue With Facebook',
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          contentPadding: EdgeInsets.all(AppSizes.pw21),
          title: Text(
            'OTP Authentication',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: AppSizes.sp21,
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
                SizedBox(height: AppSizes.h30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(length, (index) {
                    return SizedBox(
                      width: AppSizes.w48,
                      height: AppSizes.h48,
                      child: Padding(
                        padding: EdgeInsets.only(right: AppSizes.pw10),
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
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    Get.isDarkMode
                                        ? DarkColors.cardBackground
                                        : LightColors.cardBackground,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: AppSizes.ph20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn’t receive code. ',
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
                          text: 'Resend (51s)',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.ph50),
                CustomElevatedButton1(text: 'Continue', onPressed: () {}),
              ],
            ),
          ],
        );
      },
    );
  }
}
