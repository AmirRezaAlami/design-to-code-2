import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void selectItem(int index) {
    _currentIndex.value = index;
  }
}
