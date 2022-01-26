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

abstract class BaseStateCollectionWidget<T extends BaseStatefulWidget, B extends BaseBloc> extends BaseStateWidget<T, B> {
  ScrollController? scrollController;
  bool _isLoadingMore = false;

  BaseStateCollectionWidget(){
    scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController != null){
      if (!_isLoadingMore &&
          scrollController!.position.pixels >
              scrollController!.position.maxScrollExtent - 100) {
        onLoadMore();
        _isLoadingMore = true;
      }
    }
  }

  void onLoadMore();
  void onLoadMoreCompleted(){
    _isLoadingMore = false;
  }
}