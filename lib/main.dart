import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // Import GetX

import 'package:flutter_application_1/screen/splash_screen.dart';
import 'apis/app_write.dart';
import 'helper/global.dart';
import 'helper/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize hive
  Pref.initialize();
  // for appwrite initialization 
  AppWrite.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      title: appName,
      debugShowCheckedModeBanner: false,

      themeMode: Pref.defaultTheme,

      //dark theme
        darkTheme:ThemeData(
        useMaterial3: false, //this makes no automatic changes if flutter packages get updated by google
        brightness: Brightness.dark,
        appBarTheme: const 
      AppBarTheme(
        elevation: 50,
        centerTitle: true,
         titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500 ),
          ),) ,





      //light theme
      theme: ThemeData(
        useMaterial3: false,  //this makes no automatic changes if flutter packages get updated by google
        appBarTheme: const 
      AppBarTheme(
        elevation: 50,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
         titleTextStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500 ),
          ),),

      home: SplashScreen(),
    );
  }
}

extension AppTheme on ThemeData{
  //lightTextColor
  Color get lightTextColor => brightness == Brightness.dark ? Colors.white70 : Colors.black54;
 
 //button color
  Color get buttonColor => brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
                          
