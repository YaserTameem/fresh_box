import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_elevated_button.dart';
import 'package:fresh_box/core/widget/custom_text_form_field.dart';
import 'package:fresh_box/features/auth/components/custom_auth_elevated_button.dart';
import 'package:fresh_box/features/auth/sing_up_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  bool isValidEmail = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordEmailController;
  late TextEditingController resetPasswordController;
  late TextEditingController confirmResetPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    confirmPasswordEmailController = TextEditingController();
    passwordController = TextEditingController();
    resetPasswordController = TextEditingController();
    confirmResetPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    resetPasswordController.dispose();
    confirmResetPasswordController.dispose();
    confirmPasswordEmailController.dispose();
    super.dispose();
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
                  Text('auth.login.title'.tr, style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    'auth.login.subtitle'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSizes.h(24)),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'auth.login.username_or_email.required'.tr;
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'auth.login.username_or_email.hint'.tr,
                    title: 'auth.login.username_or_email.label'.tr,
                  ),

                  SizedBox(height: AppSizes.h(20)),
                  CustomTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'auth.login.password.required'.tr;
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'auth.login.password.hint'.tr,
                    title: 'auth.login.password.label'.tr,
                  ),
                  SizedBox(height: AppSizes.h(14)),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'auth.login.forgot_password'.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h(40)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        showForgotPasswordDialog(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => PopularScreen()),
                        // );
                      }
                    },
                    child: Text(
                      'auth.login.submit'.tr,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h(20)),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'auth.login.no_account'.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          TextSpan(),
                          TextSpan(
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SingUpScreen()),
                                    );
                                  },
                            text: 'auth.login.sign_up'.tr,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h(84)),
                  CustomAuthElevatedButton(
                    label: 'auth.login.continue_google'.tr,
                    icon: 'assets/images/google_icon.svg',
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                  ),
                  SizedBox(height: AppSizes.h(14)),
                  CustomAuthElevatedButton(
                    isFacebook: true,
                    label: 'auth.login.continue_facebook'.tr,
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

  void showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (context, setState) => AlertDialog(
                backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(12))),
                title: Text(
                  'auth.forgot.title'.tr,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: AppSizes.sp(21),
                    color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
                  ),
                ),
                content: Text(
                  'auth.forgot.message'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                ),
                actions: [
                  CustomTextFormField(
                    suffix:
                        isValidEmail
                            ? Icon(
                              Icons.check_circle_outline,
                              color:
                                  Get.isDarkMode
                                      ? DarkColors.accentGreenColor
                                      : LightColors.accentGreenColor,
                            )
                            : null,
                    onChanged: (value) {
                      setState(() {
                        isButtonEnabled = value!.trim().isNotEmpty;
                      });
                      setState(() {
                        isValidEmail = value!.trim().endsWith('@');
                      });
                    },
                    controller: confirmPasswordEmailController,
                    hintText: 'auth.forgot.email.hint'.tr,
                    title: 'auth.forgot.email.label'.tr,
                    fillColor:
                        Get.isDarkMode
                            ? DarkColors.inputBackgroundColor
                            : LightColors.inputBackgroundColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'auth.forgot.email.required'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSizes.h(56)),
                  CustomElevatedButton(
                    text: 'common.continue'.tr,
                    onPressed:
                        isButtonEnabled
                            ? () {
                              if (_key.currentState!.validate()) {
                                Navigator.pop(context);

                                return showResetPasswordDialog(context);
                              }
                            }
                            : null,
                  ),
                ],
              ),
        );
      },
    );
  }

  void showResetPasswordDialog(BuildContext context) {
    bool hasUpperCase = false;
    bool hasNumber = false;
    bool hasSpecialChar = false;
    void validatePassword(String value) {
      hasUpperCase = value.contains(RegExp(r'[A-Z]'));
      hasNumber = value.contains(RegExp(r'[0-9]'));
      hasSpecialChar = value.contains(RegExp(r'[!@#\$%^&*?.]'));
    }

    bool valid() {
      if (hasUpperCase && hasSpecialChar && hasNumber) {
        return true;
      }
      return false;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(12))),
              title: Text(
                'auth.reset.title'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: AppSizes.sp(21),
                  color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
                ),
              ),
              content: Text(
                'auth.reset.message'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
              ),
              actions: [
                CustomTextFormField(
                  onChanged: (value) {
                    setState(() {
                      validatePassword(value!);
                    });
                  },
                  fillColor:
                      Get.isDarkMode
                          ? DarkColors.inputBackgroundColor
                          : LightColors.inputBackgroundColor,
                  controller: resetPasswordController,
                  isPassword: true,
                  hintText: 'auth.reset.new_password.hint'.tr,
                  title: 'auth.reset.new_password.label'.tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes.h(20)),
                CustomTextFormField(
                  fillColor:
                      Get.isDarkMode
                          ? DarkColors.inputBackgroundColor
                          : LightColors.inputBackgroundColor,
                  controller: confirmResetPasswordController,
                  isPassword: true,
                  hintText: 'auth.reset.confirm_password.hint'.tr,
                  title: 'auth.reset.confirm_password.label'.tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes.h(14)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRequirement('auth.reset.require_upper'.tr, hasUpperCase),
                    SizedBox(height: AppSizes.h(8)),
                    buildRequirement('auth.reset.require_number'.tr, hasNumber),
                    SizedBox(height: AppSizes.h(8)),
                    buildRequirement('auth.reset.require_special'.tr, hasSpecialChar),
                  ],
                ),
                SizedBox(height: AppSizes.h(40)),
                CustomElevatedButton(
                  text: 'common.continue'.tr,
                  onPressed:
                      valid()
                          ? () {
                            Navigator.pop(context);
                            showSuccessfullyRestPassword(context);
                          }
                          : null,
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle_outline : null,
          color:
              isValid
                  ? Get.isDarkMode
                      ? DarkColors.accentGreenColor
                      : LightColors.accentGreenColor
                  : Get.isDarkMode
                  ? DarkColors.neutralGreyColor
                  : LightColors.neutralGreyColor,
        ),
        if (isValid)
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Get.isDarkMode ? DarkColors.accentGreenColor : LightColors.accentGreenColor,
            ),
          ),
      ],
    );
  }

  void showSuccessfullyRestPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r(12))),
          title: Text(
            textAlign: TextAlign.center,
            'auth.reset_success.title'.tr,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: AppSizes.sp(21),
              color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
            ),
          ),
          content: Text(
            textAlign: TextAlign.center,
            'auth.reset_success.message'.tr,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          actions: [
            SvgPicture.asset('assets/images/successfully_rest.svg'),
            SizedBox(height: AppSizes.h(40)),
            CustomElevatedButton(
              text: 'auth.reset_success.cta'.tr,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

