import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var textc = TextEditingController();
  int? random;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var ref = FirebaseDatabase.instance.ref().child('Sensor');
  var ref1 = FirebaseDatabase.instance.ref().child('Temperature');
  var ref2 = FirebaseDatabase.instance.ref().child('Temperature');
  var ref3 = FirebaseDatabase.instance.ref().child('Temperature');
  int i = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return Column(
                      children: [
                        Text("${snapshot.key}: " +
                            snapshot.child("Sensor").value.toString() +
                            "°C"),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
