import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/utiles/app_string.dart';
import 'package:todoapp/core/widgets/customButton.dart';
import 'package:todoapp/feature/task/presentation/component/addTask.dart';
import 'package:todoapp/feature/task/presentation/cubit/taskCubit.dart';
import 'package:todoapp/feature/task/presentation/cubit/taskeStase.dart';

import '../../../../core/commons/commons.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        automaticallyImplyLeading: false,
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<taskCubit, taskState>(listener: (context, state) {
            if (state is sucessInsertState) {
                 showToast(
                    message: 'Added Sucessfully', state: ToastStates.success);
              Navigator.pop(context);
            }
          }, builder: (context, state) {
            return Form(
              key: BlocProvider.of<taskCubit>(context).formKey,
              child: SizedBox(
                height: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addTaskComponent(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'enter valid value';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            BlocProvider.of<taskCubit>(context).titlecontroller,
                        hinttext: AppString.textTitleHint,
                        text: AppString.title),
                    const SizedBox(
                      height: 20,
                    ),
                    addTaskComponent(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'enter valid value';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            BlocProvider.of<taskCubit>(context).notcontroller,
                        hinttext: AppString.textnoteeHint,
                        text: AppString.note),
                    const SizedBox(
                      height: 20,
                    ),
                    addTaskComponent(
                      readOnly: true,
                      hinttext: DateFormat.yMd().format(
                          BlocProvider.of<taskCubit>(context).currentDate),
                      text: 'Date',
                      sufix: IconButton(
                        onPressed: () async {
                          BlocProvider.of<taskCubit>(context).getDate(context);
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: AppColor.withe,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: addTaskComponent(
                              readOnly: true,
                              hinttext:
                                  BlocProvider.of<taskCubit>(context).startTime,
                              text: AppString.startTime,
                              sufix: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<taskCubit>(context)
                                      .getStartTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColor.withe,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: addTaskComponent(
                              readOnly: true,
                              hinttext:
                                  BlocProvider.of<taskCubit>(context).endTime,
                              text: 'end time',
                              sufix: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<taskCubit>(context)
                                      .getEndTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColor.withe,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, indx) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<taskCubit>(context)
                                      .changeColorIndx(indx);
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      BlocProvider.of<taskCubit>(context)
                                          .getcolor(indx),
                                  child: BlocProvider.of<taskCubit>(context)
                                              .currentIndx ==
                                          indx
                                      ? const Icon(
                                          Icons.check,
                                          color: AppColor.withe,
                                        )
                                      : null,
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    State is loadingInsertState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ))
                        : SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: CustomButton(
                                onpressed: () async {
                                  if (BlocProvider.of<taskCubit>(context)
                                      .formKey
                                      .currentState!
                                      .validate()) {
                               BlocProvider.of<taskCubit>(context)
                                        .insertTask();
                                  }
                                },
                                text: 'creat Task'),
                          ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
