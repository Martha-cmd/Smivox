import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SpinnerView extends StatelessWidget {
   final Color? bgColor;
   final Color? color;
  const SpinnerView({super.key, this.bgColor, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.getScaffoldColor(context),
      backgroundColor: bgColor ?? Colors.black54,
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 20,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
