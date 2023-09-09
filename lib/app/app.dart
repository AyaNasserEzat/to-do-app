

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/feature/auth/presentation/screens/splash_screen.dart';

import '../feature/task/presentation/cubit/taskCubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo App ', 
        darkTheme: getAppDarkTheme(),
                themeMode: BlocProvider.of<taskCubit>(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
              
        theme: getAppTheme(), 
        home: const splashScreen(),
    
    );
  }
}