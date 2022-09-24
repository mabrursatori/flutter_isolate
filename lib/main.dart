import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

void heavyProcess(int number) {
  for (int counter = 0; counter < number; counter++) {
    print("TEST");
  }

  print("DONE");
}

void heavyProcessWithoutParams(_) {
  for (int counter = 0; counter < 10000000000; counter++) {
    print("TEST");
  }

  print("DONE");
}

String anotherHeavyProcess(int number) {
  int total = 0;
  for (int counter = 0; counter < number; counter++) {
    total += counter;
  }
  return total.toString();
}

class _MainPageState extends State<MainPage> {
  int number = 0;
  String result = 'no result';
  bool isComputing = false;

  @override
  void initState() {
    super.initState();
    /**  Isolate.spawn<int>(heavyProcess, 100000000000000000); **/
    Isolate.spawn(heavyProcessWithoutParams, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ioslate Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$number',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    number++;
                  });
                },
                child: const Text("increments"),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  'Result : \n$result',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: isComputing
                    ? null
                    : () async {
                        setState(() {
                          isComputing = !isComputing;
                        });

                        result = await compute<int, String>(
                            anotherHeavyProcess, 10000);

                        setState(() {
                          isComputing = !isComputing;
                        });
                      },
                child: const Text("Do Heavy Comoputation"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
