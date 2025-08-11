import 'package:flutter/material.dart';
import 'package:gutenberg/pages/contact.dart';
import 'package:gutenberg/pages/jops_page.dart';
import 'package:gutenberg/pages/services_page.dart';
import 'package:gutenberg/pages/solutions_page.dart';
import 'package:gutenberg/widgets/text_container.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/coustom/coustom_app_bar.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/coustom/drawer.dart';
import 'package:gutenberg/widgets/coustom/footer.dart';
import 'package:gutenberg/widgets/list_services.dart';
import 'package:gutenberg/widgets/navigations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar(),
      endDrawer: coustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  transform: GradientRotation(2.83),
                  colors: [
                    Color.fromARGB(255, 8, 5, 96),
                    Color.fromARGB(255, 55, 21, 158),
                    Color.fromARGB(255, 50, 33, 163),
                  ],
                  stops: [0.0, 0.35, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Smart Software ",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background,
                        ),
                      ),
                      Text(
                        "Solutions for",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary2,
                        ),
                      ),
                      Text(
                        "Your Business",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),

                  Text(
                    "Leading provider of advanced B2B technology solutions.\nWe connect your business to the future.",
                    style: getSmallStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),

                  coustom_botton(
                    title: 'Contact Us',
                    onTap: () {
                      pushTO(context, ContactUs());
                    },
                  ),
                  SizedBox(height: 10),
                  TextContainer(
                    text:
                        'At Gutenberg, we are passionate about crafting digital experiences that make a difference. '
                        'With a team of creative designers, skilled developers, and dedicated strategists, '
                        'we deliver high-quality solutions in web development, mobile applications, and visual design. '
                        'Our mission is to empower businesses and individuals by bringing their ideas to life with innovation and care.',
                    title: 'About Us',
                  ),

                  SizedBox(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        list_services(
                          title: 'Services',
                          subTitle: 'Explore what we offer',
                          icon: Icons.design_services,
                          onTap: () {
                            pushTO(context, ServicesPage());
                          },
                        ),
                        list_services(
                          title: 'Solutions',
                          subTitle: 'Our Case Studies',
                          icon: Icons.lightbulb,
                          onTap: () {
                            pushTO(context, SolutionsPage());
                          },
                        ),
                        list_services(
                          title: 'Contact',
                          subTitle: 'Get in toutch with us',
                          icon: Icons.contact_mail,
                          onTap: () {
                            pushTO(context, ContactUs());
                          },
                        ),

                        list_services(
                          title: 'Jops',
                          subTitle: 'Join Our team',
                          icon: Icons.work,
                          onTap: () {
                            pushTO(context, JopsPage());
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            footer(),
          ],
        ),
      ),
    );
  }
}
