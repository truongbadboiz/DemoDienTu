import 'package:appdientune/common/services/storage.dart';
import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/common/widgets/help_bottom_sheet.dart';
import 'package:appdientune/common/widgets/reusable_text.dart';
import 'package:appdientune/src/auth/views/login_screen.dart';
import 'package:appdientune/src/profile/widget/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/kstrings.dart';
import '../../../common/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    String?  accessToken =Storage().getString('access_token');
    if (accessToken == null) {
      return const LoginPage();
    }
    return Scaffold(
        body: ListView(
          children:[
            Column(
              children:[
                SizedBox(
                  height:30.h,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Kolors.kOffWhite,
                  backgroundImage:NetworkImage(AppText.kProfilePic)

                ),
                SizedBox(
                  height:15.h,
                ),
                ReusableText(text: "pmt@gmail.com", style: appStyle(11, Kolors.kGray, FontWeight.normal)),
                SizedBox(
                  height:7.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration:BoxDecoration(
                    color:Kolors.kOffWhite,
                    borderRadius: BorderRadius.circular(10),

                  ) ,
                  child: ReusableText(text: "PMT", style: appStyle(14, Kolors.kDark, FontWeight.w600)),
                )
              ],
            ),
            SizedBox(
                height:30.h,
            ),
            Container(
              color: Kolors.kOffWhite,
              child: Column(
                children: [

                  ProfileTileWidget(title:' My Oders',leading: Octicons.checklist,onTap:(){
                    context.push('/orders');
                  },),
                  ProfileTileWidget(title:'Shipping Address ',leading:MaterialIcons.location_pin,onTap:(){
                    context.push('/address');
                  },),
                  ProfileTileWidget(title:'Privacy Policy',leading: MaterialIcons.policy,onTap:(){
                    context.push('/policy');
                  },),
                  ProfileTileWidget(title:' Help Center',leading: AntDesign.customerservice,onTap:()=> showHelpCenterBottomSheet(context),),
                ],
              )
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
           child: CustomButton(text:"Logout".toUpperCase(), btnColor: Kolors.kRed,
             btnHieght: 35.h,
             btnWidth: ScreenUtil().screenWidth,),
    ),
          ],

        ),
    );
  }
}