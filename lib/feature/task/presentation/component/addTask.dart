import 'package:flutter/material.dart';

import '../../../../core/utiles/app_color.dart';

class addTaskComponent extends StatelessWidget {
  addTaskComponent(
      {super.key,
      required this.hinttext,
      required this.text,
      this.sufix,
      this.readOnly = false,
      this.controller,
      this.validator});
  String hinttext;
  Widget? sufix;
  String text;
  bool? readOnly;
  TextEditingController? controller;
  String? Function(String?)? validator;
  
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColor.lightBlack,
          filled: true,
          hintText: hinttext,
          suffixIcon: sufix,
          hintStyle: Theme.of(context).textTheme.displayMedium,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
        readOnly: readOnly!,
      ),
    ]);
  }
}
