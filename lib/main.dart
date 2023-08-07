import 'package:agro_soy/cubit/bloc_observer.dart';
import 'package:agro_soy/firebase_options.dart';
import 'package:agro_soy/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          splash(), //(title: 'Flutter Demo Home Page'),//MyHome(title: 'Flutter Demo Home Page'),
      //navbar(),
    );
  }
}
