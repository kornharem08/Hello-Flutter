import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/bloc/product/product_bloc.dart';
import 'package:flutter_helloworld/src/pages/login/login_page.dart';
import 'package:flutter_helloworld/src/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
    );
  }
}
