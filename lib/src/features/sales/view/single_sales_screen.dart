import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import 'package:smivox_inventory_software/src/features/sales/components/single_sales_table.dart';

import '../../../commons/app_colors.dart';
import '../components/dash_sales.dart';

class SingleSalesScreen extends StatelessWidget {
  const SingleSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.mainBackground,
       appBar: CustomInAppBar(
          title: "Sales",
       ),
      body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SalesDashContainer(dashName: "Total Products", dashNumber: "4", rightPad: 50,),
                      SizedBox(height: 32),
                      CommonMethods.appTexts(
                          context,
                          "Sale 95A2FFC6",
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),
                    ],
                 ),
               ),
               // SizedBox(height: 24),
               SingleSalesTable(),
             ],
         ),
      ),
    );
  }
}
