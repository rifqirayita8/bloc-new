import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/paint.dart' as cat;
import '../../domain/entities/profile.dart';
import '../../domain/usecases/dashboard_params.dart';
import '../bloc/dashboard_bloc.dart';

class GetUserPage extends StatelessWidget {
  const GetUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= TextEditingController();
    final paintController= TextEditingController();
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
                        context.read<DashboardBloc>().add(AuthGetProfile(params: DashboardParams(id: userId)));                    
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
                        context.read<DashboardBloc>().add(const ResetProfile());                  
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
            BlocConsumer<DashboardBloc, DashboardState>(
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
                      Text(user.fullName),
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
            Column(
              children: [
                TextFormField(
                  controller: paintController,
                  decoration: const InputDecoration(
                    labelText: 'Paint ID'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final String paintIdString= paintController.text;
                        final int paintId= int.parse(paintIdString);
                        context.read<DashboardBloc>().add(AuthGetPaint(params: DashboardParams(id: paintId)));                    
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
                        context.read<DashboardBloc>().add(const ResetPaint());                  
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
            BlocConsumer<DashboardBloc, DashboardState>(
              listener: (context, state) {
                if (state is PaintSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success'),
                      backgroundColor: Colors.green,
                    )
                  );
                } else if (state is PaintFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              },
              builder: (context, state) {
                if (state is PaintSuccess) {
                  cat.Paint paint= state.paint;
                  return Column(
                    children: [
                      Text(paint.id.toString()),
                      Text(paint.name),
                      Text(paint.year.toString()),
                      Text(paint.color),
                      Text(paint.pantone),
                    ],
                  );
                } else if (state is PaintLoading) {
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