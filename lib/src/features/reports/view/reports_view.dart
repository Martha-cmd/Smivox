import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../commons/app_colors.dart';


class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomInAppBar(title: "Reports"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               /// Sales
               CommonMethods.appTexts(
                   context,
                   "Sales",
                 fontWeight: FontWeight.w500,
                 fontSize: 18,
               ),
               const SizedBox(height: 20),
               Column(
                 spacing: 24,
                  children: [
                    ReportsTab(reportItem: "Sales by Customer", onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.salesByCustomer),),
                    ReportsTab(reportItem: "Sales by Products", onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.salesByProducts),),
                    ReportsTab(reportItem: "Sales by Staff", onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.salesByStaff),),
                    ReportsTab(reportItem: "Return History Summary", onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.returnHistorySummary),),
                    const SizedBox(height: 34),
                  ],
               ),

               /// Inventory
               CommonMethods.appTexts(
                 context,
                 "Inventory",
                 fontWeight: FontWeight.w500,
                 fontSize: 18,
               ),
               const SizedBox(height: 20),
               ReportsTab(reportItem: "Inventory Summary",  onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.inventorySummaryReport),),
               const SizedBox(height: 34),

               /// Tamper Attempts
               CommonMethods.appTexts(
                 context,
                 "Tamper Attempts",
                 fontWeight: FontWeight.w500,
                 fontSize: 18,
               ),
               const SizedBox(height: 20),
               ReportsTab(reportItem: "Tamper Attempts Summary",  onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.tamperSummaryReport),)
             ],
         ),
      ),
    );
  }
}


class ReportsTab extends StatelessWidget {
  final String reportItem;
  final VoidCallback? onTap;

  const ReportsTab({super.key, required this.reportItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC2C2C2).withOpacity(0.2)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset("assets/svgs/star.svg"),
                CommonMethods.appTexts(
                  context,
                  reportItem,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
            Icon(Icons.chevron_right_sharp)
          ],
        ),
      ),
    );
  }
}

