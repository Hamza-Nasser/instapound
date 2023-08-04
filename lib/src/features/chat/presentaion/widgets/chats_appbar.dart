import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instapound/src/core/utils/app_assets.dart';
import 'package:instapound/src/core/utils/app_colors.dart';
import 'package:instapound/src/core/utils/widgets/circle.dart';
import 'package:instapound/src/core/utils/widgets/general_appbar.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatsAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return GeneralAppBar(
      content: const Text(
        'Chats',
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 22,
          height: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Circle(
        child: Image.asset(AppAssets.placeholder),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 10),
          child: SvgPicture.asset(
            AppAssets.write,
            height: 36,
          ),
        ),
      ],
    );
  }
}

class SliverChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SliverChatsAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return const SliverGeneralAppBar(
      content: Text(
        'Chats',
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 22,
          height: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Circle(
        color: AppColors.grey,
        child: Icon(
          Icons.menu,
          color: AppColors.secondary,
          size: 20,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: Circle(
            radius: 18,
            color: AppColors.grey,
            child: Icon(Icons.camera_alt, color: AppColors.secondary, size: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16, top: 10),
          child: Circle(
            radius: 18,
            color: AppColors.grey,
            child: Icon(Icons.edit, color: AppColors.secondary, size: 20),
          ),
        ),
      ],
    );
  }
}
