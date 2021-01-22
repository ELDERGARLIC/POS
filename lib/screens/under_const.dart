import 'package:flutter/material.dart';

class UnderConst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: Container(
          child: Text("NOT READY!", style: TextStyle(fontSize: 50),),
        ),
      ),
    );
  }
}
