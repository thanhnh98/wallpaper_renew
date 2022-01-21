import 'package:flutter/widgets.dart';
import 'package:wallpaper/base/bloc/base.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({key}) : super(key: key);
}

abstract class ViewBloc<E extends BaseEvent, S extends BaseState> extends BaseBloc<E, S> {
  ViewBloc(S initialState) : super(initialState);

  void load() {}
}

abstract class BaseStateWidget<T extends BaseStatefulWidget, B extends BaseBloc> extends State<T> {
  B? _bloc;

  B? get bloc => _bloc;

  @override
  void initState() {
    // Init bloc
    _bloc = initBloc();
    if (_bloc == null) {
      throw "Bloc is not init yet";
    }

    super.initState();
  }

  B? initBloc();

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }
}