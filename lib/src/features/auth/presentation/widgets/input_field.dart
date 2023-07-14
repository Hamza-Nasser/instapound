import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        focusNode: focusNode,
        style: const TextStyle(
          fontSize: 14,
          height: 1.4,
          // color: AppColors.primary,
        ),
        decoration: decoration,
      ),
    );
  }
}
