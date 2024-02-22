// import 'package:api2/login.dart';
// import 'package:api2/page.dart';
import 'package:flutter/material.dart';
import 'package:gitflutter/homes.dart';
//import 'package:new_project/GetData/WithoutModel/userdata.dart';

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(211, 255, 191, 1),
          title: const Text("App"),
        ),
        body: const UploadImageScreen(),
      ),
    );
  }
}
