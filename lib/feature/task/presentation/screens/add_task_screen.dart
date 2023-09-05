import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utiles/app_color.dart';
import 'package:todoapp/core/utiles/app_string.dart';
import 'package:todoapp/core/widgets/customButton.dart';
import 'package:todoapp/feature/task/presentation/component/addTask.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String startTime = DateFormat('hh:mm: a').format(DateTime.now());
  String endTime = DateFormat('hh:mm: a').format(DateTime.now());
  int currentIndx=0;
  DateTime currentDate= DateTime.now();
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
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addTaskComponent(
                hinttext: AppString.textTitleHint, text: AppString.title),
            SizedBox(
              height: 20,
            ),
            addTaskComponent(
                hinttext: AppString.textnoteeHint, text: AppString.note),
            SizedBox(
              height: 20,
            ),
            addTaskComponent(
              readOnly: true,
              hinttext: DateFormat.yMd().format(currentDate),
              text: 'Date',
              sufix: IconButton(
                onPressed: () async{
         DateTime?     currentDatePicker= await  showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                      if(currentDatePicker!=null){
                        setState(() {
                          currentDate=currentDatePicker;
                        });
                      }
                },
                icon: Icon(Icons.calendar_month_outlined),
                color: AppColor.withe,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: addTaskComponent(
                    readOnly: true,
                    hinttext: startTime,
                    text: AppString.startTime,
                    sufix: IconButton(
                      onPressed: ()async {
                  TimeOfDay?  startTimePicker=await  showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()));
                                if(startTimePicker!=null){
                                  setState(() {
                                    startTime=startTimePicker.format(context);
                                  });
                                }
                      },
                      icon: Icon(
                        Icons.timer_outlined,
                        color: AppColor.withe,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: addTaskComponent(
                    readOnly: true,
                    hinttext: endTime,
                    text: 'end time',
                    sufix: IconButton(
                      onPressed: () async {
                        TimeOfDay? endTimePicker=await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()));
                                 if(endTimePicker!=null){
                                  setState(() {
                                    endTime=endTimePicker.format(context);
                                  });
                                }
                      },
                      icon: Icon(
                        Icons.timer_outlined,
                        color: AppColor.withe,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context,indx){
                  Color getcolor(int indx){
                        switch(indx){
                          case 0:return AppColor.red;
                          case 1: return AppColor.green;
                             case 2:return AppColor.bluegrey;
                          case 3: return AppColor.blue;
                            case 4:return AppColor.orange;
                          case 5: return AppColor.purple;
                          default:return AppColor.background;
                        }
                        }
                  
                return Padding(
                  padding: const EdgeInsets.only(right :8.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndx=indx;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: getcolor(indx),
                      child:currentIndx==indx? Icon(Icons.check,color: AppColor.withe,):null,
                    ),
                  ),
                );
                
  }),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: CustomButton(onpressed: () {}, text: 'creat Task'),
            ),
          ],
        ),
      ),
    );
  }
}
