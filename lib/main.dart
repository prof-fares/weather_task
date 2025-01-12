import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:weather_task/di.dart';
import 'package:weather_task/mini_core/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    ///  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
 Hive.initFlutter();
 await Future.delayed(Duration(milliseconds: 400));
 await initDependencies();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
     initialRoute:AppPages.INITIAL ,
     initialBinding: HomeBinding(),
     getPages: AppPages.routes, 
    );
  }
}
