import 'package:flutter/material.dart';
import 'package:todoapp/app/app.dart';
import 'package:todoapp/core/database/chach/chach_helper.dart';

import 'core/services/services_locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
 await sl<CacheHelper>().init();
  runApp(const MyApp());
}



