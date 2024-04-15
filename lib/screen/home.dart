import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:microprocessor_app/screen/gauge.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? temp;
  double? pressure;
  double? humidity;
  double? altimeter;
  double? lpg;
  double? co;
  double? smoke;
  @override
  var ref = FirebaseDatabase.instance.ref().child('Sensor');
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer();
    listenToRealtimeDatabase();
  }

  void listenToRealtimeDatabase() {
    ref.onValue.listen((event) {
      setState(() {
        temp =
            double.parse(event.snapshot.child("Temperature").value.toString());
        pressure =
            double.parse(event.snapshot.child("Pressure").value.toString());
        humidity =
            double.parse(event.snapshot.child("Humidity").value.toString());
        altimeter =
            double.parse(event.snapshot.child("Altimeter").value.toString());
        lpg = double.parse(event.snapshot.child("LPG").value.toString());
        co = double.parse(event.snapshot.child("CO").value.toString());
        smoke = double.parse(event.snapshot.child("Smoke").value.toString());
      });
    });
    print(
        "temp: $temp pressure: $pressure humidity: $humidity altimeter: $altimeter lpg: $lpg co: $co smoke: $smoke");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Microprocessor'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Created by Shafin",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(width: 50)
                  ],
                ),
              ],
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Realtime Sensor Data",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.deepPurple,
                  thickness: 1.5,
                ),
                SizedBox(height: 12),
                Container(
                  height: 180,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Temperature: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$temp °C",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Pressure: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$pressure Pa",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Humidity: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$humidity %",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Altimeter: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$altimeter m",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("LPG: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$lpg ppm",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("CO: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$co ppm",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Smoke: ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            Text(
                              "$smoke ppm",
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                                value: temp ?? 0,
                                title: 'Temperature',
                                unit: ' °C',
                                color1: Colors.blue,
                                color2: Colors.green,
                                color3: Colors.red,
                                startValue: -50,
                                endValue: 100,
                                value1: 0,
                                value2: 50),
                          ),
                        ),
                        SizedBox(width: 23),
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                              value: pressure ?? 0,
                              title: 'Pressure',
                              unit: ' hPa',
                              startValue: 0,
                              endValue: 3000,
                              value1: 950,
                              value2: 2000,
                              checkValue: 2000,
                              color1: Colors.orange,
                              color2: Colors.green,
                              color3: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                              value: humidity ?? 0,
                              title: 'Humidity',
                              unit: ' %',
                              color1: Colors.orange,
                              color2: Colors.green,
                              color3: Colors.red,
                              checkValue: 60,
                              value1: 30,
                              value2: 60,
                            ),
                          ),
                        ),
                        SizedBox(width: 23),
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                                value: altimeter ?? 0,
                                title: 'Altimeter',
                                unit: ' m'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                              value: lpg ?? 0,
                              title: 'LPG',
                              unit: ' ppm',
                              startValue: 0,
                              endValue: 6000,
                              value1: 2000,
                              value2: 5000,
                              checkValue: 5000,
                            ),
                          ),
                        ),
                        SizedBox(width: 23),
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                              value: co ?? 0,
                              title: 'CO',
                              unit: ' ppm',
                              startValue: 0,
                              endValue: 100,
                              value1: 35,
                              value2: 70,
                              checkValue: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: gauge(
                              value: smoke ?? 0,
                              title: 'Smoke',
                              unit: ' ppm',
                              startValue: 0,
                              endValue: 300,
                              value1: 100,
                              value2: 200,
                              checkValue: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
