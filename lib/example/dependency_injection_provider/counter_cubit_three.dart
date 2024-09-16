import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitThree extends Cubit<int> {
  CounterCubitThree() : super(0); 

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print('error $error, stackTrace $stackTrace');
  }
}