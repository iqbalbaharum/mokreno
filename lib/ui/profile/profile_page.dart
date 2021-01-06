import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/ui/auth/signup_view_model.dart';
import 'package:keretaapp/ui/profile/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read(profileViewModelProvider).init();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          // IconButton(
          //     icon: const Icon(Icons.save), tooltip: 'SAVE', onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(
        text: context.read(profileViewModelProvider).username);
    final mobileController = TextEditingController(
        text: context.read(profileViewModelProvider).mobile);
    final emailController = TextEditingController(
        text: context.read(profileViewModelProvider).email);

    final _profileFormKey = GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.all(32),
      child: Form(
          key: _profileFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                readOnly: true,
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
                    readOnly: true,
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
                    readOnly: true,
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
                padding: EdgeInsets.only(top: 25.0),
                child: null,
              ),
            ],
          )),
    );
  }
}
