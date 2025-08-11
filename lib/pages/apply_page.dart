import 'package:flutter/material.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/coustom/footer.dart';
import 'package:intl/intl.dart';

class ApplyPage extends StatefulWidget {
  const ApplyPage({super.key});

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  var nameController = TextEditingController();
  var noteController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var dateController = TextEditingController(
    text: DateFormat('dd/MM/yyy').format(DateTime.now()),
  );
  var timeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meeting Form', style: getTitleStyle()),
        backgroundColor: AppColor.background,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10),

                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 232, 231, 241),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Welcome to the available job opportunities at Gutenberg!',
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
                                  label: Text('Full Name'),
                                  hint: Text('Enter your full name'),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  int atIndex = value.indexOf('@');
                                  if (atIndex == -1 ||
                                      atIndex == value.length - 1) {
                                    return 'Enter a valid email with text after "@"';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: Text('Email'),
                                  hint: Text('example@email.com'),
                                ),
                              ),
                              SizedBox(height: 30),

                              TextFormField(
                                readOnly: true,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2028),
                                  ).then((onValue) {
                                    onValue != null
                                        ? dateController.text = DateFormat(
                                            'dd/MM/yyy',
                                          ).format(onValue)
                                        : null;
                                  });
                                },

                                controller: dateController,
                                decoration: InputDecoration(
                                  label: Text('Meeting Date'),
                                ),
                              ),
                              SizedBox(height: 30),

                              TextFormField(
                                readOnly: true,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((onValue) {
                                    onValue != null
                                        ? timeController.text = onValue.format(
                                            context,
                                          )
                                        : null;
                                  });
                                },
                                controller: timeController,
                                decoration: InputDecoration(
                                  label: Text('Meeting Time'),
                                ),
                              ),
                              SizedBox(height: 30),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the meeting purpose';
                                  }
                                  return null;
                                },
                                controller: noteController,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  label: Text('Meeting Purpose'),
                                  helperText: 'Briefy describe the purpose',
                                ),
                              ),
                              SizedBox(height: 60),

                              coustom_botton(
                                title: "Book Free Call",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green,
                                        content: const Text(
                                          'Meeting booked successfully',
                                        ),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {},
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                          'Please fill all required info!',
                                        ),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {},
                                        ),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(Icons.call, color: Colors.white),
                                color: AppColor.secondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            footer(),
          ],
        ),
      ),
    );
  }
}
