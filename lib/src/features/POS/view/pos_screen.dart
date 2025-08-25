import 'package:flutter/material.dart';


class POS extends StatefulWidget {
  const POS({super.key});

  @override
  State<POS> createState() => _POSState();
}

class _POSState extends State<POS> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('POS Screen', style: TextStyle(color: Colors.black),));
  }
}
