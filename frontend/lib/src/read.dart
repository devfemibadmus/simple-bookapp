import 'package:flutter/material.dart';


class ReadPage extends StatelessWidget {
  const ReadPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //
          },
          child: const Text('Reading...'),
        ),
      )
      );
  }
}

