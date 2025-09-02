import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';
import '../../../../commons/smivox_input_fields.dart';
import 'components/reports_dash.dart';

class SalesByStaffItem {
  final String staffName;
  final String totalSales;
  final String salesPriceTotal;
  final String dateCreated;

  SalesByStaffItem ({
    required this.staffName,
    required this.totalSales,
    required this.salesPriceTotal,
    required this.dateCreated,
  });
}


class SalesByStaff extends StatefulWidget {
  const SalesByStaff({super.key});

  @override
  State<SalesByStaff> createState() => _SalesByStaffState();
}

class _SalesByStaffState extends State<SalesByStaff> {
  final List<SalesByStaffItem> reportsStaffSalesItems = [
    SalesByStaffItem(
      staffName: 'Ada Amira',
      totalSales: '2000',
      dateCreated: "2025-04-29 01:00PM",
      salesPriceTotal: "#23,567",
    ),
    SalesByStaffItem(
      staffName: 'Ada Amira',
      totalSales: '2000',
      dateCreated: "2025-04-29 01:00PM",
      salesPriceTotal: "#23,567",
    ),
    SalesByStaffItem(
      staffName: 'Ada Amira ',
      totalSales: '2000',
      dateCreated: "2025-04-29 01:00PM",
      salesPriceTotal: "#23,567",
    ),
    SalesByStaffItem(
      staffName: 'Ada Amira ',
      totalSales: '2000',
      dateCreated: "2025-04-29 01:00PM",
      salesPriceTotal: "#23,567",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: 'Sales by Staff'),
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
                      headText: "Search Staff",
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
                      Expanded(child: ReportsDash(dashNumber: "100", dashName: "Sales",)),
                      Expanded(child: ReportsDash(dashNumber: "0", dashName: "Returned items",)),
                    ],
                  ),
                  SizedBox(height: 34),
                  CommonMethods.appTexts(context, "Sales", fontSize: 16, fontWeight: FontWeight.w600,),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reportsStaffSalesItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8,),
              itemBuilder: (context, index) {
                final item = reportsStaffSalesItems[index];
                final backgroundColor = index % 2 == 0
                    ? Colors.white
                    : Color(0xFFC2C2C2).withOpacity(0.1);
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Number badge
                        CommonMethods.appTexts(
                          context,
                          '${index + 01}',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 12),

                        /// Product
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonMethods.appTexts(
                                context,
                                item.staffName,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              CommonMethods.appTexts(
                                context,
                                'Total Sales: ${item.totalSales}',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),

                        // Sales Date
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CommonMethods.appTexts(
                                context,
                                ' ${item.salesPriceTotal}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              CommonMethods.appTexts(
                                context,
                                "System generated",
                                fontSize: 12,
                                color: AppColors.inactiveGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
