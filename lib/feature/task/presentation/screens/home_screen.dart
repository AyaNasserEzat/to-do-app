import 'dart:ui';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utiles/app_assets.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/widgets/customButton.dart';
import 'package:todoapp/feature/task/presentation/screens/add_task_screen.dart';

import '../../../../core/database/chach/chach_helper.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utiles/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColor.primary,
                  selectedTextColor: Colors.white,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                  onDateChange: (date) {
                    // New date selected
                    //  setState(() {
                    //    _selectedValue = date;
                    //  });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //   noTaskScreen(),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(24),
                            height: 240,
                            color: AppColor.deepgrey,
                            child: Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: CustomButton(
                                        onpressed: () {},
                                        text: AppString.taskCompleted)),
                                        const SizedBox(height: 20,),
                                         SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: CustomButton(
                                      color: AppColor.red,
                                        onpressed: () {},
                                        text: AppString.deleteTask)),
                                         const SizedBox(height: 20,),
                                         SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: CustomButton(
                                        onpressed: () {},
                                        text: AppString.cancel)),
                              ],
                            ),
                          );
                        });
                  },
                  child: TaskCombonent()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTaskScreen();
            }));
          },
          child: Icon(
            Icons.add,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}

class noTaskScreen extends StatelessWidget {
  const noTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(AppImage.Checklist),
          Text(
            AppString.noTaskt,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 24),
          ),
          Text(
            textAlign: TextAlign.center,
            AppString.noTaskst,
            style: Theme.of(context).textTheme.displayMedium!,
          ),
        ],
      ),
    );
  }
}

class TaskCombonent extends StatelessWidget {
  const TaskCombonent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 128,
      decoration: BoxDecoration(
        color: AppColor.red,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1',
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: AppColor.withe,
                    ),
                    Text(
                      ' 09:33 PM - 09:48 PM',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                Text(
                  'Learn Dart',
                  style: Theme.of(context).textTheme.displayLarge,
                )
              ],
            ),
          ),
          Container(
            height: 70,
            child: VerticalDivider(
              thickness: 1,
              color: AppColor.withe,
            ),
            margin: EdgeInsets.only(
              left: 10,
            ),
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                'TODO',
                style: Theme.of(context).textTheme.displayMedium,
              )),
        ],
      ),
    );
  }
}
