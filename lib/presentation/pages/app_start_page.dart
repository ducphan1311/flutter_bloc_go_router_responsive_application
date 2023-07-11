import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../application/services/local_service.dart';
import '../blocs/auth_navigation/auth_navigation_bloc.dart';
import '../blocs/auth_navigation/auth_navigation_state.dart';
import '../blocs/home/home_bloc.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'splash_page.dart';

class AppStartPage extends StatefulWidget {
  static const path = '/app_start_page';
  const AppStartPage({Key? key}) : super(key: key);

  @override
  State<AppStartPage> createState() => _AppStartPageState();
}

class _AppStartPageState extends State<AppStartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
        bloc: context.read<AuthNavigationBloc>(),
        builder: (context, state) {
          return state.when(
              authorized: () => HomePage(),
              unAuthorized: () => LoginPage(),
              guestMode: () => HomePage(),
              loadConfig: () => SplashPage(initializeApp: (context) async {
                    if (GetIt.instance.get<LocalService>().isAuthorized()) {
                      return AuthNavigationState.authorized();
                    } else {
                      return AuthNavigationState.guestMode();
                    }
                  }));
        },
        buildWhen: (stateOld, stateCurrent) {
          return stateOld.runtimeType != stateCurrent.runtimeType;
        },
      ),
    );
  }
}
