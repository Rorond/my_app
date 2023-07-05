import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/core.dart';
import 'package:my_app/state_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
