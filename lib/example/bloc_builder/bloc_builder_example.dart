import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitTwo extends Cubit<int> {
  CounterCubitTwo({required this.initialState}) : super(initialState);

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

class BlocBuilderExample extends StatelessWidget {
  const BlocBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubitTwo counterCubitTwo= CounterCubitTwo(initialState: 12);
    print('rebuild kang');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<CounterCubitTwo, int>(
            bloc: counterCubitTwo,
            buildWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  '$state'
                )
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterCubitTwo.decrement();
                },
                child: Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterCubitTwo.increment();
                },
                child: Text('Increment'),
              )
            ],
          )
        ],
      ),
    );
  }
}