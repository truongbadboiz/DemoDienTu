import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/utils/kstrings.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/resource.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth ,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_WISHLIST_PNG,
            fit: BoxFit.cover,),
          Positioned(
              bottom: 180,
              left: 30,
              right: 30,
              child: Text(
                AppText.kOnboardWishListMessage,
                textAlign: TextAlign.center,
                style: appStyle(11,Kolors.kGray,FontWeight.normal),
              ))
        ],
      ),
    );
  }
}