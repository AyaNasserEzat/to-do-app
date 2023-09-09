import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/app.dart';
import 'package:todoapp/core/database/chach/chach_helper.dart';
import 'package:todoapp/core/database/sqlite/sqflite_helper.dart';
import 'core/services/services_locator.dart';
import 'feature/task/presentation/cubit/taskCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().intiDB();
  runApp(
    BlocProvider(create: (context) => taskCubit()..getTasks(),
    
     child: const MyApp()),
  );
}
