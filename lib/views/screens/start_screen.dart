import 'package:coffee_app_ui/core/constants/colors.dart';
import 'package:coffee_app_ui/core/utils/image_precache.dart';
import 'package:coffee_app_ui/views/screens/home_screen.dart';
import 'package:coffee_app_ui/core/utils/system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool _isLoaded = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        _loadAssets();
      });
    });
  }

  Future<void> _loadAssets() async {
    await precacheAllImages(context);

    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(
        Palette.darkBrown,
        Brightness.light,
        Palette.darkBrown,
        Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Palette.darkBrown,
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  height: 600.h,
                  bottom: -110.h,
                  right: -260.w,
                  child: IgnorePointer(
                    child: RepaintBoundary(
                      child: Image.asset(
                        "assets/images/start-decore.png",
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Coffee',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: ScreenUtil().setSp(83),
                        fontWeight: FontWeight.bold,
                        color: Palette.white,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160.h,
                  left: 22.w,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Haven',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: ScreenUtil().setSp(63),
                        fontWeight: FontWeight.bold,
                        color: Palette.white,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 290.h,
                  left: 22.w,
                  child: AnimatedOpacity(
                    opacity: _isLoaded ? 1 : 0,
                    duration: Durations.long1,
                    child: ElevatedButton(
                      onPressed: _isLoaded
                          ? () {
                              Get.to(
                                () => HomeScreen(),
                                transition: Transition.rightToLeft,
                                duration: Durations.medium4,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        minimumSize: Size(160.w, 60.h),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontFamily: "OpenSansBold",
                          fontSize: ScreenUtil().setSp(17),
                          color: Palette.darkBrown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
