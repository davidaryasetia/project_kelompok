import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelompok/controllers/auth_controller.dart';
import 'package:project_kelompok/pages/splash_screen.dart';
import 'package:project_kelompok/utils/mytheme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      theme: Mytheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}