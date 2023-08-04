import 'package:flutter/material.dart';
import 'package:instapound/src/core/utils/app_colors.dart';

class SearchFieldBar extends StatelessWidget {
  const SearchFieldBar({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
      child: Container(
        width: double.infinity,
        height: 36,
        decoration: ShapeDecoration(
          color: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
