import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';

class TextContainer extends StatelessWidget {
  final String? text;
  final String title;
  final Widget? widget;

  const TextContainer({super.key, this.text, required this.title, this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.3 * 255).toInt()),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          color: AppColor.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(width: 2, height: 60, color: AppColor.pp),
                SizedBox(width: 10),

                Text(title, style: getTitleStyle(txtcolor: AppColor.pp)),
              ],
            ),
            SizedBox(height: 10),
            if (text != null)
              Text(
                text!,
                style: TextStyle(fontSize: 18, color: AppColor.background2),
              ),

            if (widget != null) widget!,
          ],
        ),
      ),
    );
  }
}
