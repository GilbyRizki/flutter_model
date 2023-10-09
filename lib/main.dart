import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_flutter/screen_satu.dart';
import 'package:new_project_flutter/screen_dua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: ()=>MyApp()),
        GetPage(name: "/screenSatu", page: ()=>ScreenSatu()),
        GetPage(name: "/screenDua", page: ()=>ScreenDua()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  ScreenSatu(),
    );
  }
}
