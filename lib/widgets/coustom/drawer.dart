import 'package:flutter/material.dart';
import 'package:gutenberg/pages/contact.dart';
import 'package:gutenberg/pages/home_page.dart';
import 'package:gutenberg/pages/jops_page.dart';
import 'package:gutenberg/pages/services_page.dart';
import 'package:gutenberg/pages/solutions_page.dart';
import 'package:gutenberg/widgets/coustom/logo.dart';
import 'package:gutenberg/widgets/navigations.dart';

class coustomDrawer extends StatelessWidget {
  const coustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(),
            ListView(
              shrinkWrap: true,
              children: [
                ExpansionTile(
                  title: Text('HOME'),

                  children: [
                    ListTile(
                      title: Text('ABOUT US'),
                      onTap: () {
                        pushTO(context, HomePage());
                      },
                    ),
                    ListTile(
                      title: Text('CONTACT US'),
                      onTap: () {
                        pushTO(context, ContactUs());
                      },
                    ),
                  ],
                ),

                ListTile(
                  title: Text('SERVICES'),
                  onTap: () {
                    pushTO(context, ServicesPage());
                  },
                ),
                ListTile(
                  title: Text('SOLUTIONS'),
                  onTap: () {
                    pushTO(context, SolutionsPage());
                  },
                ),
                ListTile(
                  title: Text('JOBS'),
                  onTap: () {
                    pushTO(context, JopsPage());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
