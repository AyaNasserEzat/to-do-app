import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({super.key,required this.onpressed,required this.text});
 String text;
 VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
              onPressed: onpressed,
              child: Text(
               text,
                style:Theme.of(context).textTheme.displaySmall,
              ),
            );
  }
}