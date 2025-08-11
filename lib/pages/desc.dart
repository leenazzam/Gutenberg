import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/text_container.dart';

class Desc extends StatefulWidget {
  final dynamic Item;
  const Desc({super.key, required this.Item});

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  @override
  Widget build(BuildContext context) {
    final item = widget.Item;
    var base64Image = item['image'].split(',').last;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColor.background,
        title: Text(item['title'], style: getTitleStyle()),
        centerTitle: true,
      ),
      body: item == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.memory(
                        base64Decode(base64Image),
                        fit: BoxFit.fill,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    TextContainer(
                      title: 'Description',
                      text: item['description'],
                    ),
                    TextContainer(title: 'Informations'),
                  ],
                ),
              ),
            ),
    );
  }
}
