// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/pages/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = 'admin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'รหัส')),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                  ),
                  const SizedBox(height: 20.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [..._buiildButtons()],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleReset() {
    _emailController.text = '';
    _passwordController.text = '';
  }

  _buiildButtons() {
    return [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
            onPressed: _handleLogin, child: const Text('เข้าสู่ระบบ')),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: OutlinedButton(
            onPressed: _handleReset, child: const Text('ล้างข้อมูล')),
      ),
    ];
  }
}
