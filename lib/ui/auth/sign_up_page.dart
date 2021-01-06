import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/ui/auth/signup_view_model.dart';

import '../../constant.dart';
import '../app_theme.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 64),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xffa52b2a), Color(0xffa52a65)])),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText1.fontSize,
                          ),
                          children: [
                        TextSpan(
                            text:
                                'Already have an account. Please proceed to '),
                        TextSpan(
                            text: 'login',
                            style: TextStyle(
                                color: accentColor,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Constants.pageSignIn);
                              }),
                      ])),
                ),
                SignUpForm()
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final usernameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Form(
          key: _signUpFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                validator: (val) =>
                    val.isEmpty ? 'How do we address you?' : null,
                decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.all(16.0)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: TextFormField(
                    controller: emailController,
                    validator: (val) =>
                        val.isEmpty ? 'Insert your email add' : null,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        contentPadding: EdgeInsets.all(16.0),
                        filled: true,
                        fillColor: Colors.grey[200])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: TextFormField(
                    controller: mobileController,
                    validator: (val) =>
                        val.isEmpty ? 'Insert your mobile number' : null,
                    decoration: InputDecoration(
                        labelText: 'Mobile',
                        contentPadding: EdgeInsets.all(16.0),
                        filled: true,
                        fillColor: Colors.grey[200])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (val) =>
                        val.length < 4 ? 'Password too short.' : null,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        contentPadding: EdgeInsets.all(16.0),
                        filled: true,
                        fillColor: Colors.grey[200])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                    onPressed: () => {
                          if (_signUpFormKey.currentState.validate())
                            {
                              context.read(signUpViewModelProvider).signUp(
                                  usernameController.text,
                                  emailController.text,
                                  mobileController.text,
                                  passwordController.text)
                            }
                        },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                    )),
              )
            ],
          )),
    );
  }
}
