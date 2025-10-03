import 'package:coffee_app_ui/core/utils/device_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:coffee_app_ui/views/screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugRepaintRainbowEnabled = true;
  lockOrientation();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        title: 'Coffee App - UI #2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "OpenSans",
        ),
        home: StartScreen(),
      ),
    );
  }
}
