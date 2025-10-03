import 'package:coffee_app_ui/data/product_samples.dart';

import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  return [
    CategoryModel(
      name: 'Cappucino',
      image: 'assets/SVGs/cappuccino-icon.svg',
      productsList: getCappuccinoList(),
    ),
    CategoryModel(
      name: 'Cold Brew',
      image: 'assets/SVGs/cold-brew-icon.svg',
      productsList: getColdBrewList(),
    ),
    CategoryModel(
      name: 'Espresso',
      image: 'assets/SVGs/espresso-icon.svg',
      productsList: getEspressoList(),
    ),
  ];
}
