

import 'package:flutter/material.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/feature/auth/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo App ', 
      theme: getAppTheme(), 
      home: splashScreen(),
    );
  }
}