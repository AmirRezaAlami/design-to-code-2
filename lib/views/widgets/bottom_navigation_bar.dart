import 'package:coffee_app_ui/controllers/bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavbarController _controller = Get.put(BottomNavbarController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 65,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: Colors.green[800],
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontFamily: 'OpenSansBold',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'OpenSansBold',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
            ),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                  size: ScreenUtil().setSp(24),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(
                  Icons.favorite_outline,
                  size: ScreenUtil().setSp(24),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: ScreenUtil().setSp(24),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Person',
                icon: Icon(
                  Icons.person_outlined,
                  size: ScreenUtil().setSp(22),
                ),
              ),
            ],
            currentIndex: _controller.currentIndex,
            onTap: _controller.selectItem,
          ),
        ));
  }
}
