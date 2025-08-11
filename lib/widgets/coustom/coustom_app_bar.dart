import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/coustom/logo.dart';

class coustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const coustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.background,
      toolbarHeight: 85,
      title: Logo(),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
