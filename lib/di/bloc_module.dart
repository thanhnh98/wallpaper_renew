import 'package:wallpaper/bloc/home_bloc.dart';

import 'get_it.dart';

void registerBlocModule(get) async{
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}