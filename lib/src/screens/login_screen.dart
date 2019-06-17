import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
    createState(){
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }
  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-mail Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
      email = value;
      },
    );
  }
  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'More Than 4 Char',
      ),
      validator: validatePassword,
      onSaved: (String value) {
      password = value;
      },
    );
  }
  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit!'),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if(formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time To post $email and $password to API');
        }
      },
    );
  }
}