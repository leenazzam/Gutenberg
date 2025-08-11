import 'package:flutter/material.dart';
import 'package:gutenberg/pages/home_page.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/navigations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      pushWithRep(context, HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/images/solution.png"),
            Text(
              'شركة جوتينبيرغ \nGutenberg Co.',
              style: TextStyle(
                color: AppColor.secondary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Smart Software Solutions for Your Businesses",
              style: getSmallStyle(txtcolor: AppColor.primary2, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
