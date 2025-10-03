import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/product_model.dart';
import '../../core/constants/colors.dart';

class SpecialOfferWidget extends StatelessWidget {
  const SpecialOfferWidget({super.key, required this.specialOffer});
  final ProductModel specialOffer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        height: 155.h,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: RepaintBoundary(
                    child: ExtendedImage.asset(
                      specialOffer.image,
                      fit: BoxFit.cover,
                      enableLoadState: true,
                      cacheRawData: true,
                      clearMemoryCacheIfFailed: false,
                      clearMemoryCacheWhenDispose: false,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: Palette.lightBrown,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "Discount Sales",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: ScreenUtil().setSp(10),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            specialOffer.description,
                            style: TextStyle(
                              fontFamily: 'OpenSansBold',
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.bold,
                              height: 1.5.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$ 7.15',
                            style: TextStyle(
                              fontFamily: 'OpenSansBold',
                              fontSize: ScreenUtil().setSp(16),
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
