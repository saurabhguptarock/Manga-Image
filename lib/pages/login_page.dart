import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:image/pages/home_page.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasscodeScreen(
        isValidCallback: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        ),
        shouldTriggerVerification: _verificationNotifier.stream,
        title: Text(
          'Enter APP Passcode',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        passwordDigits: 9,
        passwordEnteredCallback: (enteredPassword) {
          bool isValid = '789456123' == enteredPassword;
          _verificationNotifier.add(isValid);
        },
        cancelButton: FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        deleteButton: FlatButton(
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
