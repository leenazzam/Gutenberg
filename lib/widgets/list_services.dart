import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';

class list_services extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onTap;

  const list_services({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250,
        child: GestureDetector(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.3 * 255).toInt()),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],

              color: AppColor.pp,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 44, 195),
                  Color.fromARGB(255, 61, 73, 162),
                  Color(0xff4c14f0),
                ],
                stops: [0, 0.5, 1],
                begin: Alignment(-1.4, -1.1),
                end: Alignment(1.3, 0.4),
              ),

              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(icon, size: 50, color: AppColor.background),
                  Text(
                    title,
                    style: getTitleStyle(txtcolor: AppColor.background),
                  ),
                  Text(
                    subTitle,
                    style: getBodyStyle(txtcolor: AppColor.background),
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
