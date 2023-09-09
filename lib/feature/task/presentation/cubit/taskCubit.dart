
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/database/sqlite/sqflite_helper.dart';
import 'package:todoapp/core/services/services_locator.dart';
import 'package:todoapp/feature/task/presentation/cubit/taskeStase.dart';

import '../../../../core/database/chach/chach_helper.dart';
import '../../../../core/utiles/app_color.dart';
import '../../data/models/taskModel.dart';

class taskCubit extends Cubit<taskState> {
  taskCubit() : super(InialTaskState());
  String startTime = DateFormat('hh:mm: a').format(DateTime.now());
  String endTime = DateFormat('hh:mm: a').format(DateTime.now());
  int currentIndx = 0;
  DateTime currentDate = DateTime.now();
   DateTime selctedDate = DateTime.now();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController notcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  void getDate(context) async {
    emit(loadingTaskState());
    DateTime? currentDatePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (currentDatePicker != null) {
      currentDate = currentDatePicker;
      emit(sucessesTaskState());
    } else {
      emit(erorrTaskState());
    }
  }

  void getStartTime(context) async {
    emit(loadingStartTaskState());
    TimeOfDay? startTimePicker = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (startTimePicker != null) {
      emit(sucessesStartTaskState());
      startTime = startTimePicker.format(context);
    } else {
      emit(erorrStartTaskState());
    }
  }

  void getEndTime(context) async {
    emit(loadingEndTaskState());
    TimeOfDay? endTimePicker = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (endTimePicker != null) {
      endTime = endTimePicker.format(context);
      emit(sucessesEndTaskState());
    } else {
      emit(erorrEndTaskState());
    }
  }

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

  void changeColorIndx(indx) {
    currentIndx = indx;
    emit(changeTColorsaskState());
  }
    void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selctedDate = date;

    emit(GetSelectedDateSucessState());
    getTasks();
  }

  List<TaskModel> taskList = [];

  void insertTask() async{
    emit(loadingInsertState());

  try {
// int insertedId= 
 await sl<SqfliteHelper>().insertToDB(TaskModel(
    title: titlecontroller.text,
    startTime: startTime,
    endTime: endTime,
    note: notcontroller.text,
    color: currentIndx,
    date: DateFormat.yMd().format(currentDate),
    isCombleted: 0,));

  titlecontroller.clear();
  notcontroller.clear();
  emit(sucessInsertState());
   getTasks();

   print('task list linfth ${taskList.length}');
} on Exception {
  emit(errorInsertState());
}
  }
  void getTasks()async{
    emit(loadingGetState());
    await sl<SqfliteHelper>().getFromDB().then((value)  
{    
taskList = value
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where(
            (element) => element.date == DateFormat.yMd().format(selctedDate),
          )
          .toList();
  emit(sucessGetState());
}
    ).catchError((e){
print(e.toString());
emit(errorGetState());
    });
  }
 
void UpdatTasks( id)async{
  if(id==null){
    emit(errorUpdateState());
    return;
  }
    emit(loadingUpdateState());
    await sl<SqfliteHelper>().updatedDB(id).then((value)  
{    
  emit(sucessupdateState());
   getTasks();
}
    ).catchError((e){
print(e.toString());
emit(errorUpdateState());
    });
  }

  void deletTasks( id)async{
     if(id==null){
    emit(errorDeletState());
    return;
  }
    emit(loadingDeletState());
    await sl<SqfliteHelper>().deleteFromDB(id).then((value)  
{    
  emit(sucessSDlettate());
   getTasks();
}
    ).catchError((e){
print(e.toString());
emit(errorDeletState());
    });
  }
bool isDark = false;
  void changeTheme() async {
    isDark = !isDark;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
  }
 void getTheme()async{
  isDark =await sl<CacheHelper>().getData(key: 'isDark');
  emit(GetThemeState());
 }

}
