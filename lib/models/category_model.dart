import 'product_model.dart';

class CategoryModel {
  final String name;
  final String image;
  final List<ProductModel> productsList;

  CategoryModel({
    required this.name,
    required this.image,
    required this.productsList,
  });
}
