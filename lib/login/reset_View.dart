// ignore_for_file: file_names, library_private_types_in_public_api, sized_box_for_whitespace, avoid_print
import 'package:agro_soy/constants.dart';
import 'package:agro_soy/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 242, 1),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: const Text(
          "Back",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: const Color.fromRGBO(246, 247, 242, 1),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Reset Password',
                    style: kLoginTitleStyle(size),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Enter the Gmail with your account and we`ll send an email with instrutions to reset your password.',
                    style: kresetStyle(size),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: ' Gmail',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: emailController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter gmail';
                            } else if (!value.endsWith('@gmail.com')) {
                              return 'please enter valid gmail';

                              //if (value == null || value.isEmpty) {
                              //  return 'Please enter username';
                              // } else if (value.length < 4) {
                              //  return 'at least enter 4 characters';
                              // } else if (value.length > 13) {
                              //  return 'maximum character is 13';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff009889)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // ... Navigate To your Home Page
                                  FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: emailController.text)
                                      .then((value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginView()));
                                  }).onError((error, stackTrace) {
                                    print("Error ${error.toString()}");
                                  });
                                }
                              },
                              child: Text(
                                'Reset Password',
                                style: kTextlogin(),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
