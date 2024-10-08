import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit_three.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CounterCubitThree>(context),
      builder: (context, state) {
        return Center(
          child: Text(
            '$state',
            style: TextStyle(fontSize: 60),
          ),
        );
      },
    );
  }
}
