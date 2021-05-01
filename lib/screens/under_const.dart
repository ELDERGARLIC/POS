import 'package:flutter/material.dart';

class UnderConst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: Container(
          child: Text(
            "\n\nTHE PAGE IS NOT READY READY!\n\n -OR- \n\nAN ERROR OCCURED!",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
