import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';

class coustom_botton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? color;
  final Color? txtcolor;

  final Icon? icon;
  const coustom_botton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.icon,
    this.txtcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.pp,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: AppColor.pp),
        ),
      ),
      onPressed: () {
        onTap();
      },
      icon: icon,
      iconAlignment: IconAlignment.end,
      label: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: txtcolor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
