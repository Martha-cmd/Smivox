import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/features/staff/view/single_customer_dialog.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button_with_icon.dart';
import '../../../commons/smivox_search_bar.dart';
import '../../sales/components/dash_sales.dart';
import '../../sales/view/filter_sales.dart';
import 'create_staff_dialog.dart';

class StaffView extends StatefulWidget {
  const StaffView({super.key});

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: "Staff"),
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
                    dashName: "Total Staff",
                    dashNumber: "428,089",
                    rightPad: 50,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            StaffTable(),
          ],
        ),
      ),
    );
  }
}

class StaffTable extends StatefulWidget {
  const StaffTable({super.key});

  @override
  State<StaffTable> createState() => _StaffTableState();
}

class _StaffTableState extends State<StaffTable> {
  final List<Map<String, dynamic>> _staff = [
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
                                    return CreateStaffDialog();
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
                    SmivoxSearchBar(hintText: "Search staff"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _staff.length,
                  itemBuilder: (context, index) {
                    final staff = _staff[index];
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
                            value: staff['selected'],
                            onChanged: (bool? value) {
                              setState(() {
                                _staff[index]['selected'] = value;
                              });
                            },
                          ),

                          const SizedBox(width: 8),

                          // Staff info that's clickable for navigation
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SingleStaffDialog();
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
                                        staff['name'],
                                        fontSize: 16,
                                      ),
                                    ),
                                    Expanded(
                                      child: CommonMethods.appTexts(
                                        context,
                                        staff['id'],
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

