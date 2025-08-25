import 'package:flutter/material.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button_with_icon.dart';
import '../../../commons/smivox_search_bar.dart';

class SalesItem {
  final String saleID;
  final String staffName;
  final String salesDate;
  final String salesCost;

  SalesItem({
    required this.saleID,
    required this.staffName,
    required this.salesDate,
    required this.salesCost,
  });
}

class SalesTable extends StatelessWidget {
  final List<SalesItem> salesItems = [
    SalesItem(
      saleID: '95A2FFC6 ',
      staffName: 'Miriam Chinelo',
      salesDate: "2025-04-29 01:00PM",
      salesCost: "#23,567",
    ),
    SalesItem(
      saleID: '95A2FFC6 o',
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

  SalesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SmivoxButtonWithIcon(
                    widget: Icon(Icons.add, color: Colors.white),
                    text: "New",
                    horPad: 5,
                    verPad: 8,
                  ),
                  const SizedBox(width: 10),
                  SmivoxButtonWithIcon(
                    widget: Icon(Icons.more_horiz, color: Colors.white),
                    text: "Actions",
                    verPad: 8,
                    horPad: 5,
                  ),
                  const SizedBox(width: 10),
                  SmivoxButtonWithIcon(
                    widget: Icon(Icons.filter_list, color: AppColors.primary),
                    bckgrndColor: Colors.transparent,
                    borderColor: AppColors.primary,
                    horPad: 5,
                    verPad: 8,
                    text: "Filters",
                    textColor: AppColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SmivoxSearchBar(hintText: "Search sales",),
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: salesItems.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = salesItems[index];
                  return Container(
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
                        children: [
                          // Number badge
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Color(0xFF0484C0),
                            ),
                            child: Center(
                              child: Icon(Icons.check, color: Colors.white, size: 30,)
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Sales Info
                          Expanded(
                              flex: 3,
                              child: Expanded(
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
                                        fontWeight: FontWeight.w600
                                    ),
                                  ],
                                ),
                              )
                          ),

                          // Sales Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonMethods.appTexts(
                                context,
                                ' ${item.salesCost}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(height: 4),
                              CommonMethods.appTexts(
                                context,
                                item.salesDate,
                                  fontSize: 12,
                                  color: AppColors.inactiveGrey
                              ),
                            ],
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

        const SizedBox(height: 8),

      ],
    );
  }
}