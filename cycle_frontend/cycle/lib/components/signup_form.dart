import 'package:cycle/components/signup_form_components/email_field.dart';
import 'package:cycle/components/signup_form_components/first_name_field.dart';
import 'package:cycle/components/signup_form_components/last_name_field.dart';
import 'package:cycle/components/signup_form_components/password_field.dart';
import 'package:cycle/components/signup_form_components/password_repeat_field.dart';
import 'package:flutter/material.dart';

/// Form for a sign-up.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  // Global key that uniquely identifies the SignUpForm widget.
  final _formKey = GlobalKey<FormState>();

  // Controllers that keep track of the user's input.
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          FirstNameField(firstNameController),
          LastNameField(lastNameController),
          EmailField(emailController),
          PasswordField(passwordController),
          PasswordRepeatField(passwordController, repeatPasswordController),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                //_formKey.currentState.save();
                // SAVE TO A DATABASE
                print(firstNameController.text);
                print(lastNameController.text);
                print(emailController.text);
                print(passwordController.text);
                print(repeatPasswordController.text);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
