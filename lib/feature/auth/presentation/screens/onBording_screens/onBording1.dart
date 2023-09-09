import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/core/database/chach/chach_helper.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/utiles/app_string.dart';
import 'package:todoapp/core/widgets/customButton.dart';
import 'package:todoapp/core/widgets/custom_textButton.dart';
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
            indx!=2? 
            CustomTextButton(onpressed:  (){
                controller.jumpToPage(2);
              }, text:  AppString.skip,)
          :Container(),
          ),
          const SizedBox(
            height: 40,
          ),
          Image.asset(onBordingModel.onBording_screens[indx].imagPath),
          const SizedBox(
            height: 40,
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
                activeDotColor: AppColor.primary,
                spacing: 8,
                dotHeight: 12),
          ),
          Text(
            onBordingModel.onBording_screens[indx].title,
            style:Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
     
          Text(
            textAlign:TextAlign.center,
              onBordingModel.onBording_screens[indx].subtitle,
              style: Theme.of(context).textTheme.displayMedium,
           
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
          indx!=0?  
          CustomTextButton(onpressed: () {
                  controller.previousPage(duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
                }, text:   AppString.back,)
         :Container(height: 10,),
              const Spacer(),
            indx!=2?  
            CustomButton(onpressed:  () {
                  controller.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.bounceIn);
                }, text: AppString.next)
          :
          CustomButton(onpressed:  ()async {
              await    sl<CacheHelper>().saveData(key:AppString.onBordingKey,value:true);
              print(await sl<CacheHelper>().getData(key:AppString.onBordingKey));
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return const HomeScreen();
                  }));
                }, text: AppString.getstart)
         
            ],
          ),
        ],);
          }),
        ),
      ),
    );
  }
}
