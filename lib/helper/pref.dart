import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;
  static Future<void> initialize() async {
    
   //for initializing hive to use app directory 
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  _box = Hive.box(name: 'myData');
  }
//once in home screen don't move back to onboarding screen  // getter and setter function 
  static bool get showOnboarding => _box.get('showOnboarding', defaultValue: true );
  static set showOnboarding(bool v) => _box.put('showOnboarding', v); //v is value

  static bool get isDarkMode => _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool v) => _box.put('isDarkMode', v);

  static ThemeMode get defaultTheme{
    final data = _box.get('isDarkMode');
    log('data : $data');
    if(data == null) return ThemeMode.system;
    if( data== true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}