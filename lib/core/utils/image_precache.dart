import 'package:flutter/material.dart';

const List<String> _allImagesPath = [
  'assets/images/start-decore.png',
  'assets/images/cappuccino-one.png',
  'assets/images/cappuccino-two.png',
  'assets/images/iced-americano.png',
  'assets/images/espresso-cup.png',
  'assets/images/special-offer.png',
];
Future<void> precacheAllImages(BuildContext context) async {
  for (final path in _allImagesPath) {
    precacheImage(AssetImage(path), context);
  }
}
