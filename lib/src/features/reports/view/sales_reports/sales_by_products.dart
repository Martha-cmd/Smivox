import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/commons/smivox_search_bar.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';

class ReportsProductsItem {
  final String productsName;
  final String qtySold;
  final String salesDate;
  final String dateCreated;

  ReportsProductsItem({
    required this.productsName,
    required this.qtySold,
    required this.salesDate,
    required this.dateCreated,
  });
}

  class SalesByProducts extends StatefulWidget {
  const SalesByProducts({super.key});

  @override
  State<SalesByProducts> createState() => _SalesByProductsState();
}

class _SalesByProductsState extends State<SalesByProducts> {
  final List<ReportsProductsItem> reportsProductsItems = [
    ReportsProductsItem(
      productsName: 'Hans Poundo Potato ',
      qtySold: '2000',
      salesDate: "2025-04-29 01:00PM",
      dateCreated: "#23,567",
    ),
    ReportsProductsItem(
      productsName: '95A2FFC6',
      qtySold: '2000',
      salesDate: "2025-04-29 01:00PM",
      dateCreated: "#23,567",
    ),
    ReportsProductsItem(
      productsName: '95A2FFC6 ',
      qtySold: '2000',
      salesDate: "2025-04-29 01:00PM",
      dateCreated: "#23,567",
    ),
    ReportsProductsItem(
      productsName: '95A2FFC6 ',
      qtySold: '2000',
      salesDate: "2025-04-29 01:00PM",
      dateCreated: "#23,567",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: 'Sales by Products'),
      body: SingleChildScrollView(
          child: Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                            SmivoxSearchBar(hintText: "Search products"),
                            const SizedBox(height: 24,),
                            CommonMethods.appTexts(context, "Products", fontSize: 16, fontWeight: FontWeight.w600,),
                     ],
                   ),
                 ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reportsProductsItems.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8,),
                  itemBuilder: (context, index) {
                    final item = reportsProductsItems[index];
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
                                    item.productsName,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[800],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  CommonMethods.appTexts(
                                    context,
                                    'Qty Sold: ${item.qtySold}',
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
                                    ' ${item.dateCreated}',
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
                    );
                  },
                ),
              ],
          ),
      ),
    );
  }
}
