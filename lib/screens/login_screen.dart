import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_uzair/rounded_button.dart';
import 'package:flash_chat_uzair/constants.dart';
import 'package:flash_chat_uzair/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool Spinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: ModalProgressHUD(
        inAsyncCall: Spinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter you Password'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                onPress: () async {
                  setState(() {
                    Spinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email.trim(), password: password.trim());
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      Spinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                buttonTitle: 'Login',
              ),
              const SizedBox(
                height: 12.0,
              ),
              RoundedButton(
                  color: Colors.grey,
                  onPress: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: 'Go Back')
            ],
          ),
        ),
      ),
    );
  }
}
