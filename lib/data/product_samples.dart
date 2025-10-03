//List of some products to show under each category

import '../models/product_model.dart';

List<ProductModel> getCappuccinoList() {
  return [
    ProductModel(
      name: "Cappuccino",
      image: "assets/images/cappuccino-one.png",
      price: "4.08",
      description: "with chocolate",
      about:
          'Cappuccino is an espresso-based drink that combines rich espresso with steamed milk and a thick layer of frothy milk foam. '
          'Typically served in a 6-ounce cup, known for its creamy texture and balanced flavor.',
    ),
    ProductModel(
      name: "Cappuccino",
      image: "assets/images/cappuccino-two.png",
      price: "5.35",
      description: "with chocolate & milk",
      about:
          'Cappuccino is an espresso-based drink that combines rich espresso with steamed milk and a thick layer of frothy milk foam. '
          'Typically served in a 6-ounce cup, known for its creamy texture and balanced flavor.',
    ),
  ];
}

List<ProductModel> getColdBrewList() {
  return [
    ProductModel(
      name: "Iced Americano",
      image: "assets/images/iced-americano.png",
      price: "3.93",
      description: "with additional syrup",
      about:
          'Iced Americano is a refreshing cold coffee drink made by diluting espresso with cold water and ice. '
          'which results in a milder, less intense coffee experience,'
          'while still retaining its deep and full-bodied flavor.',
    ),
  ];
}

List<ProductModel> getEspressoList() {
  return [
    ProductModel(
      name: "Espresso",
      image: "assets/images/espresso-cup.png",
      price: "4.88",
      description: "single shot",
      about:
          'Espresso is the foundation of many coffee drinks, known for its rich and intense flavor. '
          'Made by forcing hot water through finely-ground coffee beans at high pressure, resulting in a concentrated shot of coffee. '
          'This process creates a small, strong cup of coffee, typically served in a 1-ounce shot.',
    ),
  ];
}
