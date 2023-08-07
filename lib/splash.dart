// ignore_for_file: camel_case_types

import 'package:agro_soy/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Image(
            image: AssetImage("assets/images/npklogo.png"),
            width: 200,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SpinKitWaveSpinner(
            duration: const Duration(milliseconds: 4000),
            trackColor: const Color.fromARGB(255, 184, 240, 235),
            waveColor: const Color.fromRGBO(101, 145, 0, 1),
            color: const Color.fromRGBO(101, 145, 0, 1),
            size: size.height * 0.08,
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Image(
            image: const AssetImage("assets/images/splash.png"),
            width: size.width * 0.9,
          ),
        ],
      )),
    );
  }
}
