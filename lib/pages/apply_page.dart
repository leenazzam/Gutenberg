import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg/models/service_model.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/contact_service.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/coustom/footer.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:open_file/open_file.dart';

class ApplyPage extends StatefulWidget {
  final dynamic Job;
  const ApplyPage({super.key, required this.Job});

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  FilePickerResult? res;
  PlatformFile? file;
  var nameController = TextEditingController();
  var noteController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  PhoneNumber phoneNumber = PhoneNumber(
    isoCode: 'PS',
  ); // رمز الدولة الافتراضي، Palestine مثلاً
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final job = widget.Job;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Application Form', style: getTitleStyle()),
        backgroundColor: AppColor.background,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Job Application: ${job['title']}',

                        style: getBodyStyle(txtcolor: Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 232, 231, 241),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                'Please fill out the form below to submit your job application.',

                                style: getBodyStyle(
                                  txtcolor: AppColor.secondary,
                                ),
                              ),
                              SizedBox(height: 10),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                controller: nameController,
                                decoration: InputDecoration(
                                  label: Text('Full Name*'),
                                  hint: Text('Enter your full name'),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: Text('Email*'),
                                  hint: Text('example@email.com'),
                                ),
                              ),

                              SizedBox(height: 30),
                              InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  phoneNumber = number;
                                },
                                selectorConfig: SelectorConfig(
                                  //selector= area code
                                  selectorType: PhoneInputSelectorType.DROPDOWN,
                                ),
                                initialValue: phoneNumber,
                                textFieldController: phoneController,
                                formatInput: true,
                                inputDecoration: InputDecoration(
                                  labelText: 'Phone Number',
                                ),
                              ),

                              SizedBox(height: 30),

                              TextFormField(
                                controller: noteController,
                                maxLines: 6,
                                decoration: InputDecoration(
                                  label: Text('Cover Letter (Optional)'),
                                ),
                              ),
                              SizedBox(height: 30),
                              file != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Selected file: ${file!.name}'),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              file = null;
                                              res = null;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'No resume selected',
                                      style: TextStyle(color: Colors.red),
                                    ),
                              SizedBox(height: 10),

                              ElevatedButton.icon(
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles();

                                  if (result != null) {
                                    setState(() {
                                      res = result;
                                      file = result.files.first;
                                    });
                                    openfile(file!);
                                  }
                                },
                                icon: Icon(Icons.upload_file),
                                label: Text('Upload Resume'),
                              ),
                              SizedBox(height: 30),

                              coustom_botton(
                                color: AppColor.secondary,
                                title: "Send",
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                ),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (file == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please upload your resume',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  void openfile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
