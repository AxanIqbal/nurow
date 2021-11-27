import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Register/register.dart';
import 'package:nurow/Services/auth.dart';

class LoginForm extends StatefulWidget {
  final double paddingTopForm,
      fontSizeTextField,
      fontSizeTextFormField,
      spaceBetweenFields,
      iconFormSize;
  final double spaceBetweenFieldAndButton,
      widthButton,
      fontSizeButton,
      fontSizeForgotPassword,
      fontSizeSnackBar,
      errorFormMessage;

  const LoginForm(
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
      this.errorFormMessage,
      {Key? key})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return isloading
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
                      controller: _usernameController,
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
                          return 'Required field!';
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
                          isloading = true;
                        });

                        await Authentication().signInWithEmail(
                            email: _usernameController.text,
                            password: _passwordController.text,
                            context: context);
                        setState(() {
                          isloading = false;
                        });
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: widthSize * widget.fontSizeButton,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize * 0.02),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: widthSize *
                                  widget.fontSizeForgotPassword *
                                  1.2,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register!',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Poppins',
                                  fontSize: widthSize *
                                      widget.fontSizeForgotPassword *
                                      1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                      )),
                  SizedBox(height: heightSize * 0.02),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize:
                              widthSize * widget.fontSizeForgotPassword * 1.2,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
