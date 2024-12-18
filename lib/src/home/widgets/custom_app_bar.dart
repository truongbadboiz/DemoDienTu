import 'package:appdientune/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/widgets/reusable_text.dart';
import 'notification_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: ReusableText(
              text: "Location",
              style: appStyle(12, Kolors.kGray, FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                size: 16,
                color: Kolors.kPrimary,
              ),
              SizedBox(
                width: ScreenUtil().screenWidth * 0.7,
                child: Text(
                  "Please select your location",
                  maxLines: 1,
                  style: appStyle(14, Kolors.kDark, FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [NotificationWidget()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            context.push('/search');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Kolors.kGrayLight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: ScreenUtil().screenWidth - 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            size: 20,
                            color: Kolors.kPrimaryLight,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          ReusableText(
                            text: "Search Product",
                            style: appStyle(14, Kolors.kGray, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w), // Khoảng cách giữa hai container
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Kolors.kPrimary,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    FontAwesome.sliders,
                    color: Kolors.kWhite,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
