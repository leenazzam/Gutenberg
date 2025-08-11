import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg/models/solutions_model.dart';
import 'package:gutenberg/pages/desc.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/navigations.dart';

class SolutionsPage extends StatefulWidget {
  const SolutionsPage({super.key});

  @override
  State<SolutionsPage> createState() => _SolutionsPageState();
}

class _SolutionsPageState extends State<SolutionsPage> {
  void getSolutions() async {
    Dio dio = Dio();
    Response res = await dio.get(
      'https://gutenberg-server-production.up.railway.app/api/solution',
    );
    setState(() {
      solutions = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSolutions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColor.background,
        title: Text('Solutions', style: getTitleStyle()),
        centerTitle: true,
      ),
      body: solutions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                shrinkWrap: true,
                itemCount: solutions.length,
                itemBuilder: (context, index) {
                  var solution = solutions[index];
                  var base64Image = solution['image'].split(',').last;

                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        pushTO(context, Desc(Item: solution));
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              ClipOval(
                                child: Image.memory(
                                  base64Decode(base64Image),
                                  fit: BoxFit.cover,
                                  width: 240,
                                  height: 240,
                                ),
                              ), // Decode Base64 string to display the image

                              SizedBox(height: 20),
                              Text(
                                solution['title'],
                                style: getTitleStyle(fontSize: 30),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
