import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:appez/router/pages.dart';
import 'package:appez/common/theme.dart';

void main() async { 
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'appez',
      theme: defultTheme,
      initialRoute: AppRoutes.homePage,
      getPages: AppPages.pages,
    );
  }
}