// ignore_for_file: unnecessary_string_escapes

import 'package:agro_soy/login/reset_View.dart';
import 'package:agro_soy/login/signUp_view.dart';
import 'package:agro_soy/login/simple_ui_controller.dart';
import 'package:agro_soy/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleeUIController simpleUIController = Get.put(SimpleeUIController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(246, 247, 242, 1),
          resizeToAvoidBottomInset: false,
          body: _buildMainBody(size, simpleUIController)),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleeUIController simpleUIController,
  ) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          Center(
            child: size.width > 600
                ? Container()
                : Image.asset(
                    "assets/images/npklogo.png",
                    height: size.height * 0.24,
                    fit: BoxFit.fill,
                  ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Login',
              style: kLoginTitleStyle(size),
            ),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome Back Farmer',
              style: kLoginSubtitleStyle(size),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// username or Gmail
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: ' Gmail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
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

                  /// password
                  Obx(
                    () => TextFormField(
                      style: kTextFormFieldStyle(),
                      controller: passwordController,
                      obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: Icon(
                            simpleUIController.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isObscureActive();
                          },
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  /// Navigate To Login Screen
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        gestur(size, simpleUIController, const ResetPassword(),
                            " ", " Forget Password"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                    style: kLoginTermsAndPrivacyStyle(size),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Login Button
                  loginButton(size),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  gestur(size, simpleUIController, const SignUpView(),
                      "Don\'t have an account", " Sign up"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gestur(Size size, SimpleeUIController simpleUIController, Widget page,
      String text1, String text2) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (ctx) => page));
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        _formKey.currentState?.reset();
        simpleUIController.isObscure.value = true;
      },
      child: RichText(
        text: TextSpan(
          text: text1,
          style: kHaveAnAccountStyle(size),
          children: [
            TextSpan(
              text: text2,
              style: kLoginOrSignUpTextStyle(
                size,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Login Button
  Widget loginButton(Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.065,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff009889)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // ... Navigate To your Home Page
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const navbar()));
                });
              } on FirebaseAuthException catch (e) {
                showNotification(context, e.message.toString());
              }
            }
          },
          child: Text(
            'Login',
            style: kTextlogin(),
          )),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xff009889),
        content: Text(
          message.toString(),
          style: const TextStyle(fontSize: 15),
        )));
  }
}
