import 'package:flutter/material.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';

class SalesDash extends StatelessWidget {
  const SalesDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 18,
      children: [
        SalesDashContainer(dashName: "Total No of Sales", dashNumber: "428,089",),
        SalesDashContainer(dashName: "Total Sales", widget: Row(
          spacing: 5,
          children: [
            CommonMethods.appTexts(
              context,
              "NGN",
              color: AppColors.success,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
            CommonMethods.appTexts(
              context,
              "4,528,059",
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ],
        ),),
      ],
    );
  }
}

class SalesDashContainer extends StatelessWidget {
  final String dashName;
  final String? dashNumber;
  final Widget? widget;
  final double? rightPad;

  const SalesDashContainer({super.key, required this.dashName, this.dashNumber, this.widget, this.rightPad});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      padding: EdgeInsets.only(left: 10, right: rightPad ?? 10, top: 13, bottom: 13),
      // width: 156,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonMethods.appTexts(context, dashName, color: AppColors.inactiveGrey),
          widget ?? CommonMethods.appTexts(
            context,
            dashNumber!,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}