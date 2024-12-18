import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:appdientune/src/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/kcolors.dart';
import '../../cart/views/cart_screen.dart';
import '../../home/views/home_screen.dart';
import '../../wishlist/views/wishlist_screen.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishListPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer <TabIndexNotifier>(
        builder: (context, tabIndexNotifier, child){
         return Scaffold (
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Kolors.kOffWhite,
                  ),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    backgroundColor: Kolors.kOffWhite,
                    showSelectedLabels: true,
                    selectedLabelStyle: appStyle(9, Kolors.kPrimary, FontWeight.w500),
                    showUnselectedLabels: false,
                    currentIndex: tabIndexNotifier.index,
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGray,
                    unselectedIconTheme: const IconThemeData(color: Colors.black38),
                    onTap: (i) {
                     tabIndexNotifier.setIndex(i);
                    },
                    items:  [
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index==0? const Icon(
                          AntDesign.home,
                          color: Kolors.kPrimary,
                          size: 24,
                        ): Icon
                          (
                          AntDesign.home,
                          color: Kolors.kPrimary,
                          size: 24
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index==1? const Icon(
                          Ionicons.heart,
                          color: Kolors.kPrimary,
                          size: 24,
                        ): const Icon
                          (
                          Ionicons.heart_outline,
                        ),
                        label: "WishList",
                      ),
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index==2?
                        Badge(
                          label: Text('9'),
                          child:const Icon(
                          MaterialCommunityIcons.shopping,
                          color: Kolors.kPrimary,
                          size: 24,
                        ),
                        )
                            : Badge(
                          label: Text('9'),
                       child:  const Icon
                          (
                          MaterialCommunityIcons.shopping_outline,
                        ),
                        ),
                        label: "Cart",
                      ),

                      BottomNavigationBarItem(
                        icon:tabIndexNotifier.index==3? const Icon(
                          EvilIcons.user,
                          color: Kolors.kPrimary,
                          size: 34,
                        ): const Icon
                          (
                          EvilIcons.user,
                          size: 34,
                        ),
                        label: "Prolofile",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          );
        }
    );
  }
}
