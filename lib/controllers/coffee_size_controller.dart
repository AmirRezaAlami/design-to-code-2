import 'package:coffee_app_ui/core/enums/coffee_size_enum.dart';
import 'package:get/get.dart';

class CoffeeSizeController extends GetxController {
  final String _initialPrice;
  double _initalPriceDouble = 0.0;

  final Rx<CoffeeSizeEnum> _selectedSize = CoffeeSizeEnum.medium.obs;
  final RxDouble _priceLabel = (0.0).obs;

  CoffeeSizeEnum get selectedSize => _selectedSize.value;
  double get priceLabel => _priceLabel.value;

  CoffeeSizeController(
    this._initialPrice,
  );

  @override
  void onInit() {
    super.onInit();
    if (_initialPrice.isNotEmpty) {
      _initalPriceDouble = double.tryParse(_initialPrice) ?? 0.0;
    }

    _priceLabel.value = _initalPriceDouble;
  }

  void updateSize(CoffeeSizeEnum size) {
    _selectedSize.value = size;

    switch (size) {
      case CoffeeSizeEnum.small:
        _priceLabel.value = _initalPriceDouble * 0.66;
        break;
      case CoffeeSizeEnum.medium:
        _priceLabel.value = _initalPriceDouble * 1;
        break;
      case CoffeeSizeEnum.large:
        _priceLabel.value = _initalPriceDouble * 1.33;
        break;
    }
  }
}
