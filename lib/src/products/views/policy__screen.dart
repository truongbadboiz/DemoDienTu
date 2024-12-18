import 'package:appdientune/common/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/utils/kstrings.dart';
import '../../../common/widgets/app_style.dart';
import '../../../common/widgets/reusable_text.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const AppBackButton(),
        title: ReusableText(text: AppText.kPolicy, style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: Padding(padding:EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children:[
          SizedBox(height:12.h),
          ReusableText(text: AppText.kCancelation, style: appStyle(13, Kolors.kGray ,FontWeight.normal)),
          SizedBox(height:12.h),
          Text(AppText.kAppCancelationPolicy, textAlign:TextAlign.justify,style: appStyle(13, Kolors.kPrimary, FontWeight.normal)),
          SizedBox(height:12.h),
          ReusableText(text: AppText.kAppTerms, style: appStyle(13, Kolors.kGray ,FontWeight.normal)),
        ]
      ))
    );
  }
}
