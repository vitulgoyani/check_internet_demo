import 'package:check_internet_demo/bindings/app_binding.dart';
import 'package:check_internet_demo/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(),
      home:  HomeScreen(),
    );
  }
}
