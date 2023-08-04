import 'package:flutter/material.dart';
import 'package:instapound/src/core/utils/app_colors.dart';

class InputFormField extends StatefulWidget {
  const InputFormField(
      {super.key,
      this.decoration,
      this.controller,
      this.hintText,
      this.focusNode});
  final InputDecoration? decoration;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  // final FocusNode widget.focusNode? = FocusNode();
  Color _fillColor = AppColors.formFieldFillColor;
  final Color _hintTextColor = AppColors.formFieldHintTextColor;
  late bool isDarkMode;

  // final FocusNode _passwordFocus = FocusNode();
  // final Color _fillColorPassword = AppColors.formFieldFillColor;
  @override
  void initState() {
    super.initState();
    // var brightness =
    //     SchedulerBinding.instance.platformDispatcher.platformBrightness;
    // isDarkMode = brightness == Brightness.dark;
    // initialize(isDarkMode);
    initialize();
  }

  void initialize() {
    // if (isDarkMode) {
    //   _fillColor = AppColors.formFieldFillColorDark;
    //   _hintTextColor = AppColors.formFieldHintTextColorDark;
    //   setState(() {});
    // } else {
    //   _fillColor = AppColors.formFieldFillColor;
    //   _hintTextColor = AppColors.formFieldHintTextColor;
    //   setState(() {});
    // }

    if (widget.focusNode != null) {
      // widget.focusNode = FocusNode();
      widget.focusNode!.addListener(() {
        if (widget.focusNode!.hasFocus) {
          // if (isDarkMode) {
          //   _fillColor = AppColors.formFieldFillColorDarkFocus;
          //   setState(() {});
          // } else {
          _fillColor = AppColors.formFieldFillColorFocus;
          // _fillColor = Colors.black;
          setState(() {});
          // }
        } else {
          // if (isDarkMode) {
          //   _fillColor = AppColors.formFieldFillColorDark;
          //   setState(() {});
          // } else {
          _fillColor = AppColors.formFieldFillColor;
          // _fillColor = Colors.black;
          setState(() {});
          // }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        // onTapOutside: (d) => FocusScope.of(context).unfocus,
        onTapOutside: (event) {
          if (widget.focusNode!.hasFocus) {
            widget.focusNode!.unfocus();
          }
        },
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: const TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
        // decoration: widget.decoration,
        decoration: InputDecoration(
          fillColor: _fillColor,
          filled: true,
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.only(
            left: 10,
          ),
          hintStyle: TextStyle(
            color: _hintTextColor,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
