import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

T? injectedBloc<T extends Cubit>(BuildContext context) {
  T? bloc;
  bloc = context.read()<T>();
  return bloc;
}
