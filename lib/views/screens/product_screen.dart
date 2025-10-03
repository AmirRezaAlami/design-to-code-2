import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:coffee_app_ui/core/enums/coffee_size_enum.dart';
import 'package:coffee_app_ui/controllers/coffee_size_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/system_overlay.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final Map<String, dynamic> productData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final CoffeeSizeController coffeeSizeController = Get.put(
      CoffeeSizeController(productData['price']),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(
        Colors.white,
        Brightness.dark,
        Palette.white,
        Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Palette.white,
        body: _getBody(context, productData, coffeeSizeController),
      ),
    );
  }

  Widget _getBody(
    BuildContext context,
    Map<String, dynamic> productData,
    CoffeeSizeController coffeeSizeController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ExtendedImage.asset(
                    productData['image'],
                    fit: BoxFit.cover,
                    enableLoadState: true,
                    cacheRawData: false,
                    clearMemoryCacheWhenDispose: false,
                    clearMemoryCacheIfFailed: false,
                  ),
                ),
                Positioned(
                  top: 22.h,
                  left: 22.w,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.r,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 450.h,
                  left: 22.w,
                  right: 22.w,
                  child: _getFloatingContainer(productData),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 430.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: _getProductData(productData, coffeeSizeController),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFloatingContainer(Map<String, dynamic> productData) {
    return BlurryContainer(
      height: 80.h,
      color: Colors.white12,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(15.r),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 12.w,
            child: Text(
              productData['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(30),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 12.w,
            child: Text(
              productData['description'],
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(12),
                fontFamily: 'OpenSans',
                letterSpacing: 1,
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 12.w,
            child: Container(
              width: 46.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: Palette.lightBrown,
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/SVGs/star-icon.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 15.h,
                    width: 15.w,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(12),
                      fontFamily: 'Gidole',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProductData(Map<String, dynamic> productData,
      CoffeeSizeController coffeeSizeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 25.h,
        ),
        _sizeSelection(coffeeSizeController),
        SizedBox(
          height: 25.h,
        ),
        _aboutProduct(productData),
        _addToCartButton(coffeeSizeController),
      ],
    );
  }

  Widget _sizeSelection(CoffeeSizeController coffeeSizeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coffee Size',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(22),
            fontFamily: "OpenSansBold",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Obx(() {
          List<CoffeeSizeEnum> coffeeSizes = CoffeeSizeEnum.values;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: coffeeSizes.map((coffeeSize) {
              return Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        coffeeSizeController.selectedSize == coffeeSize
                            ? Palette.darkBrown
                            : Colors.white,
                    foregroundColor:
                        coffeeSizeController.selectedSize == coffeeSize
                            ? Colors.white
                            : Palette.darkBrown,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    coffeeSize.name.capitalizeFirst!,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    coffeeSizeController.updateSize(coffeeSize);
                  },
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }

  Widget _aboutProduct(Map<String, dynamic> productData) {
    return SizedBox(
      height: 145.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Flexible(
            child: Text(
              productData['about'] ?? '.',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                color: Colors.black,
                wordSpacing: 1,
                height: 1.3,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'Read more',
            style: TextStyle(
              fontFamily: 'OpenSansBold',
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addToCartButton(CoffeeSizeController coffeeSizeController) {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.darkBrown,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          minimumSize: Size(
            100.w,
            75.h,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50.w,
            ),
            Text(
              'Add to cart',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: Text(
                    '\$ ${coffeeSizeController.priceLabel.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontFamily: 'Gidole',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
