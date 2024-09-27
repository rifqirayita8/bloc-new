import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetUserPage extends StatelessWidget {
  const GetUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Profile Page'),
      ),
      body: const Center(
        child: Text('Get Profile Page'),
      ),
    );
  }
}