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

class _MainPageState extends State<MainPage> {
  int number = 0;
  String result = 'no result';
  bool isComputing = false;

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
                onPressed: () {},
                child: const Text("increment"),
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
                onPressed: isComputing ? null : () {},
                child: const Text("Do Heavy Comoputation"),
              ),
            )
          ],
        ),
      ),
    );
  }
}