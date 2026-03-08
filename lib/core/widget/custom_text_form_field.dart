import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
    required this.validator,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String title;
  final Function(String? value) validator;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: AppSizes.ph12),
        TextFormField(
          controller: widget.controller,
          validator: (value) => widget.validator(value),
          obscureText: widget.isPassword && !_isVisible,
          obscuringCharacter: '*',
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon:
                          _isVisible
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                    )
                    : null,
            errorStyle: TextStyle(fontSize: AppSizes.sp14),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            filled: true,
            fillColor: LightColors.surfaceColor,
          ),
        ),
      ],
    );
  }
}
