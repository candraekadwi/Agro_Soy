// ignore_for_file: depend_on_referenced_packages, camel_case_types, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../constants.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class tabel extends StatefulWidget {
  tabel({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<tabel> {
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: getProductDataSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SfDataGridTheme(
                      data: SfDataGridThemeData(
                          headerColor: const Color(0xff009889), //kGreenColor,
                          gridLineColor: kTextLightColor,
                          gridLineStrokeWidth: 1.5,
                          rowHoverColor: kGreenColor,
                          rowHoverTextStyle: const TextStyle(
                              color: kInfectedColor, fontSize: 14)),
                      child: SfDataGrid(
                        key: key,
                        allowPullToRefresh: true,
                        source: snapshot.data,
                        allowTriStateSorting: true,
                        columns: getColumns(),
                        onQueryRowHeight: (details) {
                          return details.rowIndex == 0 ? 70.0 : 75;
                        },
                      ),
                    )
                  : Card(
                      elevation: 5.0,
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Retriving data table...',
                                  style: TextStyle(fontSize: 20.0)),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  semanticsLabel: 'Retriving data table',
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
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              key.currentState!.refresh();
            }),
      ),
    );
  }

  Future<ProductDataGridSource> getProductDataSource() async {
    var productList = await generateProductList();
    return ProductDataGridSource(productList);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'id',
          width: 50,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('id',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'date',
          width: 100,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('Date',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'NPK',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('NPK',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'ph',
          width: 85,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('pH & Hum',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Battery',
          width: 90,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('Battery',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Network',
          width: 110,
          label: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const Text('Network',
                  style: ktabelTextStyle,
                  overflow: TextOverflow.clip,
                  softWrap: true))),
    ];
  }

  Future<List<Product>> generateProductList() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbzFOIv3CmqNWlIZaRIQwZJsGXWD5-Jf3BzgRcsQVfDowJEW40lEaVt3N_66nNAusfmIVg/exec'));
    var decodedProducts =
        json.decode(response.body).cast<Map<String, dynamic>>();
    List<Product> productList = await decodedProducts
        .map<Product>((json) => Product.fromJson(json))
        .toList();
    return productList;
  }
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(this.productList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Product> productList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Color.fromARGB(255, 236, 245, 234),
        cells: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              row.getCells()[0].value.toString(),
              overflow: TextOverflow.ellipsis,
              style: ktabelTextvalue,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    DateFormat('dd/MM/yyyy')
                        .format(row.getCells()[1].value)
                        .toString(),
                    overflow: TextOverflow.ellipsis,
                    style: ktabelTextvalue),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  DateFormat('HH:mm')
                      .format(row.getCells()[2].value)
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  style: ktabelTextvalue,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("N : ${row.getCells()[3].value.toString()}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: ktabelTextvalue),
                const SizedBox(
                  height: 5,
                ),
                Text("P : ${row.getCells()[4].value.toString()}",
                    overflow: TextOverflow.ellipsis, style: ktabelTextvalue),
                const SizedBox(
                  height: 5,
                ),
                Text("K : ${row.getCells()[5].value.toString()}",
                    overflow: TextOverflow.ellipsis, style: ktabelTextvalue),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("pH : ${row.getCells()[6].value.toString()}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: ktabelTextvalue),
                const SizedBox(
                  height: 12,
                ),
                Text("Hum: ${row.getCells()[7].value}",
                    overflow: TextOverflow.ellipsis, style: ktabelTextvalue),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${row.getCells()[8].value.toString()} %",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: ktabelTextvalue),
                const SizedBox(
                  height: 12,
                ),
                Text("Battery ${row.getCells()[9].value}",
                    overflow: TextOverflow.ellipsis, style: ktabelTextvalue),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "${row.getCells()[10].value == 1 ? "WiFi" : row.getCells()[10].value == 2 ? "GSM" : "LoRa"} ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: ktabelTextvalue),
                const SizedBox(
                  height: 12,
                ),
                Text("RSSI : ${row.getCells()[11].value} dbm",
                    overflow: TextOverflow.ellipsis, style: ktabelTextvalue),
              ],
            ),
          ),
        ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = productList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'No', value: dataGridRow.id),
        DataGridCell<DateTime>(columnName: 'Date', value: dataGridRow.date),
        DataGridCell<DateTime>(columnName: 'Date', value: dataGridRow.jam),
        DataGridCell(columnName: 'NPK', value: dataGridRow.n),
        DataGridCell(columnName: 'NPK', value: dataGridRow.p),
        DataGridCell(columnName: 'NPK', value: dataGridRow.k),
        DataGridCell(columnName: 'ph', value: dataGridRow.ph),
        DataGridCell(columnName: 'ph', value: dataGridRow.hum),
        DataGridCell(columnName: 'Batery', value: dataGridRow.battery),
        DataGridCell(columnName: 'Batery', value: dataGridRow.battype),
        DataGridCell(columnName: 'Network', value: dataGridRow.jaringan),
        DataGridCell(columnName: 'Network', value: dataGridRow.rssi),
      ]);
    }).toList(growable: false);
  }
}

class Product {
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['index'],
        date: DateTime.parse(json['date']),
        jam: DateTime.parse(json['date']),
        n: (json['N'].toString()),
        p: (json['P'].toString()),
        k: (json['K'].toString()),
        ph: (json['PH'].toString()),
        hum: (json['HUM'].toString()),
        battery: json['BATTERY'],
        battype: json['BATTYPE'],
        jaringan: json['JARINGAN'],
        rssi: json['RSSI']);
  }
  Product(
      {required this.id,
      required this.date,
      required this.jam,
      required this.n,
      required this.p,
      required this.k,
      required this.ph,
      required this.hum,
      required this.battery,
      required this.battype,
      required this.jaringan,
      required this.rssi});
  final int? id;
  final DateTime? date;
  final DateTime? jam;
  final String? n;
  final String? p;
  final String? k;
  final String? ph;
  final String? hum;
  final int? battery;
  final int? battype;
  final int? jaringan;
  final int? rssi;
}
