import 'dart:ui';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utiles/app_assets.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/widgets/customButton.dart';
import 'package:todoapp/feature/task/data/models/taskModel.dart';
import 'package:todoapp/feature/task/presentation/cubit/taskCubit.dart';
import 'package:todoapp/feature/task/presentation/cubit/taskeStase.dart';
import 'package:todoapp/feature/task/presentation/screens/add_task_screen.dart';

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
          child: BlocBuilder<taskCubit,taskState>(builder: (context,state){
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                          style: Theme.of(context).textTheme.displayLarge),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<taskCubit>(context).changeTheme();
                        },
                        icon: Icon(
                          Icons.mode_night,
                          color: BlocProvider.of<taskCubit>(context).isDark
                              ? AppColor.withe
                              : AppColor.background,
                        ),
                      )
                    ],
                  ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.displayLarge,
              ),
             
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColor.primary,
                  selectedTextColor: Colors.white,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                  onDateChange: (date) {
                       
                      BlocProvider.of<taskCubit>(context).getSelectedDate(date);
                     
                  },
                ),
            
              const SizedBox(
                height: 20,
              ),
             
           BlocProvider.of<taskCubit>(context).taskList.isEmpty?  noTaskScreen(context): Expanded(
              child: ListView.builder(
                itemCount:BlocProvider.of<taskCubit>(context).taskList.length ,
                itemBuilder: (context,indx){
            return   InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(24),
                              height: 240,
                              color: AppColor.deepgrey,
                              child: Column(
                                children: [
                                     BlocProvider.of<taskCubit>(
                                                              context)
                                                          .taskList[indx]
                                                          .isCombleted ==
                                                      1
                                                  ? Container()
                                                  :
                                  SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: CustomButton(
                                          onpressed: () async{
                                         BlocProvider.of<taskCubit>(context).UpdatTasks( BlocProvider.of<taskCubit>(context).taskList[indx].id);
                                  print(   ( BlocProvider.of<taskCubit>(context).taskList[indx].id));
                                     print(   ( BlocProvider.of<taskCubit>(context).taskList[indx].title));
                                    
                                    Navigator.pop(context);
                                          },
                                          text: AppString.taskCompleted)),
                                          const SizedBox(height: 20,),
                                           SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: CustomButton(
                                        color: AppColor.red,
                                          onpressed: () {
                                             BlocProvider.of<taskCubit>(context).deletTasks( BlocProvider.of<taskCubit>(context).taskList[indx].id);
                                               Navigator.pop(context);
                                          },
                                          text: AppString.deleteTask)),
                                           const SizedBox(height: 20,),
                                           SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: CustomButton(
                                          onpressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: AppString.cancel)),
                                ],
                              ),
                            );
                          });
                    },
                    child:  TaskCombonent(taskModel: BlocProvider.of<taskCubit>(context).taskList[indx],));
              }),
            ),
            ],
          );
          },)
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddTaskScreen();
            }));
          },
          child: const Icon(
            Icons.add,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}

Column noTaskScreen (BuildContext context) {
   {
    return  Column(
        children: [
          Image.asset(AppImage.Checklist),
          Text(
            textAlign:TextAlign.center,
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
      
    );
  }
}

class TaskCombonent extends StatelessWidget {
   TaskCombonent({super.key,required this.taskModel});
TaskModel taskModel;
Color getcolor(int indx) {
    switch (indx) {
      case 0:
        return AppColor.red;
      case 1:
        return AppColor.green;
      case 2:
        return AppColor.bluegrey;
      case 3:
        return AppColor.blue;
      case 4:
        return AppColor.orange;
      case 5:
        return AppColor.purple;
      default:
        return AppColor.background;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 128,
      decoration: BoxDecoration(
        color: getcolor(taskModel.color!),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: AppColor.withe,
                    ),
                    Text(
                      ' ${taskModel.startTime} ' ' ${taskModel.startTime}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayLarge,
                )
              ],
            ),
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.only(
              left: 10,
            ),
            child: const VerticalDivider(
              thickness: 1,
              color: AppColor.withe,
            ),
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
            taskModel.isCombleted==1?'Completed'.toString():'To Do',
                style: Theme.of(context).textTheme.displayMedium,
              )),
        ],
      ),
    );
  }
}
