import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utiles/app_color.dart';
import '../../../../core/utiles/app_string.dart';

class addTaskComponent extends StatelessWidget {
   addTaskComponent({super.key,required this.hinttext,required this.text,this.sufix,this.readOnly=false});
String hinttext;
Widget? sufix;
String text;
bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[ Text(text,style: Theme.of(context).textTheme.displayMedium,),
            SizedBox(height: 10,),
            TextFormField(
              controller: TextEditingController(),
        decoration: InputDecoration(
    
         fillColor: AppColor.lightBlack,
          filled: true,
       hintText:hinttext,
       suffixIcon: sufix,
       hintStyle: Theme.of(context).textTheme.displayMedium,
          enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4)),
        focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(4)),
        ),
        readOnly: readOnly!,
            ),
    ]);
          
  }
}