import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Services/auth.dart';

class RegisterForm extends StatefulWidget {
  final paddingTopForm,
      fontSizeTextField,
      fontSizeTextFormField,
      spaceBetweenFields,
      iconFormSize;
  final spaceBetweenFieldAndButton,
      widthButton,
      fontSizeButton,
      fontSizeForgotPassword,
      fontSizeSnackBar,
      errorFormMessage;

  const RegisterForm(
      this.paddingTopForm,
      this.fontSizeTextField,
      this.fontSizeTextFormField,
      this.spaceBetweenFields,
      this.iconFormSize,
      this.spaceBetweenFieldAndButton,
      this.widthButton,
      this.fontSizeButton,
      this.fontSizeForgotPassword,
      this.fontSizeSnackBar,
      this.errorFormMessage);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: widthSize * 0.05,
                  right: widthSize * 0.05,
                  top: heightSize * widget.paddingTopForm),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email',
                          style: TextStyle(
                              fontSize: widthSize * widget.fontSizeTextField,
                              fontFamily: 'Poppins',
                              color: Colors.white))),
                  TextFormField(
                      controller: _emailController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required Field!';
                        }
                      },
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        labelStyle: const TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: widthSize * widget.errorFormMessage),
                        prefixIcon: Icon(
                          Icons.person,
                          size: widthSize * widget.iconFormSize,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontSizeTextFormField)),
                  SizedBox(height: heightSize * widget.spaceBetweenFields),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Username',
                          style: TextStyle(
                              fontSize: widthSize * widget.fontSizeTextField,
                              fontFamily: 'Poppins',
                              color: Colors.white))),
                  TextFormField(
                      controller: _userNameController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required Field!';
                        }
                      },
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        labelStyle: const TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: widthSize * widget.errorFormMessage),
                        prefixIcon: Icon(
                          Icons.person,
                          size: widthSize * widget.iconFormSize,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontSizeTextFormField)),
                  SizedBox(height: heightSize * widget.spaceBetweenFields),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: widthSize * widget.fontSizeTextField,
                              fontFamily: 'Poppins',
                              color: Colors.white))),
                  TextFormField(
                      controller: _passwordController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required Field!';
                        }
                      },
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        labelStyle: const TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: widthSize * widget.errorFormMessage),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: widthSize * widget.iconFormSize,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontSizeTextFormField)),
                  SizedBox(
                      height: heightSize * widget.spaceBetweenFieldAndButton),
                  // ignore: deprecated_member_use
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(
                          widget.widthButton, 15, widget.widthButton, 15),
                      color: Colors.white,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await Authentication().registerWithEmail(
                            email: _emailController.text,
                            userName: _userNameController.text,
                            password: _passwordController.text,
                            context: context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: widthSize * widget.fontSizeButton,
                              fontFamily: 'Poppins',
                              color: Colors.black))),
                  SizedBox(height: heightSize * 0.02),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize:
                                widthSize * widget.fontSizeForgotPassword * 1.3,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Poppins',
                                  fontSize: widthSize *
                                      widget.fontSizeForgotPassword *
                                      1.3,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
