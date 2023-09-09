import 'package:flutter/material.dart';
import 'package:todoapp/core/utiles/app_color.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.onpressed,required this.text,this.color=AppColor.primary});
VoidCallback onpressed;
Color? color;
String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: onpressed,
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: MaterialStateProperty.all(color),
                ),
                child: Text(text),
                
              );
  }
}