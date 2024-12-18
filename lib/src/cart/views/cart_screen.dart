import 'package:flutter/material.dart';

import '../../../common/services/storage.dart';
import '../../auth/views/login_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    String?  accessToken =Storage().getString('access_token');
    if (accessToken == null) {
      return const LoginPage();
    }
    return Scaffold(
        body: Center(
          child: Text("CartPage"),
        )
    );
  }
}