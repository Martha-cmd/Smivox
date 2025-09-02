import 'package:flutter/material.dart';
import '../../../../../commons/app_colors.dart';
import '../../../../../commons/smivox_inapp_bar.dart';
import '../../../../inventory/components/dash_inventory.dart';

class TamperSummaryView extends StatefulWidget {
  const TamperSummaryView({super.key});

  @override
  State<TamperSummaryView> createState() => _TamperSummaryViewState();
}

class _TamperSummaryViewState extends State<TamperSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: 'Tamper Attempts Summary'),
      backgroundColor: AppColors.mainBackground,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child:
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16,
                    children: [
                      InventoryDashContainer(dashName: "Total Attempts", dashNumber: "428,009", rightPad: 50),
                      InventoryDashContainer(dashName: "No of products sold", dashNumber: "4,728,009", rightPad: 50),
                      InventoryDashContainer(dashName: "No of verified products", dashNumber: "21,4578",),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
