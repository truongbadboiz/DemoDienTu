import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/common/widgets/reusable_text.dart';
import 'package:appdientune/const/constants.dart';
import 'package:appdientune/src/categories/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class  HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
    child: SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(categories.length, (i)
          {
          final category = categories[i];
            return GestureDetector(
            onTap: () {
              context.read<CategoryNotifier>().setCategory(category.title,category.id);
              context.push('/category');

          },
              child:SizedBox(
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Kolors.kSecondaryLight,
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child:SvgPicture.network(category.imageUrl,width:40.w,height:40.h),
                      ),

                    ),
                    ReusableText(text:category.title,style:appStyle(12, Kolors.kDark, FontWeight.normal)),
                  ]
                )
              )
            );
          }
      )
    )
    )
    );
  }
}
