import 'package:flutter/material.dart';

import 'content.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.amber,
        child: Content()
      ),
    );
  }
}
