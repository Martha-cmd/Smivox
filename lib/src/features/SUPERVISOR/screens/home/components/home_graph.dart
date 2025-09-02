import 'package:flutter/material.dart';

class HomeGraph extends StatelessWidget {
  const HomeGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 251,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
