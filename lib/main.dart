import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/example/bloc_builder/bloc_builder_consumer_example.dart';
import 'package:my_practice_bloc/example/dependency_injection_provider/counter_cubit_three.dart';
import 'package:my_practice_bloc/example/dependency_injection_provider/di_provider_example.dart';
import 'package:my_practice_bloc/example/kue_cubit/cubit_example.dart';
import 'package:my_practice_bloc/example/stream/stream_example.dart';
import 'package:my_practice_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_practice_bloc/features/auth/presentation/pages/login_page.dart';
import 'package:my_practice_bloc/features/dashboard/presentation/bloc/profile_bloc.dart';
import 'package:my_practice_bloc/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubitThree()),
        BlocProvider(create: (context) => myInjection<AuthBloc>()),
        BlocProvider(create: (context) => myInjection<ProfileBloc>(),)
      ],
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
