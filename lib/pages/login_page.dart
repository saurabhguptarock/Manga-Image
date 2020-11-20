import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:image/pages/home_page.dart';
import 'dart:async';
import 'package:vibration/vibration.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool _canVibrate = false;

  void checkVibration() async {
    if (await Vibration.hasVibrator()) {
      setState(() {
        _canVibrate = true;
      });
    }
  }

  @override
  void initState() {
    checkVibration();
    super.initState();
  }

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
        passwordEnteredCallback: (enteredPassword) async {
          bool isValid = '789456123' == enteredPassword;
          _verificationNotifier.add(isValid);
          if (_canVibrate && !isValid) await Vibration.vibrate();
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
