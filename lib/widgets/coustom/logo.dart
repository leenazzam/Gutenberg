import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('lib/assets/images/solution.png', width: 80, height: 80),
        SizedBox(width: 5),
        Text(
          'شركة جوتينبيرغ \nGutenberg Co.',
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
