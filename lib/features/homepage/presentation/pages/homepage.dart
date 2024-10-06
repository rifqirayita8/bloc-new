import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/bloc/homepage_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomepageBloc>().add(HomepageGetProfile());
    context.read<HomepageBloc>().add(HomepageGetResource());
    context.read<HomepageBloc>().add(HomepageGetAddress());
    context.read<HomepageBloc>().add(HomepageGetProfileList());
    context.read<HomepageBloc>().add(HomepageGetResourceList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<HomepageBloc, HomepageState>(
            builder: (context, state) {
              if (state is HomepageLoading) {
                return const CircularProgressIndicator();
              } else if (state is HomepageLoaded) {
                return Column(
                  children: [
                    Text(state.user),
                    Text(state.resource),
                    Text(state.address),
                  ],
                );
              } else if(state is HomepageFailure) {
                return const Text('Failed to load data');
              }
              return const SizedBox.shrink();
            },
          ),
          Expanded(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              builder: (context, state) {
                if (state is HomepageLoading) {
                  return const CircularProgressIndicator();
                } else if (state is HomepageLoaded) {
                  return ListView.builder(
                    itemCount: state.userList.length,
                    itemBuilder: (context, index) {
                      final user= state.userList[index];
                      return ListTile(
                        title: Text(user.firstName),
                        subtitle: Text(user.email),
                      );
                    },
                  );
                } else if(state is HomepageFailure) {
                  return const Text('Failed to load data');
                }
                return const SizedBox.shrink();
              }
            ),
          ),
          Expanded(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              builder: (context, state) {
                if (state is HomepageLoading) {
                  return const CircularProgressIndicator();
                } else if (state is HomepageLoaded) {
                  return ListView.builder(
                    itemCount: state.resourceList.length,
                    itemBuilder: (context, index) {
                      final resource= state.resourceList[index];
                      return ListTile(
                        title: Text(resource.name),
                        subtitle: Text(resource.year.toString()),
                      );
                    }
                  );
                }
                return const SizedBox.shrink();
              }
            ),
          ),
        ],
      ),
    );
  }
}
