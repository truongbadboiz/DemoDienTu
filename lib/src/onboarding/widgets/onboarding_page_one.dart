import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/utils/kstrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_style.dart';
import '../../../const/resource.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth ,
      height: ScreenUtil().screenHeight,
        child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_EXPERIENCE_PNG, fit: BoxFit.cover,),
          Positioned(
              bottom: 180,
              left: 30,
              right: 30,
              child: Text(
                AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(11,Kolors.kGray,FontWeight.normal),
          ))
        ],
     ),
    );
  }
}