
import 'package:todoapp/core/utiles/app_assets.dart';
import 'package:todoapp/core/utiles/app_string.dart';

class onBordingModel{
  
final String imagPath;
final String title;
final String subtitle;
onBordingModel({required this.imagPath,required this.subtitle,required this.title});
static List <onBordingModel>onBording_screens=[
onBordingModel(imagPath: AppImage.on1, subtitle: AppString.onst1, title: AppString.ont1),
onBordingModel(imagPath: AppImage.on2, subtitle: AppString.onst2, title: AppString.ont2),
onBordingModel(imagPath: AppImage.on3, subtitle: AppString.onst3, title: AppString.ont3),
];


}