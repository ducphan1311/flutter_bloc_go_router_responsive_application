import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  static const path = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ElevatedButton(onPressed: () async {
             await context.read<AuthBloc>().login('userName', 'passWord');
          }, child: Text('LogIn')),
        ),
      ),
    );
  }
}
