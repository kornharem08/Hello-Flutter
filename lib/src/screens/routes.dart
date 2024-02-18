import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/screens/home/home_screen.dart';
import 'package:flutter_helloworld/src/screens/login/login_screen.dart';
import 'package:flutter_helloworld/src/screens/product/product_screen.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const productDetail = 'product_details_screen';
  static const product = 'product_screen';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        home: (context) => HomeScreen(),
        product: (context) => const ProductScreen()
      };
}
