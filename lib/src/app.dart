import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/bloc/product/product_bloc.dart';
import 'package:flutter_helloworld/src/screens/login/login_screen.dart';
import 'package:flutter_helloworld/src/screens/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorState = GlobalKey<NavigatorState>();

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final productBlock = BlocProvider(create: (context) => ProductBloc());

    return MultiBlocProvider(
      providers: [productBlock],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: AppRoute.all,
        home: const LoginPage(),
        navigatorKey: navigatorState,
      ),
    );
  }
}
