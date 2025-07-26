import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SpinnerView extends StatelessWidget {
  const SpinnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.getScaffoldColor(context),
      backgroundColor: Colors.black54,
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 20,
        ),
      ),
    );
  }
}
