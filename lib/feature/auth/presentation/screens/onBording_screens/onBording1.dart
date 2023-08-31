import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/core/database/chach/chach_helper.dart';
import 'package:todoapp/core/utiles/app_assets.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/utiles/app_string.dart';
import 'package:todoapp/feature/auth/data/model/onBordingModel.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../task/presentation/screens/home_screen.dart';

class onBordingScreen extends StatelessWidget {
  onBordingScreen({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: 
          PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context,indx){
            return Column(mainAxisAlignment: MainAxisAlignment.center, children: [ Align(
            alignment: Alignment.topLeft,
            child:
            indx!=2? TextButton(
              onPressed: (){
                controller.jumpToPage(2);
              },
              child: Text(
                AppString.skip,
                style:Theme.of(context).textTheme.displaySmall,
              ),
            ):Container(),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(onBordingModel.onBording_screens[indx].imagPath),
          SizedBox(
            height: 40,
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: AppColor.primary,
                spacing: 8,
                dotHeight: 12),
          ),
          Text(
            onBordingModel.onBording_screens[indx].title,
            style:Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 20,
          ),
     
          Text(
            textAlign:TextAlign.center,
              onBordingModel.onBording_screens[indx].subtitle,
              style: Theme.of(context).textTheme.displayMedium,
           
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
          indx!=0?     TextButton(
                onPressed: () {
                  controller.previousPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn);
                },
                child: Text(
                  AppString.back,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ):Container(height: 10,),
              Spacer(),
            indx!=2?  ElevatedButton(
                onPressed: () {
                  controller.nextPage(duration: Duration(microseconds: 1000), curve: Curves.bounceIn);
                },
                child: Text(AppString.next),
                style: Theme.of(context).elevatedButtonTheme.style,
                
              ):ElevatedButton(
                onPressed: ()async {
              await    sl<CacheHelper>().saveData(key:AppString.onBordingKey,value:true);
              print(await sl<CacheHelper>().getData(key:AppString.onBordingKey));
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  }));
                },
                child: Text(AppString.getstart),
                style: Theme.of(context).elevatedButtonTheme.style,
              ),
            ],
          ),
        ],);
          }),
        ),
      ),
    );
  }
}
