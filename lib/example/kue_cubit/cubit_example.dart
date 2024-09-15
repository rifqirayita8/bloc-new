import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(this.initialState) : super(initialState); 
  
  int initialState;

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

class CubitExample extends StatelessWidget {
  const CubitExample({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit= CounterCubit(10);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StreamBuilder<int>(
            initialData: counterCubit.initialState,
            stream: counterCubit.stream,
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  '${snapshot.data}'
                ),
              );
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterCubit.increment();
                },
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterCubit.decrement();
                },
                child: Text('Decrement'),
              )
            ],
          )
        ],
      ),
    );
  }
}