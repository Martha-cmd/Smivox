import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/commons/smivox_filter.dart';
import 'package:smivox_inventory_software/src/commons/smivox_search_bar.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/add_product_dialog.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/single_product_page.dart';
import '../../../commons/smivox_page_title.dart';
import '../components/dash_inventory.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SmivoxPageTitle(pageTitle: "Inventory"),

                const SizedBox(height: 16),
                InventoryDash(),
              ],
            ),
          ),
          const SizedBox(height: 26),
          InventoryTable(),
        ],
      ),
    );
  }
}

class InventoryItem {
  final String productName;
  final String sku;
  final int stock;
  final bool isLowStock;

  InventoryItem({
    required this.productName,
    required this.sku,
    required this.stock,
    this.isLowStock = false,
  });
}

class InventoryTable extends StatelessWidget {
  final List<InventoryItem> inventoryItems = [
    InventoryItem(
      productName: 'Hans Poundo Potato',
      sku: 'HP-POT-001',
      stock: 20,
      isLowStock: false,
    ),
    InventoryItem(
      productName: 'Hans Poundo Potato',
      sku: 'HP-POT-002',
      stock: 20,
      isLowStock: true,
    ),
    InventoryItem(
      productName: 'Hans Poundo Potato',
      sku: 'HP-POT-003',
      stock: 20,
      isLowStock: false,
    ),
    InventoryItem(
      productName: 'Hans Poundo Potato',
      sku: 'HP-POT-004',
      stock: 20,
      isLowStock: false,
    ),
  ];

  InventoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SmivoxButtonWithIcon(
                widget: Icon(Icons.add, color: Colors.white),
                text: "New",
                horPad: 5,
                verPad: 8,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddProductDialog(
                          onSubmit: (name, unitPrice, bulkPrice, description, quantity, category) {
                            print("Product Added: $name, $unitPrice");
                          },
                        );
                      }
                  );
                },
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
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SmivoxFilter(
                          onSubmit: (category, labelStatus, price, manufacturer, brand, date) {
                            print("Product Added: $category, $labelStatus");
                          } );
                      }
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          SmivoxSearchBar(hintText: "Search products",),
          const SizedBox(height: 24),
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
              child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: inventoryItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = inventoryItems[index];
                return GestureDetector(
                  onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                              return SingleProductPage();
                          }
                      );
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
                        children: [
                          // Number badge
                          Center(
                            child: CommonMethods.appTexts(
                              context,
                              '${index + 1}'.padLeft(2, '0'),
                                color: Colors.black,
                                fontSize: 16,
                              ),
                          ),
                          const SizedBox(width: 8),

                          // Product Info
                          Expanded(
                            flex: 3,
                            child: Row(
                              spacing: 5,
                               children: [
                                 Image.asset("assets/images/crop-ethnic-person-recharging-device 1.png", width: 40, height: 40,),
                                 Expanded(
                                   flex: 3,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       CommonMethods.appTexts(
                                         context,
                                         item.productName,
                                         fontSize: 16,
                                         fontWeight: FontWeight.w500,
                                         color: Colors.grey[800],
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                       const SizedBox(height: 4),
                                       Text(
                                         'SKU: ${item.sku}',
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.grey[600],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                            )
                          ),

                          // Stock Info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Stock: ${item.stock}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.isLowStock ? 'Low stock' : 'In stock',
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                  item.isLowStock
                                      ? Colors.orange[700]
                                      : Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
                        ),
            ),
        ],
      ),
    );
  }
}
