import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/core/widget/custom_text_form_field.dart';
import 'package:fresh_box/features/auth/components/custom_elevated_button.dart';
import 'package:fresh_box/features/auth/login_screen.dart';
import 'package:fresh_box/features/home/home_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class _SingUpScreenState extends State<SingUpScreen> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
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
                  Text('Let’s get Started', style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    'Create an account to continue!',
                    style: Theme.of(context).textTheme.headlineSmall,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    },
                    child: Text('Sign Up', style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SizedBox(height: AppSizes.ph20),
                  RichText(
                    text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: Theme.of(context).textTheme.labelMedium,
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
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomElevatedButton(
                    label: 'Continue With Google',
                    icon: 'assets/images/google_icon.svg',
                    backgroundColor: LightColors.buttonTextColor,
                  ),
                  SizedBox(height: AppSizes.ph20),
                  CustomElevatedButton(
                    isFacebook: true,
                    label: 'Continue With Facebook',
                    icon: 'assets/images/facebook_icon.svg',
                    backgroundColor: Color(0xFF4267B2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
