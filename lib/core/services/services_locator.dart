
import 'package:get_it/get_it.dart';
import 'package:todoapp/core/database/chach/chach_helper.dart';


final sl = GetIt.instance;
Future<void> setup()async {
sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());  

}