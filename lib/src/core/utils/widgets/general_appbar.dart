import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instapound/src/core/utils/app_colors.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    super.key,
    this.content,
    this.leading,
    this.actions,
  });
  final Widget? content;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: content ??
          const Text(
            "Instapound",
            style: TextStyle(color: AppColors.secondary),
          ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10),
        child: leading,
      ),
      // leadingWidth: 80,
      actions: actions,
      backgroundColor: AppColors.primary,
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
    );
  }
}

class SliverGeneralAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SliverGeneralAppBar({
    super.key,
    this.content,
    this.leading,
    this.actions,
  });
  final Widget? content;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 70,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: content ??
          const Text(
            "Instapound",
            style: TextStyle(color: AppColors.secondary),
          ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10),
        child: leading,
      ),
      // leadingWidth: 80,
      actions: actions,
      backgroundColor: AppColors.primary,
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
    );
  }
}
