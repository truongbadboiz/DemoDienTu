import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/common/widgets/email_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/back_button.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/password_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage ({super.key});
  @override
  State<RegistrationPage > createState() => _RegistrationPageState();

}
class _RegistrationPageState extends State<RegistrationPage>{
  @override
  Widget build(BuildContext context) {
    late final TextEditingController _usernameController=
    TextEditingController();
    late final TextEditingController _emailController=
    TextEditingController();
    late final TextEditingController _passwordController=
    TextEditingController();
    final FocusNode _passwordNode = FocusNode();
    void dispose()
    {
      _usernameController.dispose();
      _passwordController.dispose();
      _passwordNode.dispose();
      super.dispose();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const AppBackButton(),
      ),
      body: ListView (
          children:[
            SizedBox(height: 160.h),
            Text("PMT app",
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),),
            SizedBox(height: 10.h),
            Text("Hi! Welcome back.You've been  missed!",
              textAlign: TextAlign.center,
              style: appStyle(13, Kolors.kGray, FontWeight.normal),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                child : Column(
                  children: [
                    EmailTextField(
                      radius:25,
                      hintText: "Username",
                      controller: _usernameController,
                      prefixIcon:const Icon(CupertinoIcons.profile_circled,size:20,color: Kolors.kGray,),
                      keyboardType: TextInputType.name,//passed
                      onEditingComplete: (){
                        FocusScope.of(context).requestFocus(_passwordNode);
                      },
                    ),
                    SizedBox(height: 25.h),
                    EmailTextField(
                      radius:25,
                      focusNode: _passwordNode,
                      hintText: "Email",
                      controller: _emailController,
                      prefixIcon:const Icon(CupertinoIcons.mail,size:20,color: Kolors.kGray,),
                      keyboardType: TextInputType.emailAddress,//passed
                      onEditingComplete: (){
                        FocusScope.of(context).requestFocus(_passwordNode);
                      },
                    ),
                    SizedBox(height: 25.h),
                    PasswordField( controller: _passwordController, focusNode: _passwordNode, radius: 25),
                    SizedBox(height: 20.h),
                    CustomButton(
                        onTap: (){},
                        text:"S i G N  U P",btnWidth:ScreenUtil().screenWidth,btnHieght:40,radius:20)
                  ],
                )
            )
          ]
      ),

    );
  }

}