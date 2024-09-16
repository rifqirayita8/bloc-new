import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/example/dependency_injection_provider/counter_cubit_three.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: BlocBuilder(
        bloc: context.read<CounterCubitThree>(),
        builder: (context, state) {
          return Center(
            child: Text(
              '$state',
              style: TextStyle(fontSize: 60),
            ),
          );
        },
      ),
    );
  }
}