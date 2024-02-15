import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/pages/home/home_page.dart';
import 'package:flutter_helloworld/src/pages/login/login_page.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        home: (context) => const HomePage()
      };
}
