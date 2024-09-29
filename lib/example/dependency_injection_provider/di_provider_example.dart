import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'center_container.dart';
import 'counter_cubit_three.dart';
import 'next_page.dart';

class DiProviderExample extends StatelessWidget {
  const DiProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubitThree myCounter= context.read<CounterCubitThree>();
    return Scaffold(
      appBar: AppBar(
        title: Text('DI Provider Example'),
      ),
      body: Column(
        children: [
          CenterContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.decrement();
                  },
                  child: Icon(Icons.remove),
                ),
              ),
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.increment();
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: myCounter,
                child: const NextPage(),
              )
            )
          );
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}