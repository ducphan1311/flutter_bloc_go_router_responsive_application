import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef InitializeApp = Future<AuthNavigationState> Function(BuildContext context);

class SplashPage extends StatefulWidget {
  static const path = '/splash_page';
  const SplashPage({Key? key, required this.initializeApp}) : super(key: key);
  final InitializeApp initializeApp;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.initializeApp(context).then((state) {
      if(mounted) {
        context.read<AuthNavigationBloc>().setState(state);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
