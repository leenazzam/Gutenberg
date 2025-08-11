import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/coustom/social.dart';

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 9, 1, 50)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Folow Us :',
              style: getBodyStyle(txtcolor: AppColor.background),
            ),
            social(),

            Divider(thickness: 0.3, endIndent: 20, indent: 20),
            Center(
              child: Text(
                '© Gutenberg Company for information\n Technology',
                textAlign: TextAlign.center,
                style: getSmallStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
