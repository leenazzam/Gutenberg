import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class social extends StatelessWidget {
  const social({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.indigo),
          onPressed: () {},
        ),

        IconButton(
          icon: Icon(Icons.mail_outline_outlined, color: Colors.red),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
          onPressed: () {
            launchUrl(Uri.parse('https://twitter.com/YourUsername'));
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.indigo),
          onPressed: () {},
        ),
      ],
    );
  }
}
