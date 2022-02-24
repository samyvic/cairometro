import 'dart:ui';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:registerion/email_field_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Appِ',
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  String title = 'Country Code Picker';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

enum SingingCharacter { Male, Female }

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  late DateTime _dateTime;
  SingingCharacter? _character = SingingCharacter.Male;
  bool _secureText = true;
  bool _secureText2 = true;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat.yMMMd().format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat.yMMMd().format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name'),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  EmailFieldWidget(controller: emailController),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              prefixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.security
                                    : Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password'),
                          obscureText: _secureText,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              prefixIcon: IconButton(
                                icon: Icon(_secureText2
                                    ? Icons.security
                                    : Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    _secureText2 = !_secureText2;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Re-Enter Password'),
                          obscureText: _secureText2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Expanded(
                          child: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'EG',
                            favorite: ['+39', 'FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mobile Number'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date Of Birth'),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        color: Colors.grey[300],
                        onPressed: () {
                          SfDateRangePicker(
                            onSelectionChanged: _onSelectionChanged,
                            selectionMode: DateRangePickerSelectionMode.range,
                            initialSelectedRange: PickerDateRange(
                              DateTime.now().subtract(const Duration(days: 4)),
                              DateTime.now().add(
                                const Duration(days: 3),
                              ),
                            ),
                          );
                        },
                        child: Text('Choose'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //  GENDER PART

                  Row(
                    children: [
                      Text('GENDER :', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: ListTile(
                          title: const Text('Male',
                              style: TextStyle(fontSize: 14)),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Female',
                              style: TextStyle(fontSize: 14)),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    color: Colors.grey[300],
                    onPressed: () {
                      final form = formKey.currentState!;
                      if (form.validate()) {
                        final email = emailController.text;
                      }
                    },
                    child: Text('Create', style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
