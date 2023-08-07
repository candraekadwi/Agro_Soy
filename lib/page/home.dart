// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names, sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_print, unused_import

import 'package:agro_soy/page/tabel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0x0000fff5),
                image: DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  alignment: Alignment.topRight,
                )),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 50, right: 5),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Container(
                        //   height: size.height * 0.05,
                        //   width: size.width * 0.2,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Color.fromARGB(255, 197, 34, 8),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             offset: const Offset(0, 4),
                        //             color: kShadowColor)
                        //       ]),
                        //   child: const Text(
                        //     "Hi bro",
                        //     style: TextStyle(
                        //         fontSize: 12,
                        //         color: Color.fromRGBO(96, 153, 102, 1.0),
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                  ]),
                ),
                buildcontainer(
                    cubit.N,
                    cubit.P,
                    cubit.K,
                    cubit.PH,
                    cubit.HUM,
                    cubit.BATTERY,
                    cubit.BATTYPE,
                    cubit.JARINGAN,
                    cubit.RSSI,
                    cubit.PUMP,
                    size)
              ],
            ),
          ));
        });
  }
}

Widget buildcontainer(
    int N, P, K, PH, HUM, BATTERY, BATTYPE, JARINGAN, RSSI, PUMP, Size size) {
  print(HUM);
  return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kbackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              controller: ScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 4), color: kShadowColor)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "NPK\n",
                                  style: kTitleTextStyle(size),
                                ),
                                const TextSpan(
                                    text: "Realtime Monitoring",
                                    style: TextStyle(
                                      color: kTextLightColor,
                                    ))
                              ]),
                            ),
                            const Spacer(),
                            // GestureDetector(
                            //   onTap: () {

                            //   },
                            //   child: const Text(
                            //     "See details",
                            //     style: kDetails,
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            counter(
                                num: N,
                                color: kInfectedColor,
                                title: "Nitrogen (N)"),
                            counter(
                                num: P,
                                color: kDeathColor,
                                title: "Forfor (P)"),
                            counter(
                                num: K,
                                color: kRecovercolor,
                                title: "Kalium (K)"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 6,
                        child: Container(
                          height: size.height * 0.35,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: kShadowColor)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "pH",
                                    style: kTitleTextStyle(size),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: size.height * 0.27,
                                child: SfRadialGauge(axes: <RadialAxis>[
                                  RadialAxis(
                                      minimum: 0,
                                      maximum: 14,
                                      interval: 1,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 4,
                                          color: const Color.fromRGBO(
                                              222, 92, 31, 1),
                                          startWidth: 15,
                                          endWidth: 15,
                                        ),
                                        GaugeRange(
                                          startValue: 4,
                                          endValue: 7,
                                          color: const Color.fromRGBO(
                                              255, 205, 65, 1),
                                          startWidth: 15,
                                          endWidth: 15,
                                        ),
                                        GaugeRange(
                                          startValue: 7,
                                          endValue: 10,
                                          color: const Color.fromRGBO(
                                              97, 184, 17, 1),
                                          startWidth: 15,
                                          endWidth: 15,
                                        ),
                                        GaugeRange(
                                          startValue: 10,
                                          endValue: 14,
                                          color: const Color.fromRGBO(
                                              47, 97, 206, 1),
                                          startWidth: 15,
                                          endWidth: 15,
                                        ),
                                      ],
                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                          value: PH,
                                        )
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                            widget: Text('$PH',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.width * 0.055,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            angle: 90,
                                            positionFactor: 0.8)
                                      ])
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          height: size.height * 0.35,
                          width: size.width * 0.25,
                          margin: EdgeInsets.all(size.width * 0.02),
                          padding: EdgeInsets.all(size.width * 0.02),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: kShadowColor)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text("Mois", style: kTitleTextStyle(size)),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              RotatedBox(
                                quarterTurns: 135,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.height *
                                        0.23,
                                    animation: true,
                                    lineHeight: 30.0,
                                    animationDuration: 2000,
                                    percent: HUM / 100,
                                    barRadius: const Radius.circular(20),
                                    progressColor:
                                        const Color.fromRGBO(0, 152, 137, 1),
                                    backgroundColor: const Color.fromARGB(
                                        255, 228, 226, 226),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                "$HUM %",
                                style: TextStyle(
                                    fontSize: size.width * 0.052,
                                    color:
                                        const Color.fromARGB(255, 6, 114, 171),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          height: size.height * 0.31,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: kShadowColor)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pump",
                                    style: kTitleTextStyle(size),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Image.asset(
                                PUMP == "1"
                                    ? "assets/images/ON.png"
                                    : "assets/images/OFF.png",
                                width: size.width * 0.27,
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Text(PUMP == "1" ? "ON" : "OFF",
                                  style: TextStyle(
                                      fontSize: size.width * 0.06,
                                      color: (PUMP == "1"
                                          ? const Color.fromARGB(
                                              255, 4, 117, 28)
                                          : const Color.fromARGB(
                                              255, 148, 8, 8)),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          height: size.height * 0.31,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: kShadowColor)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Network",
                                    style: kTitleTextStyle(size),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              Image.asset(
                                JARINGAN == "1"
                                    ? "assets/images/wifi.png"
                                    : JARINGAN == "2"
                                        ? "assets/images/gsm.png"
                                        : JARINGAN == "3"
                                            ? "assets/images/iot-lora-alliance-logo.svg.png"
                                            : "assets/images/no-internet.png",
                                width: size.width * 0.2,
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              Text("$RSSI dBm",
                                  style: const TextStyle(
                                      fontSize: 23,
                                      color: Color.fromARGB(255, 4, 77, 117),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: size.height * 0.45,
                      margin: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4), color: kShadowColor)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(""),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Battery $BATTYPE",
                                style: TextStyle(
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromRGBO(
                                        161, 233, 168, 0.2),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, size.width * 0.8),
                                          color: kShadowColor)
                                    ]),
                                child: CircularPercentIndicator(
                                  radius: size.width * 0.3,
                                  lineWidth: size.width * 0.05,
                                  percent: (BATTERY / 100),
                                  progressColor:
                                      const Color.fromARGB(255, 18, 103, 214),
                                  backgroundColor:
                                      const Color.fromARGB(255, 173, 208, 237),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    "$BATTERY %",
                                    style: TextStyle(
                                        fontSize: size.width * 0.057,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(""),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      });
}

class counter extends StatelessWidget {
  final int num;
  final Color color;
  final String title;

  counter(
      {super.key, required this.num, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(.26)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("$num",
            style: TextStyle(
                fontSize: 30, color: color, fontWeight: FontWeight.bold)),
        Text(
          title,
          style: kSubtitleTextSyule,
        )
      ],
    );
  }
}
