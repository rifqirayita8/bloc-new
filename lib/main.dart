import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/pages/lazy_loading.dart';
import 'package:my_practice_bloc/observer.dart';
import 'example/bloc_builder/bloc_builder_consumer_example.dart';
import 'example/dependency_injection_provider/counter_cubit_three.dart';
import 'example/dependency_injection_provider/di_provider_example.dart';
import 'example/kue_cubit/cubit_example.dart';
import 'example/stream/stream_example.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = MyObserver();
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
        BlocProvider(create: (context) => myInjection<DashboardBloc>()),
        BlocProvider(create: (context) => myInjection<HomepageBloc>())
      ],
      child: const MaterialApp(
        home: LazyLoading(),
      ),
    );
  }
}
