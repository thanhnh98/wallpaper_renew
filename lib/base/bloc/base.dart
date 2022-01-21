import 'package:flutter_bloc/flutter_bloc.dart';


abstract class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);

  void dispose() {}
}

class BaseEvent{
  BaseEvent();
  factory BaseEvent.initial() => BaseEvent();
}

class BaseState{

}


// ViewState: Data
class DataViewState<T> extends BaseState {
  T? data;
  DataViewState(this.data);
}

class DataViewStateInitial<T> extends DataViewState<T> {
  DataViewStateInitial() : super(null);
}

class DataViewStateLoad<T> extends DataViewState<T> {
  DataViewStateLoad(T data) : super(data);
}

// ViewState: Data list

class DataListViewState<T> extends DataViewState<List<T>> {
  int? index;
  DataListViewState(
      List<T>? data, {
        this.index,
      }) : super(data);
}

class DataListViewStateLoad<T> extends DataListViewState<T> {
  DataListViewStateLoad(List<T> data) : super(data);
}

class DataListViewStateUpdate<T> extends DataListViewState<T> {
  DataListViewStateUpdate(List<T> data) : super(data);
}

class DataListViewStateSelect<T> extends DataListViewState<T> {
  DataListViewStateSelect(
      List<T>? data,
      int selectedIndex,
      ) : super(
    data,
    index: selectedIndex,
  );
}

class DataListViewStateInitial<T> extends DataListViewState<T> {
  DataListViewStateInitial() : super(null);
}

class DataListViewStateLoading<T> extends DataListViewState<T> {
  DataListViewStateLoading() : super(null);
}

class DataListViewStateAdd<T> extends DataListViewState<T> {
  DataListViewStateAdd(List<T> data) : super(data);
}