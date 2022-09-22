import 'package:flutter/material.dart';
import 'package:todoapp/myapp.dart';
import 'package:get/get.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
