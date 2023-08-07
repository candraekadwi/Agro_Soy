// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:agro_soy/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInit());
  static AppCubit get(context) => BlocProvider.of(context);

  final database = FirebaseDatabase.instance.ref("Alat1");

  int N = 0;
  int P = 0;
  int K = 0;
  double PH = 0;
  int HUM = 0;
  String JARINGAN = "0";
  int BATTERY = 0;
  int BATTYPE = 0;
  int RSSI = 0;
  String PUMP = "0";

  late List<dynamic> dat_N;
  late String json;

  int itemCount = 60;
  List<double> data = [];
  List<String> time = [];
  Future getJson() async {
    emit(JsonGet());
    var url = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzvBH8hji3fWEJES78WZi-FC91uq20tuO_uqyop35ElWx0jmEVIDyxP-6WS33ibqps7/exec");
    json = await http.read(url).then((value) {
      dat_N = jsonDecode(value);
      itemCount = dat_N.length < 60 ? dat_N.length : 60;
      var dataUsed = dat_N.sublist(0, itemCount);
      data = [];
      time = [];
      dataUsed.forEach((element) {
        data.add((element['value'].toDouble()) / 100);
        time.add(element['date'].split('T')[1].substring(0, 5));
      });
      emit(JsonGot());
      return value;
    });
  }

  void getData() {
    emit(DataGet());
    database.child("N").onValue.listen((event) {
      N = int.parse(event.snapshot.value.toString());
      emit(DataGot());
    });
    database.child("P").onValue.listen((event) {
      P = int.parse(event.snapshot.value.toString());
      emit(DataGot());
    });
    database.child("K").onValue.listen((event) {
      K = int.parse(event.snapshot.value.toString());
      emit(DataGot());
    });
    database.child("ph").onValue.listen((event) {
      PH = double.parse(event.snapshot.value.toString());
      emit(DataGot());
    });
    database.child("hum").onValue.listen((event) {
      HUM = int.parse(event.snapshot.value.toString());
      emit(DataGot());
    });
    database.child("battery").onValue.listen((event) {
      BATTERY = (int.parse(event.snapshot.value.toString()));
      emit(DataGot());
    });
    database.child("battype").onValue.listen((event) {
      BATTYPE = (int.parse(event.snapshot.value.toString()));
      emit(DataGot());
    });
    database.child("jaringan").onValue.listen((event) {
      JARINGAN = event.snapshot.value.toString();
      emit(DataGot());
    });
    database.child("rssi").onValue.listen((event) {
      RSSI = (int.parse(event.snapshot.value.toString()));
      emit(DataGot());
    });
    database.child("pompa").onValue.listen((event) {
      PUMP = event.snapshot.value.toString();
      emit(DataGot());
    });
  }
}
