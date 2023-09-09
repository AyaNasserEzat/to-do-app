import 'package:flutter/material.dart';
import 'package:todoapp/feature/auth/presentation/screens/onBording_screens/onBording1.dart';
import 'package:todoapp/feature/task/presentation/screens/home_screen.dart';

import '../../../../core/database/chach/chach_helper.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utiles/app_assets.dart';
import '../../../../core/utiles/app_color.dart';
import '../../../../core/utiles/app_string.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    super.initState();
    navigate();
  }
  void navigate(){
    Future.delayed(const Duration(seconds: 3),(){
      bool isVisited=sl<CacheHelper>().getData(key: AppString.onBordingKey)??false;
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return isVisited? const HomeScreen():onBordingScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(AppImage.logo),
          const Text(
            AppString.logo,
            style: TextStyle(color: AppColor.withe),
          ),
        ]),
      ),
    );
  }
}
