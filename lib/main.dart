import 'package:flutter/material.dart';
import 'package:my_practice_bloc/example/kue_cubit/cubit_example.dart';
import 'package:my_practice_bloc/example/stream/stream_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CubitExample(),
    );
  }
}
