import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';

class ReturnHistory {
  final String saleID;
  final String staffName;
  final String salesTotal;
  final bool isCompleted;
  final String dateCreated;

  ReturnHistory ({
    required this.staffName,
    required this.dateCreated,
    required this.saleID,
    required this.salesTotal,
    required this.isCompleted,
  });
}


class ReturnHistorySummary extends StatefulWidget {
  const ReturnHistorySummary({super.key});

  @override
  State<ReturnHistorySummary> createState() => _ReturnHistorySummaryState();
}

class _ReturnHistorySummaryState extends State<ReturnHistorySummary> {
  final List<ReturnHistory> returnHistoryItems = [
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: true,
    ),
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: true,
    ),
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: false,
    ),
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: true,
    ),
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: true,
    ),
    ReturnHistory(
      saleID: "#95A2FFC6",
      staffName: 'Ada Amira',
      salesTotal: "#23,567",
      dateCreated: "2025-04-29 01:00PM",
      isCompleted: true,
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: 'Return History'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CommonMethods.appTexts(context, "Return History", fontSize: 16, fontWeight: FontWeight.w600,),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: returnHistoryItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8,),
              itemBuilder: (context, index) {
                final item = returnHistoryItems[index];
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
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: item.isCompleted ? AppColors.success : AppColors.error,
                                    ),
                                  ),
                                  CommonMethods.appTexts(
                                    context,
                                    ' ${item.salesTotal}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                             ),
                              const SizedBox(height: 4),
                              CommonMethods.appTexts(
                                context,
                                item.dateCreated,
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
