import 'package:flutter/material.dart';



class Spacing16 extends StatelessWidget {
  const Spacing16({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return const SizedBox(
      height: 16,
    );
  }
}