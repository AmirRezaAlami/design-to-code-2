import 'package:coffee_app_ui/core/constants/colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../screens/product_screen.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductScreen(),
          arguments: {
            'name': product.name,
            'description': product.description,
            'image': product.image,
            'price': product.price,
            'about': product.about,
          },
          transition: Transition.rightToLeft,
          duration: Durations.medium2,
        );
      },
      child: Container(
        height: 250.h,
        width: 155.w,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: ExtendedImage.asset(
                    product.image,
                    fit: BoxFit.cover,
                    enableLoadState: true,
                    cacheRawData: false,
                    clearMemoryCacheWhenDispose: false,
                    clearMemoryCacheIfFailed: false,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        fontSize: ScreenUtil().setSp(10),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 14.r, right: 14.r, bottom: 14.r),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: TextStyle(
                            fontFamily: 'OpenSansBold',
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor: Palette.darkBrown,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Palette.white,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
