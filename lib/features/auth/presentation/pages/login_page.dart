import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/pages/lazy_loading.dart';
import '../../../../core/services/shared_preferences.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_text_field.dart';
import '../../../dashboard/presentation/pages/get_user_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailContoller = TextEditingController();
    final passwordController = TextEditingController();
    final urlController = TextEditingController();

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
          } else if (state is SetUrlFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              )
            );
          } else if (state is SetUrlSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
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
                  hintText: 'Set URL', 
                  controller: urlController, 
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthSetUrl(url: urlController.text.trim()));
                  }, 
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'Set URL',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
                customTextField(
                  hintText: 'Email', 
                  controller: emailContoller, 
                ),
                customTextField(
                  hintText: 'Password', 
                  controller: passwordController, 
                  isObscure: true
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthLogout());
                      }, 
                      child: Container(
                        color: Colors.blue,
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final url= await SharedPreferencesHelper().getUrl();
                    print('Get URL: $url');
                  }, 
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'cek khodam',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GetUserPage()));
                  }, 
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'Pindah page',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LazyLoading()));
                  },
                  child: const Text('Lazy Loading',)
                )
              ],
            )
          );
        },
      ),
    );
  }
}