// ignore_for_file: camel_case_types

import 'package:agro_soy/cubit/cubit.dart';
import 'package:agro_soy/page/graph.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'page/home.dart';
import 'page/tabel.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;
  final page = [
    tabel(),
    home(),
    graph(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(IconData(0xe63a, fontFamily: 'MaterialIcons'),
          size: 30, color: Colors.white),
      const Icon(Icons.home, size: 50, color: Colors.white),
      const Icon(IconData(0xe33f, fontFamily: 'MaterialIcons'),
          size: 30, color: Colors.white),
    ];
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getData(),
        child: Scaffold(
          body: page[index],
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationkey,
            items: items,
            index: index,
            height: 55,
            color: const Color.fromRGBO(0, 152, 137, 1),
            backgroundColor: kbackground,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) => setState(() => this.index = index),
          ),
        ));
  }
}
