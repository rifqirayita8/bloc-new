import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/example/bloc_builder/bloc_builder_consumer_example.dart';
import 'package:my_practice_bloc/example/dependency_injection_provider/counter_cubit_three.dart';
import 'package:my_practice_bloc/example/dependency_injection_provider/di_provider_example.dart';
import 'package:my_practice_bloc/example/kue_cubit/cubit_example.dart';
import 'package:my_practice_bloc/example/stream/stream_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubitThree(),
      child: MaterialApp(
        home: DiProviderExample(),
      ),
    );
  }
}
