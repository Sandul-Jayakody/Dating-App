import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_textfeild.dart';
import 'package:dating_app/views/forgot_password.dart';
import 'package:dating_app/views/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Sign in to continue!",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
              ),
              Center(
                  child: Image.asset(
                'assets/images/login_img.png',
                width: 250,
                height: 250,
              )),
              CustomTextfeild(
                controller: _email,
                lbltxt: "Email ID",
                isObscure: false,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextfeild(
                controller: _password,
                lbltxt: "Password",
                isObscure: true,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot password",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                name: "Login",
                function: () {
                  // print(
                  // _email.text,
                  // );
                  if (_validateFields()) {
                    print('validated');
                  } else {
                    print('not validated');
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I'm a new user ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validateFields() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

class CustomTextfeild extends StatelessWidget {
  final String lbltxt;
  final bool isObscure;
  final TextEditingController controller;

  CustomTextfeild({
    this.lbltxt,
    this.isObscure,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          labelText: lbltxt,
          labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
        ));
  }
}
