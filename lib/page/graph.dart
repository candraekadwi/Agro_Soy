// ignore_for_file: sort_child_properties_last

import 'dart:convert' show json;

import 'package:agro_soy/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class graph extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  graph({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<graph> {
  List<SalesData> chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  late TrackballBehavior _trackballBehavior;
  late int index = 0;
  late bool visible = false;
  final List<String> items = [
    "Nitrogen (N)",
    "Fosfor(P)",
    "Kalium (K)",
    "Ph",
    "Moisture"
  ];
  String? selec = "Nitrogen (N)";
  late String a;

  Future loadSalesData() async {
    final String jsonString = await getJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    //print(jsonResponse);
    setState(() {
      for (Map<String, dynamic> i in jsonResponse) {
        chartData.add(SalesData.fromJson(i));
      }
    });
  }

  Future<String> getJsonFromFirebase() async {
    String url =
        "https://script.google.com/macros/s/AKfycbzFOIv3CmqNWlIZaRIQwZJsGXWD5-Jf3BzgRcsQVfDowJEW40lEaVt3N_66nNAusfmIVg/exec";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  @override
  void initState() {
    loadSalesData();

    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _trackballBehavior = TrackballBehavior(
        enable: true, tooltipDisplayMode: TrackballDisplayMode.groupAllPoints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Data1> data1 = [
      Data1(
          (chartData.isNotEmpty
              ? chartData[index + 0].date
              : DateTime(2023, 3, 1)) as DateTime,
          (chartData.isNotEmpty ? chartData[index + 0].n : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 0].p : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 0].k : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 0].ph : 0.0) as double,
          (chartData.isNotEmpty ? chartData[index + 0].mois : 0) as int),
      Data1(
          (chartData.isNotEmpty
              ? chartData[index + 1].date
              : DateTime(2023, 3, 1)) as DateTime,
          (chartData.isNotEmpty ? chartData[index + 1].n : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 1].p : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 1].k : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 1].ph : 0.0) as double,
          (chartData.isNotEmpty ? chartData[index + 1].mois : 0) as int),
      Data1(
          (chartData.isNotEmpty
              ? chartData[index + 2].date
              : DateTime(2023, 3, 1)) as DateTime,
          (chartData.isNotEmpty ? chartData[index + 2].n : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 2].p : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 2].k : 0) as int,
          (chartData.isNotEmpty ? chartData[index + 2].ph : 0.0) as double,
          (chartData.isNotEmpty ? chartData[index + 2].mois : 0) as int),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 3].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 3].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 3].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 3].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 3].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 3].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 4].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 4].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 4].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 4].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 4].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 4].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 5].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 5].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 5].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 5].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 5].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 5].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 6].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 6].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 6].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 6].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 6].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 6].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 7].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 7].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 7].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 7].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 7].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 7].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 8].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 8].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 8].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 8].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 8].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 8].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 9].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 9].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 9].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 9].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 9].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 9].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 10].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 10].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 10].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 10].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 10].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 10].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 11].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 11].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 11].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 11].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 11].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 11].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 12].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 12].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 12].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 12].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 12].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 12].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 13].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 13].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 13].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 13].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 13].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 13].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 14].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 14].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 14].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 14].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 14].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 14].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 15].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 15].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 15].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 15].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 15].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 15].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 16].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 16].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 16].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 16].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 16].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 16].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 17].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 17].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 17].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 17].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 17].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 17].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 18].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 18].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 18].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 18].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 18].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 18].mois : 0) as int,
      ),
      Data1(
        (chartData.isNotEmpty
            ? chartData[index + 19].date
            : DateTime(2023, 3, 1)) as DateTime,
        (chartData.isNotEmpty ? chartData[index + 19].n : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 19].p : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 19].k : 0) as int,
        (chartData.isNotEmpty ? chartData[index + 19].ph : 0.0) as double,
        (chartData.isNotEmpty ? chartData[index + 19].mois : 0) as int,
      ),
    ];
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Text(
            "$selec",
            style: kTitleTextStyle(size),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: size.height * 0.7,
            width: size.width * 0.98,
            child: FutureBuilder(
                future: getJsonFromFirebase(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return SfCartesianChart(
                        trackballBehavior: _trackballBehavior,
                        zoomPanBehavior: _zoomPanBehavior,
                        primaryXAxis: DateTimeAxis(
                          enableAutoIntervalOnZooming: false,
                          //edgeLabelPlacement: EdgeLabelPlacement.shift,
                          intervalType: DateTimeIntervalType.hours,
                          dateFormat: DateFormat('dd/MM/yy HH:mm'),
                        ),
                        series: <ChartSeries>[
                          selec == "Nitrogen (N)"
                              ? LineSeries<Data1, DateTime>(
                                  dataSource: data1,
                                  xValueMapper: (Data1 sales, _) => sales.x,
                                  yValueMapper: (Data1 sales, _) => sales.y1,
                                  // Enable data label
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  dataLabelSettings: const DataLabelSettings(
                                      //Renders the data label
                                      isVisible: true))
                              : selec == "Fosfor(P)"
                                  ? LineSeries<Data1, DateTime>(
                                      dataSource: data1,
                                      xValueMapper: (Data1 sales, _) => sales.x,
                                      yValueMapper: (Data1 sales, _) =>
                                          sales.y2,
                                      // Enable data label
                                      markerSettings:
                                          const MarkerSettings(isVisible: true),
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              // Renders the data label
                                              isVisible: true))
                                  : selec == "Kalium (K)"
                                      ? LineSeries<Data1, DateTime>(
                                          dataSource: data1,
                                          xValueMapper: (Data1 sales, _) =>
                                              sales.x,
                                          yValueMapper: (Data1 sales, _) =>
                                              sales.y3,
                                          // Enable data label
                                          markerSettings: const MarkerSettings(
                                              isVisible: true),
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  // Renders the data label
                                                  isVisible: true))
                                      : selec == "Ph"
                                          ? LineSeries<Data1, DateTime>(
                                              dataSource: data1,
                                              xValueMapper: (Data1 sales, _) =>
                                                  sales.x,
                                              yValueMapper: (Data1 sales, _) =>
                                                  sales.y4,
                                              // Enable data label
                                              markerSettings: const MarkerSettings(
                                                  isVisible: true),
                                              dataLabelSettings:
                                                  const DataLabelSettings(
                                                      // Renders the data label
                                                      isVisible: true))
                                          : selec == "Moisture"
                                              ? LineSeries<Data1, DateTime>(
                                                  dataSource: data1,
                                                  xValueMapper: (Data1 sales, _) =>
                                                      sales.x,
                                                  yValueMapper: (Data1 sales, _) =>
                                                      sales.y5,
                                                  // Enable data label
                                                  markerSettings:
                                                      const MarkerSettings(
                                                          isVisible: true),
                                                  dataLabelSettings:
                                                      const DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true))
                                              : LineSeries<Data1, DateTime>(
                                                  dataSource: data1,
                                                  xValueMapper: (Data1 sales, _) =>
                                                      sales.x,
                                                  yValueMapper:
                                                      (Data1 sales, _) =>
                                                          sales.y1,
                                                  // Enable data label
                                                  markerSettings:
                                                      const MarkerSettings(isVisible: true),
                                                  dataLabelSettings: const DataLabelSettings(
                                                      // Renders the data label
                                                      isVisible: true)),
                        ]);
                  } else {
                    return Card(
                      elevation: 5.0,
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 100,
                        width: 400,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // ignore: prefer_const_constructors
                              Text('Retriving data chart...',
                                  style: const TextStyle(fontSize: 20.0)),
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  semanticsLabel: 'Retriving data chart',
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.blueAccent),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ),
          SizedBox(
            height: size.width * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.24,
                margin: EdgeInsets.symmetric(
                    vertical: 0, horizontal: size.width * 0.04),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 231, 229, 229)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    setState(() {
                      index += 20;
                    });
                  },
                  child: Image.asset(
                    "assets/images/arrowL.png",
                    width: size.width * 0.14,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.35,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                width: 3.4, color: Color(0xff009889)))),
                    value: selec,
                    items: items
                        .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                              child: Text(e.toString()),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selec = value;
                      });
                    }),
              ),
              Container(
                width: size.width * 0.24,
                margin: EdgeInsets.symmetric(
                    vertical: 0, horizontal: size.width * 0.04),
                child: Visibility(
                  visible: index == 0 ? visible = false : visible = true,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 231, 229, 229)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      setState(() {
                        index -= 20;
                      });
                    },
                    child: Image.asset(
                      "assets/images/arrowR.png",
                      width: size.width * 0.14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SalesData {
  factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
      id: json['index'],
      date: DateTime.parse(json['date']),
      n: int.parse(json['N'].toString()),
      p: int.parse(json['P'].toString()),
      k: int.parse(json['K'].toString()),
      ph: double.parse(json['PH'].toString()),
      mois: int.parse(json['HUM'].toString()),
    );
  }
  SalesData({
    required this.id,
    required this.date,
    required this.n,
    required this.p,
    required this.k,
    required this.ph,
    required this.mois,
  });
  final int? id;
  final DateTime? date;
  final int? n;
  final int? p;
  final int? k;
  final double? ph;
  final int? mois;
}

class Data1 {
  Data1(this.x, this.y1, this.y2, this.y3, this.y4, this.y5);
  final DateTime x;
  final int y1;
  final int y2;
  final int y3;
  final double y4;
  final int y5;
}
