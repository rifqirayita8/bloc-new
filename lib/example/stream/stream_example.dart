import 'package:flutter/material.dart';

Stream<int> _counterStream() async* {
  for (int i=0; i<=10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

class StreamExample extends StatelessWidget {
  const StreamExample({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild kang');
    //jika pakai stream, maka yang direbuild cuma yang diperlukan
    //beda kalau stateful, rebuild semua
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StreamBuilder<int>(
            stream: _counterStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    'Loading...'
                  ),
                );
              } else {
              return Center(
                child: Text(
                  '${snapshot.data}'
                ),
              );
              }
            }
          ),
        ],
      ),
    );
  }
}