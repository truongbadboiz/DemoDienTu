import 'package:appdientune/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import '../../../common/utils/kcolors.dart';
import '../controllers/onboarding_notifier.dart';
import '../widgets/onboarding_page_one.dart';
import '../widgets/onboarding_page_two.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo PageController với trang bắt đầu từ OnboardingNotifier
    _pageController = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedPage,
    );
  }

  @override
  void dispose() {
    // Đảm bảo giải phóng bộ nhớ khi widget bị hủy
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              // Cập nhật trạng thái trang hiện tại
              context.read<OnboardingNotifier>().setSelectedPage = page;
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreenTwo(),
              WelcomeScreen(),
            ],
          ),
          context.watch<OnboardingNotifier>().selectedPage == 2 ? SizedBox.shrink() :  Positioned(
            bottom: 50.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: ScreenUtil().screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  context.watch<OnboardingNotifier>().selectedPage == 0 ? SizedBox(
                width:25,
              ) :
              GestureDetector(
                onTap: (){
                  _pageController.animateToPage(
                      context
                          .read<OnboardingNotifier>()
                          .selectedPage - 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
                child:  Icon(
                  AntDesign.leftcircleo,
                  color: Kolors.kPrimary,
                  size: 30,
                ),
              ),
              SizedBox(
                width: ScreenUtil().screenWidth * 0.7,
                height: 50.h,
                child: PageViewDotIndicator(
                  currentItem:
                  context.watch<OnboardingNotifier>().selectedPage,
                  count: 3,
                  unselectedColor: Colors.black26,
                  selectedColor: Kolors.kPrimary,
                  duration: const Duration(milliseconds: 200),
                  onItemClicked: (index) {
                    // Di chuyển đến trang được chọn
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: (){
                  _pageController.animateToPage(
                      context
                          .read<OnboardingNotifier>()
                          .selectedPage +1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
                child:Icon(
                  AntDesign.rightcircleo,
                  color: Kolors.kPrimary,
                  size: 30,
                ),
              ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}