// import 'package:flutter/material.dart';
// import 'package:smivox_inventory_software/src/commons/app_colors.dart';
// import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
// import 'package:smivox_inventory_software/src/features/customer/view/create_customer_dialog.dart';
// import 'package:smivox_inventory_software/src/features/customer/view/single_customer_dialog.dart';
// import '../../../commons/common_methods.dart';
// import '../../../commons/smivox_button_with_icon.dart';
// import '../../../commons/smivox_search_bar.dart';
// import '../../sales/components/dash_sales.dart';
// import '../../sales/view/filter_sales.dart';
//
// class CustomerView extends StatefulWidget {
//   const CustomerView({super.key});
//
//   @override
//   State<CustomerView> createState() => _CustomerViewState();
// }
//
// class _CustomerViewState extends State<CustomerView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomInAppBar(title: "Customers"),
//       backgroundColor: AppColors.mainBackground,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 children: [
//                   SalesDashContainer(
//                     dashName: "Total Customers",
//                     dashNumber: "428,089",
//                     rightPad: 50,
//                   ),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//             ),
//             CustomerTable(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomerTable extends StatefulWidget {
//   const CustomerTable({super.key});
//
//   @override
//   State<CustomerTable> createState() => _CustomerTableState();
// }
//
// class _CustomerTableState extends State<CustomerTable> {
//   final List<Map<String, dynamic>> _customers = [
//     {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
//     {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
//     {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
//     {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
//     {'name': 'San Sarah', 'id': '#85B3E', 'selected': false},
//     {'name': 'Mon Michael', 'id': '#76C4F', 'selected': false},
//     {'name': 'Jes Jessica', 'id': '#67D5G', 'selected': false},
//     {'name': 'Dav David', 'id': '#58E6H', 'selected': false},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         SmivoxButtonWithIcon(
//                           widget: Icon(Icons.add, color: Colors.white),
//                           text: "New",
//                           horPad: 5,
//                           verPad: 8,
//                           onTap:
//                               () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                         return CreateCustomerDialog();
//                                     }
//                                 );
//                               }
//                         ),
//                         const SizedBox(width: 10),
//                         // SmivoxButtonWithIcon(
//                         //   widget: Icon(Icons.more_horiz, color: Colors.white),
//                         //   text: "Actions",
//                         //   verPad: 8,
//                         //   horPad: 5,
//                         // ),
//                         const SizedBox(width: 10),
//                         SmivoxButtonWithIcon(
//                           widget: Icon(Icons.filter_list, color: AppColors.primary),
//                           bckgrndColor: Colors.transparent,
//                           borderColor: AppColors.primary,
//                           horPad: 5,
//                           verPad: 8,
//                           text: "Filters",
//                           textColor: AppColors.primary,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return SalesFilter(
//                                   onSubmit: (
//                                       category,
//                                       labelStatus,
//                                       price,
//                                       manufacturer,
//                                       brand,
//                                       date,
//                                       ) {
//                                     print("Product Added: $category, $labelStatus");
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     SmivoxSearchBar(hintText: "Search customers"),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//
//
//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                     itemCount: _customers.length,
//                     itemBuilder: (context, index) {
//                       final customer = _customers[index];
//                       final backgroundColor = index % 2 == 0
//                           ? Colors.grey.withOpacity(0.2) // Even rows (0, 2, 4, ...)
//                           : Colors.white;
//                       return Container(
//                         decoration: BoxDecoration(
//                           color: backgroundColor,
//                           // borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: CheckboxListTile(
//                           value: customer['selected'],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _customers[index]['selected'] = value;
//                             });
//                           },
//                           title: GestureDetector(
//                             onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return SingleCustomerDialog();
//                                     }
//                                 );
//                               },
//                             child: Row(
//                               children: [
//                                 CommonMethods.appTexts(context, customer['name']),
//                                 const Spacer(),
//                                 CommonMethods.appTexts(
//                                   context,
//                                   customer['id'],
//                                   fontSize: 14,
//                                  color: AppColors.textGrey,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           controlAffinity: ListTileControlAffinity.leading,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/features/customer/view/create_customer_dialog.dart';
import 'package:smivox_inventory_software/src/features/customer/view/single_customer_dialog.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button_with_icon.dart';
import '../../../commons/smivox_search_bar.dart';
import '../../sales/components/dash_sales.dart';
import '../../sales/view/filter_sales.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: "Customers"),
      backgroundColor: AppColors.mainBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SalesDashContainer(
                    dashName: "Total Customers",
                    dashNumber: "428,089",
                    rightPad: 50,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            CustomerTable(),
          ],
        ),
      ),
    );
  }
}

class CustomerTable extends StatefulWidget {
  const CustomerTable({super.key});

  @override
  State<CustomerTable> createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  final List<Map<String, dynamic>> _customers = [
    {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
    {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
    {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
    {'name': 'Ada Amira', 'id': '#95A2F', 'selected': false},
    {'name': 'San Sarah', 'id': '#85B3E', 'selected': false},
    {'name': 'Mon Michael', 'id': '#76C4F', 'selected': false},
    {'name': 'Jes Jessica', 'id': '#67D5G', 'selected': false},
    {'name': 'Dav David', 'id': '#58E6H', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
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
                                    return CreateCustomerDialog();
                                  }
                              );
                            }
                        ),
                        const SizedBox(width: 10),
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
                                return SalesFilter(
                                  onSubmit: (
                                      category,
                                      labelStatus,
                                      price,
                                      manufacturer,
                                      brand,
                                      date,
                                      ) {
                                    print("Product Added: $category, $labelStatus");
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SmivoxSearchBar(hintText: "Search customers"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _customers.length,
                  itemBuilder: (context, index) {
                    final customer = _customers[index];
                    final backgroundColor = index % 2 == 0
                        ? Colors.white
                        : Colors.grey.withOpacity(0.2);

                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                      ),
                      child: Row(
                        children: [
                          // Checkbox on the left
                          Checkbox(
                            value: customer['selected'],
                            onChanged: (bool? value) {
                              setState(() {
                                _customers[index]['selected'] = value;
                              });
                            },
                          ),

                          const SizedBox(width: 8),

                          // Customer info that's clickable for navigation
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SingleCustomerDialog();
                                    }
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CommonMethods.appTexts(
                                        context,
                                        customer['name'],
                                        fontSize: 16,
                                      ),
                                    ),
                                    Expanded(
                                      child: CommonMethods.appTexts(
                                        context,
                                        customer['id'],
                                        fontSize: 14,
                                        color: AppColors.textGrey,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
