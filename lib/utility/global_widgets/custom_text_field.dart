import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utility/theme/app_borders.dart';
import '../../utility/theme/color_style.dart';
import '../../utility/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  TextInputType? textInputType;
  int? fontSize;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool onlyNumber;
  bool passwordBool;
  Function(String)? onChanged;
  Function(String)? onSubmit;
  Function()? onTap;
  bool enabled;
  int? maxLength;
  TextInputAction action;
  int maxLines;
  String? initValue;
  String? label;

  CustomTextField(
      {this.label,
      this.initValue,
      this.action = TextInputAction.none,
      this.hintText = "",
      this.onChanged,
      this.textInputType,
      this.fontSize,
      required this.controller,
      this.validator,
      this.passwordBool = false,
      this.onlyNumber = false,
      this.onSubmit,
      this.onTap,
      this.enabled = true,
      this.maxLength,
      this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            children: [
              Text(label!, style: AppFontStyles.boldH4),
              const SizedBox(
                height: 0,
              ),
            ],
          ),
        TextFormField(
          maxLines: maxLines,
          enabled: enabled,
          onFieldSubmitted: onSubmit,
          initialValue: initValue,
          onTap: onTap,
          onChanged: onChanged,
          style: const TextStyle(color: AppColors.blackColor),
          inputFormatters: onlyNumber
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(maxLength),
                ]
              : <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(maxLength),
                ],
          validator: validator,
          controller: controller,
          obscureText: passwordBool,
          keyboardType: textInputType,
          cursorColor: AppColors.kMainColor100,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
            hintText: hintText,
            hintStyle: AppFontStyles.regularH4
                .copyWith(color: AppColors.kTextField2Grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                borderRadius: AppBorders.k8BorderRadius,
                borderSide: BorderSide(
                  color: AppColors.kGreyColor,
                )),
            disabledBorder: const OutlineInputBorder(
                borderRadius: AppBorders.k8BorderRadius,
                borderSide: BorderSide(
                  color: AppColors.kGreyColor,
                )),
            enabled: true,
            focusedBorder: const OutlineInputBorder(
                borderRadius: AppBorders.k8BorderRadius,
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.kGreyColor,
                )),
            border: const OutlineInputBorder(
                borderRadius: AppBorders.k8BorderRadius,
                borderSide: BorderSide(
                  color: AppColors.kGreyColor,
                )),
          ),
          textInputAction: action,
        ),
      ],
    );
  }
}
