// ignore_for_file: unused_element

import 'package:appdientune/src/categories/views/categories_screen.dart';
import 'package:appdientune/src/categories/views/category_page.dart';
import 'package:appdientune/src/notification/views/notification_screen.dart';
import 'package:appdientune/src/products/views/product_screen.dart';
import 'package:appdientune/src/products/views/shipping_address_screen.dart';
import 'package:appdientune/src/search/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdientune/src/splashscreen/views/splashscreen_page.dart';
import 'package:appdientune/src/entrypoint/views/entrypoint.dart';
import '../../src/auth/views/login_screen.dart';
import '../../src/auth/views/registration_screen.dart';
import '../../src/onboarding/views/onboarding_screen.dart';
import '../../src/products/views/orders_screen.dart';
import '../../src/products/views/policy__screen.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


final GoRouter _router = GoRouter(
   navigatorKey: navigatorKey,
  initialLocation: '/',
  routes:[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>  AppEntryPoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const  OnBoardingScreen(),
    ),
//     GoRoute(
//       path: '/review',
//       builder: (context, state) => const ReviewsPage(),
//     ),
    GoRoute(
      path: '/policy',
      builder: (context, state) => const PolicyPage(),
    ),
//     GoRoute(
//       path: '/verification',
//       builder: (context, state) => const VerificationPage(),
//     ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
//     GoRoute(
//       path: '/help',
//       builder: (context, state) => const HelpCenterPage(),
//     ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesPage(),
    ),
     GoRoute(
      path: '/category',
      builder: (context, state) => const CategoryPage(),
    ),
//
//     GoRoute(
//       path: '/addaddress',
//       builder: (context, state) => const AddAddress(),
//     ),
//
    GoRoute(
      path: '/addresses',
      builder: (context, state) => const ShippingAddress(),
    ),
//
     GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
//
//      GoRoute(
//       path: '/tracking',
//       builder: (context, state) => const TrackOrderPage(),
//     ),
//
//     GoRoute(
//       path: '/checkout',
//       builder: (context, state) => const CheckoutPage(),
//     ),
//
//       GoRoute(
//       path: '/successful',
//       builder: (context, state) => const SuccessfulPayment(),
//     ),
//
//       GoRoute(
//       path: '/failed',
//       builder: (context, state) => const FailedPayment(),
//     ),
//
    GoRoute(
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return ProductPage(productId: productId.toString());
      },
    ),
  ],
);
 GoRouter get router => _router;


