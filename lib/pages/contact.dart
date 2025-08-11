import 'package:flutter/material.dart';
import 'package:gutenberg/models/service_model.dart';
import 'package:gutenberg/widgets/core/app_color.dart';
import 'package:gutenberg/widgets/core/contact_service.dart';
import 'package:gutenberg/widgets/core/fonts.dart';
import 'package:gutenberg/widgets/coustom/coustom_botton.dart';
import 'package:gutenberg/widgets/coustom/footer.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phonenumbers/phonenumbers.dart' hide PhoneNumber;

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String? selectedService;

  //Tap1
  var nameControllerTap1 = TextEditingController();
  var noteControllerTap1 = TextEditingController();
  var emailControllerTap1 = TextEditingController();
  var formKeyTap1 = GlobalKey<FormState>();
  var dateControllerTap1 = TextEditingController(
    text: DateFormat('dd/MM/yyy').format(DateTime.now()),
  );
  var timeControllerTap1 = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  //Tap2
  var nameControllerTap2 = TextEditingController();
  var noteControllerTap2 = TextEditingController();
  var emailControllerTap2 = TextEditingController();
  var phoneControllerTap2 = PhoneNumberEditingController();
  PhoneNumber phoneNumber = PhoneNumber(
    isoCode: 'PS',
  ); // رمز الدولة الافتراضي، Palestine مثلاً
  var phoneControllerTap22 = TextEditingController();

  var formKeyTap2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: AppColor.secondary,
            labelColor: AppColor.background2,
            unselectedLabelColor: AppColor.grey,
            tabs: [
              Tab(text: 'Book Free Call', icon: Icon(Icons.call)),
              Tab(text: 'Contact Form', icon: Icon(Icons.email)),
            ],
          ),
          title: Text('Contact Us', style: getTitleStyle()),
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColor.background,
        ),
        backgroundColor: AppColor.background,

        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKeyTap1,
                      child: Column(
                        children: [
                          SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 232, 231, 241),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Still not sure what you need?',
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
                                    controller: nameControllerTap1,
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
                                    controller: emailControllerTap1,
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
                                            ? dateControllerTap1.text =
                                                  DateFormat(
                                                    'dd/MM/yyy',
                                                  ).format(onValue)
                                            : null;
                                      });
                                    },

                                    controller: dateControllerTap1,
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
                                            ? timeControllerTap1.text = onValue
                                                  .format(context)
                                            : null;
                                      });
                                    },
                                    controller: timeControllerTap1,
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
                                    controller: noteControllerTap1,
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
                                      if (formKeyTap1.currentState!
                                          .validate()) {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
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
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
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
                        ],
                      ),
                    ),
                  ),
                  footer(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 232, 231, 241),
                            ),
                            child: Form(
                              key: formKeyTap2,
                              child: Column(
                                children: [
                                  Text(
                                    'Reach out to us — we’re here to help.',

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
                                    controller: nameControllerTap2,
                                    decoration: InputDecoration(
                                      label: Text('Full Name*'),
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
                                    controller: emailControllerTap2,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      label: Text('Email*'),
                                    ),
                                  ),

                                  SizedBox(height: 30),
                                  InternationalPhoneNumberInput(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      }
                                      final isValid = true;
                                      // ignore: dead_code
                                      if (!isValid) {}
                                      return null;
                                    },
                                    autoValidateMode: AutovalidateMode.disabled,
                                    onInputChanged: (PhoneNumber number) {
                                      phoneNumber = number;
                                    },
                                    selectorConfig: SelectorConfig(
                                      //selector= area code
                                      selectorType:
                                          PhoneInputSelectorType.DROPDOWN,
                                    ),
                                    initialValue: phoneNumber,
                                    textFieldController: phoneControllerTap22,
                                    formatInput: true,
                                    inputDecoration: InputDecoration(
                                      labelText: 'Phone Number',
                                    ),
                                  ),

                                  SizedBox(height: 30),

                                  DropdownButtonFormField<String>(
                                    value: selectedService,
                                    decoration: InputDecoration(
                                      label: Text('Select a Service'),
                                    ),
                                    items: services.isNotEmpty
                                        ? services.map((service) {
                                            return DropdownMenuItem<String>(
                                              value: service['title'],
                                              child: Text(service['title']),
                                            );
                                          }).toList()
                                        : [],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedService = value;
                                      });
                                    },
                                    validator: (value) => value == null
                                        ? 'Please select a service'
                                        : null,
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your massege';
                                      }
                                      return null;
                                    },
                                    controller: noteControllerTap2,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      label: Text('Message*'),
                                    ),
                                  ),
                                  SizedBox(height: 60),

                                  coustom_botton(
                                    color: AppColor.secondary,
                                    title: "Send",
                                    icon: const Icon(
                                      Icons.send_rounded,
                                      color: Colors.white,
                                    ),
                                    onTap: () async {
                                      if (formKeyTap2.currentState!
                                          .validate()) {
                                        bool success =
                                            await ContactService.sendContactForm(
                                              name: nameControllerTap2.text,
                                              email: emailControllerTap2.text,
                                              phone:
                                                  phoneNumber.phoneNumber ?? '',
                                              service: selectedService ?? '',
                                              message: noteControllerTap2.text,
                                            );

                                        if (success) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                'Message sent successfully!',
                                              ),
                                            ),
                                          );
                                          formKeyTap2.currentState!.reset();
                                          setState(() {
                                            selectedService = null;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                'Failed to send message. Please try again later.',
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please fill all required info!',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
