import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const EmailFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailFieldWidgetState createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'Email Adress',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email)),
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? 'Enter a valid email'
          : null,
    );
  }
}
