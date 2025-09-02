import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';
import 'components/reports_dash.dart';
import 'components/reports_sales_table.dart';


class SalesByCustomer extends StatefulWidget {
  const SalesByCustomer({super.key});

  @override
  State<SalesByCustomer> createState() => _SalesByCustomerState();
}

class _SalesByCustomerState extends State<SalesByCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomInAppBar(title: 'Sales by Customer'),
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                       SmivoxInputFields(
                          headText: "Search Customer",
                          headTextColor: AppColors.inactiveInput,
                          hintText: "Miriam Ann",
                         hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                         suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.inactiveGrey,),
                         fillColor: Color(0xFFC2C2C2).withOpacity(0.2)
                       ),
                       SizedBox(height: 24),
                       Row(
                         spacing: 16,
                          children: [
                              Expanded(child: ReportsDash(dashNumber: "100", dashName: "No of items bought",)),
                              Expanded(child: ReportsDash(dashNumber: "0", dashName: "No of items returned",)),
                          ],
                       ),
                      SizedBox(height: 34),
                      CommonMethods.appTexts(context, "Sales", fontSize: 16, fontWeight: FontWeight.w600,),
                   ],
                ),
              ),
              ReportsSalesTable(),
            ],
          ),
       ),
    );
  }
}








