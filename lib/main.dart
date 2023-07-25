import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter API Shop',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 33, 16, 63)),
        useMaterial3: true,
        
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
