import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../application/services/auth_service.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.loading());

  final AuthService authService = GetIt.instance.get();

  Future fetchDefaultData() async {
    var data = await authService.defaultData();
    emit(HomeState(data));
  }
}
