import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg/models/service_model.dart';
import 'package:gutenberg/pages/desc.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/navigations.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  void getServices() async {
    Dio dio = Dio();
    Response res = await dio.get(
      'https://gutenberg-server-production.up.railway.app/api/services',
    );
    setState(() {
      services = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColor.background,
        title: Text('Services', style: getTitleStyle()),
        centerTitle: true,
      ),
      body: services.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                shrinkWrap: true,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  var service = services[index];
                  var base64Image = service['image'].split(',').last;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        pushTO(context, Desc(Item: service));
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
                              ),
                              SizedBox(height: 20),
                              Text(
                                service['title'],
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
