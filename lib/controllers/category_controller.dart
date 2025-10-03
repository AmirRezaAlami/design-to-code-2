import 'package:coffee_app_ui/models/category_model.dart';
import 'package:coffee_app_ui/data/category_samples.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final List<CategoryModel> _categoriesList;
  final RxInt _selectedCategoryIndex = 0.obs;

  CategoryController() : _categoriesList = getCategories();

  List<CategoryModel> get categoriesList => _categoriesList;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;
  CategoryModel get selectedCategory =>
      _categoriesList[_selectedCategoryIndex.value];

  @override
  void onInit() {
    super.onInit();
    if (_categoriesList.isNotEmpty) {
      _selectedCategoryIndex.value = 0;
    }
  }

  void selectCategory(int index) {
    _selectedCategoryIndex.value = index;
  }
}
