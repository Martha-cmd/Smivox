import 'package:flutter/material.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';

class InventoryDash extends StatelessWidget {
  const InventoryDash({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 18,
        children: [
          InventoryDashContainer(dashName: "Total Products", dashNumber: "428,089",),
          InventoryDashContainer(dashName: "Total Cost Price", widget: Row(
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
          )),
          InventoryDashContainer(dashName: "Total Low Stock", dashNumber: "21",),
          InventoryDashContainer(dashName: "Total Out of Stock", dashNumber: "203",),
        ],
      ),
    );
  }
}

class InventoryDashContainer extends StatelessWidget {
  final String dashName;
  final String? dashNumber;
  final Widget? widget;

  const InventoryDashContainer({super.key, required this.dashName, this.dashNumber, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      width: 156,
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
          widget ??
          CommonMethods.appTexts(
            context, dashNumber!,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}