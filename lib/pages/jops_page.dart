import 'package:flutter/material.dart';
import 'package:gutenberg/pages/apply_page.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/navigations.dart';
import 'package:intl/intl.dart';

class JopsPage extends StatefulWidget {
  const JopsPage({super.key});

  @override
  State<JopsPage> createState() => _JopsPageState();
}

class _JopsPageState extends State<JopsPage> {
  String? selectedService;
  var dateController = TextEditingController(
    text: DateFormat('dd/MM/yyy').format(DateTime.now()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: coustom_botton(
          title: 'Apply Now',
          onTap: () {
            pushTO(context, ApplyPage());
          },
          icon: Icon(Icons.send, color: AppColor.background),
        ),
      ),
    );
  }
}
