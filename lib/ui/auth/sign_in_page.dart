import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/gen/assets.gen.dart';
import 'package:keretaapp/ui/app_theme.dart';
import 'package:keretaapp/ui/app_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xffa52b2a), Color(0xffa52a65)])),
                padding:
                    EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 0, bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Assets.images.letservis.image(height: 180),
                          Text('Welcome',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .fontSize,
                                  fontWeight: FontWeight.bold)),
                          Text('Login to your account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .fontSize,
                                  fontWeight: FontWeight.w100)),
                          Container(
                            padding: EdgeInsets.only(top: 16.0),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .fontSize,
                                    ),
                                    children: [
                                  TextSpan(
                                      text: 'Don\'t have an account yet? '),
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          color: accentColor,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(Constants.pageSignUp);
                                        }),
                                ])),
                          )
                        ],
                      ),
                    ),
                    LoginForm()
                  ],
                ),
              )),
        ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Form(
          child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.all(16.0)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) =>
                    val.length > 0 ? 'Password too short.' : null,
                decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(16.0),
                    filled: true,
                    fillColor: Colors.grey[200])),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
                onPressed: () => context
                    .read(appViewModelProvider)
                    .signIn(usernameController.text, passwordController.text),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child:
                      Text('Login In', style: TextStyle(color: Colors.white)),
                )),
          )
        ],
      )),
    );
  }
}
