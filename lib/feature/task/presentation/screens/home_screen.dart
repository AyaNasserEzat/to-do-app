import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/database/chach/chach_helper.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utiles/app_string.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: ()async{
      sl<CacheHelper>().clearData();  
      print(await sl<CacheHelper>().getData(key:AppString.onBordingKey));
          },
      child:Text('welcom') ,
      ),
    );
  }
}