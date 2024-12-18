import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/src/products/controllers/colors_sizes_notifier.dart';
import 'package:appdientune/src/products/controllers/product_notifiler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class   ProductSizesWidget  extends StatelessWidget {
  const ProductSizesWidget  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsSizesNotifier>
      (
      builder: (context, controller, child) {
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: List.generate(
               context. read<ProductNotifier>().product!.sizes.length, (i) {
                 String s = context.read<ProductNotifier>().product!.sizes[i];
                 return GestureDetector(
                   onTap: () {
                     controller.setSizes( s);
                   },
                   child:Container (
                     height: 30.h,
                     width: 45.h,
                     decoration: BoxDecoration(
                       color: controller.sizes== s ? Kolors.kPrimary: Kolors.kGrayLight,
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: Center(
                       child: Text(s, style: appStyle (20, Kolors.kWhite, FontWeight.bold),),
                     ),
                   )
                 );
               }),
         );
      }
    );
  }
}
