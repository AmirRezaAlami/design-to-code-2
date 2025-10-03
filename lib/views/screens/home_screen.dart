import 'package:coffee_app_ui/models/category_model.dart';
import 'package:coffee_app_ui/models/product_model.dart';
import 'package:coffee_app_ui/views/widgets/bottom_navigation_bar.dart';
import 'package:coffee_app_ui/views/widgets/product_card_widget.dart';
import 'package:coffee_app_ui/views/widgets/special_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/category_controller.dart';
import '../../core/utils/system_overlay.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_app_ui/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(
        Palette.white,
        Brightness.dark,
        Palette.white,
        Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Palette.white,
        body: _getBody(categoryController),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget _getBody(CategoryController categoryController) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              _getHeader(),
              SizedBox(height: 15.h),
              _getSearchBar(),
              SizedBox(height: 25.h),
              _getMenu(categoryController),
              SizedBox(height: 25.h),
              _getSpecialOffer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Palette.lightBrown,
            ),
            SizedBox(
              height: 28.h,
              width: 28.w,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      "assets/SVGs/bell-icon.svg",
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: ScreenUtil().setSp(8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Text(
          "Good evening, Monica",
          style: TextStyle(
            fontFamily: "Gidole",
            fontSize: ScreenUtil().setSp(22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _getSearchBar() {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: IgnorePointer(
        child: SearchBar(
          hintText: "Search Coffee ...",
          hintStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: "Gidole",
              fontSize: ScreenUtil().setSp(15),
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: 'OpenSans',
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Palette.grey),
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 15.w),
          ),
          leading: Icon(
            Icons.search,
            size: ScreenUtil().setSp(25),
          ),
          trailing: [
            CircleAvatar(
              backgroundColor: Palette.darkBrown,
              radius: 18.r,
              child: SvgPicture.asset(
                "assets/SVGs/filter-icon.svg",
                height: 22.h,
                width: 22.w,
              ),
            ),
          ],
          textInputAction: TextInputAction.none,
        ),
      ),
    );
  }

  Widget _getMenu(CategoryController categoryController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontFamily: "Gidole",
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        _categoriesRow(categoryController),
        SizedBox(height: 28.h),
        _productsList(categoryController),
      ],
    );
  }

  Widget _categoriesRow(CategoryController categoryController) {
    List<CategoryModel> categories = categoryController.categoriesList;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        categories.length,
        (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => categoryController.selectCategory(index),
              child: Obx(() {
                int selectedCategoryIndex =
                    categoryController.selectedCategoryIndex;
                return AnimatedContainer(
                  duration: Durations.short2,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: selectedCategoryIndex == index
                        ? Palette.darkBrown
                        : Palette.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        categories[index].image,
                        height: 30.h,
                        width: 30.w,
                        colorFilter: ColorFilter.mode(
                          selectedCategoryIndex == index
                              ? Palette.white
                              : Palette.darkBrown,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          fontFamily: "OpenSansBold",
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.bold,
                          color: selectedCategoryIndex == index
                              ? Palette.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _productsList(CategoryController categoryController) {
    return Obx(() {
      List<ProductModel> products =
          categoryController.selectedCategory.productsList;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: GridView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 15,
            childAspectRatio: 155.w / 255.h,
          ),
          itemBuilder: (context, index) {
            return ProductCardWidget(
              product: products[index],
            );
          },
        ),
      );
    });
  }

  Widget _getSpecialOffer() {
    const ProductModel specialOffer = ProductModel(
      name: 'ice flowered cappuccino',
      image: 'assets/images/special-offer.png',
      price: '7.15',
      description:
          'Get two ice flowered cappuccinos, only for \$ 7.15 Dollars!',
      about: '-',
    );
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                "Special Offer",
                style: TextStyle(
                  fontFamily: 'Gidole',
                  fontSize: ScreenUtil().setSp(19),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(
                'assets/SVGs/fire-emoji.png',
                height: 20.h,
                width: 20.w,
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const SpecialOfferWidget(specialOffer: specialOffer),
        ],
      ),
    );
  }
}
