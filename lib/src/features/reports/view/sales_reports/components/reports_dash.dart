import 'package:flutter/material.dart';

import '../../../../../commons/app_colors.dart';
import '../../../../../commons/common_methods.dart';

class ReportsDash extends StatelessWidget {
  final String? dashName;
  final String? dashNumber;

  const ReportsDash({super.key, this.dashName, this.dashNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right:  10, top: 13, bottom: 13),
      width: double.infinity,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFFC2C2C2).withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonMethods.appTexts(context, dashNumber!, color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonMethods.appTexts(
                context,
                dashName!,
                color: AppColors.inactiveGrey,
                fontSize: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
