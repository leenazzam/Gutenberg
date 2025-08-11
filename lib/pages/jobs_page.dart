import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg/models/job_model.dart';
import 'package:gutenberg/pages/apply_page.dart';
import 'package:gutenberg/pages/desc.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/core/format.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/coustom/footer.dart';
import 'package:gutenberg/widgets/navigations.dart';
import 'package:intl/intl.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  void getjobs() async {
    Dio dio = Dio();
    Response res = await dio.get(
      'https://gutenberg-server-production.up.railway.app/api/job',
    );
    setState(() {
      jobs = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getjobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text('Jobs', style: getTitleStyle()),
      ),

      body: jobs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      shrinkWrap: true,
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        var job = jobs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    job['title'],
                                    style: getTitleStyle(fontSize: 30),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    job['description'],
                                    style: getBodyStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                  coustom_botton(
                                    txtcolor: AppColor.background,
                                    color: AppColor.pp,
                                    icon: Icon(
                                      Icons.send,
                                      color: AppColor.background,
                                    ),
                                    title: 'Apply',
                                    onTap: () {
                                      pushTO(context, ApplyPage(Job: job));
                                    },
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Posted: ',
                                              style: getSmallStyle(
                                                txtcolor: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              formatDate(job['postedDate']),
                                              style: getSmallStyle(
                                                txtcolor: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Deadline:',
                                              style: getSmallStyle(
                                                txtcolor: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              formatDate(job['deadline']),
                                              style: getSmallStyle(
                                                txtcolor: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  footer(),
                ],
              ),
            ),
    );
  }
}
