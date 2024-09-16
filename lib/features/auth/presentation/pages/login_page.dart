import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_practice_bloc/features/auth/presentation/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailContoller = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              )
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Success'),
                backgroundColor: Colors.green,
              )
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              children: [
                customTextField(
                  hintText: 'Email', 
                  controller: emailContoller, 
                  isObscure: false
                ),
                customTextField(
                  hintText: 'Password', 
                  controller: passwordController, 
                  isObscure: true
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogin(
                      email: emailContoller.text, 
                      password: passwordController.text
                    ));
                  }, 
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'SUBMIT'
                    ),
                  )
                )
              ],
            )
          );
        },
      ),
    );
  }
}