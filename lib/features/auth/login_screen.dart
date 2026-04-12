import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_elevated_button1.dart';
import 'package:fresh_box/core/widget/custom_text_form_field.dart';
import 'package:fresh_box/features/auth/components/custom_elevated_button.dart';
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
                  Text('Let’s Sign You In', style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    'Welcome back, you’ve been missed!',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSizes.ph24),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username or E-mail';
                      }
                      // final RegExp passwordRegex = RegExp(r'^(?=.*\d).{8,}$');
                      //
                      // if (!passwordRegex.hasMatch(value)) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                    hintText: 'Enter your username or E-mail',
                    title: 'Username or E-mail',
                  ),

                  SizedBox(height: AppSizes.ph20),
                  CustomTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                  SizedBox(height: AppSizes.ph14),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?', style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SizedBox(height: AppSizes.ph40),
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
                      'LogIn',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.ph20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
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
                            text: 'Sign Up',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Get.isDarkMode ? DarkColors.primaryColor : LightColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.ph84),
                  CustomElevatedButton(
                    label: 'Continue With Google',
                    icon: 'assets/images/google_icon.svg',
                    backgroundColor:
                        Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                  ),
                  SizedBox(height: AppSizes.ph14),
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

  void showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (context, setState) => AlertDialog(
                backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: Text(
                  'Password Recovery',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: AppSizes.sp21,
                    color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
                  ),
                ),
                content: Text(
                  'Enter your email for the verification proccess, we will send you link to Reset your Password.',
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
                    hintText: 'Enter your e-mail',
                    title: 'Email Id',
                    fillColor:
                        Get.isDarkMode
                            ? DarkColors.inputBackgroundColor
                            : LightColors.inputBackgroundColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your E-mail';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSizes.ph56),
                  CustomElevatedButton1(
                    text: 'Continue',
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text(
                'Reset Your Password',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: AppSizes.sp21,
                  color: Get.isDarkMode ? DarkColors.dialogTitleColor : LightColors.dialogTitleColor,
                ),
              ),
              content: Text(
                'At least 9 characters, with uppercase and lowercase letters',
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
                  hintText: 'new password',
                  title: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes.ph20),
                CustomTextFormField(
                  fillColor:
                      Get.isDarkMode
                          ? DarkColors.inputBackgroundColor
                          : LightColors.inputBackgroundColor,
                  controller: confirmResetPasswordController,
                  isPassword: true,
                  hintText: 'Confirm new password',
                  title: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes.ph14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRequirement('1 Capital latter', hasUpperCase),
                    SizedBox(height: AppSizes.ph8),
                    buildRequirement('1 Number', hasNumber),
                    SizedBox(height: AppSizes.ph8),
                    buildRequirement('1 Spacial Character', hasSpecialChar),
                  ],
                ),
                SizedBox(height: AppSizes.ph40),
                CustomElevatedButton1(
                  text: 'Continue',
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
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color:Get.isDarkMode?DarkColors.accentGreenColor: LightColors.accentGreenColor),
          ),
      ],
    );
  }

  void showSuccessfullyRestPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:Get.isDarkMode?DarkColors.surfaceColor: LightColors.surfaceColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            textAlign: TextAlign.center,
            'Congratulations!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: AppSizes.sp21,
              color:Get.isDarkMode?DarkColors.dialogTitleColor: LightColors.dialogTitleColor,
            ),
          ),
          content: Text(
            textAlign: TextAlign.center,
            'You successfully rest your password.Now you are good to go',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          actions: [
            SvgPicture.asset('assets/images/successfully_rest.svg'),
            SizedBox(height: AppSizes.ph40),
            CustomElevatedButton1(
              text: 'Jump Into Log In',
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
