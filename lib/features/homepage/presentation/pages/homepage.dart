import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/bloc/homepage_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomepageBloc>().add(HomepageGetProfile());
    context.read<HomepageBloc>().add(HomepageGetResource());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          if (state is HomepageSuccess) {
            return Column(
              children: [
                Text('Name: ${state.profile}'),
                Text('Resource: ${state.resource}'),
              ],
            );
          } else if (state is HomepageFailure) {
            return Text('Error: ${state.message}');
          } else if (state is HomepageLoading) {
            return const CircularProgressIndicator();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
