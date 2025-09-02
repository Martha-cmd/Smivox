import 'package:flutter/material.dart';

import '../../../../../commons/app_colors.dart';
import '../../../../../commons/common_methods.dart';
import '../../../../../utils/route_path.dart';
import '../../../../sales/components/sales_table.dart';

class ReportsSalesItem {
  final String saleID;
  final String staffName;
  final String salesDate;
  final String salesCost;

  ReportsSalesItem({
    required this.saleID,
    required this.staffName,
    required this.salesDate,
    required this.salesCost,
  });
}


class ReportsSalesTable extends StatelessWidget {
  final List<SalesItem> reportsSalesItems = [
    SalesItem(
      saleID: '95A2FFC6 ',
      staffName: 'Miriam Chinelo',
      salesDate: "2025-04-29 01:00PM",
      salesCost: "#23,567",
    ),
    SalesItem(
      saleID: '95A2FFC6',
      staffName: 'Miriam Chinelo',
      salesDate: "2025-04-29 01:00PM",
      salesCost: "#23,567",
    ),
    SalesItem(
      saleID: '95A2FFC6 ',
      staffName: 'Miriam Chinelo',
      salesDate: "2025-04-29 01:00PM",
      salesCost: "#23,567",
    ),
    SalesItem(
      saleID: '95A2FFC6 ',
      staffName: 'Miriam Chinelo',
      salesDate: "2025-04-29 01:00PM",
      salesCost: "#23,567",
    ),
  ];

  ReportsSalesTable({super.key});

  void _showActionMenu(BuildContext context, SalesItem item, Offset tapPosition) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final screenWidth = MediaQuery.of(context).size.width;

    final RelativeRect position = RelativeRect.fromLTRB(
      screenWidth - 2, // Left position (screen width minus menu width)
      tapPosition.dy,    // Top position (same as tap position)
      screenWidth,       // Right position (screen edge)
      overlay.size.height - tapPosition.dy, // Bottom position
    );

    showMenu(
      context: context,
      position: position,
      color: Color(0xFFF3F3F3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.only(right: 30, left: 10),
          value: 'view',
          child: Row(
            children: [
              Text('View Sales'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'return',
          child: Row(
            children: [
              Text('Return Item'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'print',
          child: Row(
            children: [
              Text('Print Receipt'),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        _handleMenuAction(value, item, context);
      }
    });
  }

  void _handleMenuAction(String action, SalesItem item, BuildContext context) {
    switch (action) {
      case 'view':
        CommonMethods.sendToNextScreen(context, RoutesPath.singleSalesScreen);
        print('View Sales: ${item.saleID}');
        // Navigate to view sales screen
        break;
      case 'return':
        print('Return Item: ${item.saleID}');
        // Show return item dialog
        break;
      case 'print':
        print('Print Receipt: ${item.saleID}');
        // Handle print receipt
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reportsSalesItems.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = reportsSalesItems[index];
                  return GestureDetector(
                    onTapDown: (details) {
                      _showActionMenu(context, item, details.globalPosition);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          // horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Number badge
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: AppColors.success,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Sales Info
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonMethods.appTexts(
                                    context,
                                    'Sales: ${item.saleID}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[800],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  CommonMethods.appTexts(
                                    context,
                                    'Staff: ${item.staffName}',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  CommonMethods.appTexts(
                                    context,
                                    'POS',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
                                    ' ${item.salesCost}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  CommonMethods.appTexts(
                                    context,
                                    item.salesDate,
                                    fontSize: 12,
                                    color: AppColors.inactiveGrey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}
