import 'package:appdientune/common/services/storage.dart';
import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/utils/kstrings.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/common/widgets/reusable_text.dart';
import 'package:appdientune/src/products/widgets/explore_product.dart';
import 'package:flutter/material.dart';

import '../../auth/views/login_screen.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});
  @override
  Widget build(BuildContext context) {
    String?  accessToken =Storage().getString('access_token');
    if (accessToken == null) {
      return const LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(text:AppText.kWishlist,style: appStyle(16, Kolors.kWhite, FontWeight.bold),),
      ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
        child:  const ExploreProduct(),
        ),
    );
  }
}