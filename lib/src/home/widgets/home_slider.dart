import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/common/widgets/custom_button.dart';
import 'package:appdientune/common/widgets/reusable_text.dart';
import 'package:appdientune/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart' ;
import 'package:cached_network_image/cached_network_image.dart';

import '../../../common/utils/kstrings.dart';
class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight *0.16,
            width: ScreenUtil().screenWidth ,
            child: ImageSlideshow(
              indicatorColor: Kolors.kPrimaryLight,
              onPageChanged:(p){

              },
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(images.length,(i)
                {
                  return CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: images[i],
                    fit:BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Positioned(child: SizedBox(
            height: ScreenUtil().screenHeight *0.16,
            width: ScreenUtil().screenWidth ,
            child : Padding(padding:EdgeInsets.symmetric(horizontal: 20.w),
            child : Column (
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.start,
               children: [
                  ReusableText(text:AppText.kCollection,style:appStyle(20,Kolors.kDark,FontWeight.w600)),
                  SizedBox(
                    height: 5.h,
                  ),
                 Text('Discount 50% \n the first transaction',style: appStyle(14, Kolors.kDark.withOpacity(.6), FontWeight.normal),),
                 SizedBox(
                   height: 10.h,
                 ),
                 CustomButton(
                   text: "Shop now",
                   btnWidth: 150.w,
                 )
                ],

    ),

            )
          )),
        ],
      )
    );
  }
}
List<String> images = [
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhappyphone.vn%2Fdien-thoai-apple%2F&psig=AOvVaw3XbaXzjLzjD-JnyvHKgPxG&ust=1734339975231000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPiI4IK2qYoDFQAAAAAdAAAAABAE",
  "http://d326fntlu7tble.cloudfront.net/uploads/1.webp",
  "http://d326fntlu7tble.cloudfront.net/uploads/1.webp",
  "http://d326fntlu7tble.cloudfront.net/uploads/1.webp",
];

