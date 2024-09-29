import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/profile/domain/entities/profile.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';
import 'package:my_practice_bloc/features/profile/presentation/bloc/profile_bloc.dart';

class GetUserPage extends StatelessWidget {
  const GetUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Profile Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'User ID'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final String userIdString= controller.text;
                        final int userId= int.parse(userIdString);
                        context.read<ProfileBloc>().add(GetProfile(params: GetUserParams(id: userId)));                    
                      },
                      child: Container(
                        color: Colors.blue,
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(const ResetProfile());                  
                      },
                      child: Container(
                        color: Colors.blue,
                        child: const Text(
                          'RESET',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success'),
                      backgroundColor: Colors.green,
                    )
                  );
                } else if (state is ProfileFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              },
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  Profile user= state.profile;
                  return Column(
                    children: [
                      Text(user.id.toString()),
                      Text(user.first_name),
                      Text(user.last_name),
                      Text(user.email),
                      Text(user.avatar),
                    ],
                  );
                } else if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              } 
            ),
          ],
        ),
      ),
    );
  }
}