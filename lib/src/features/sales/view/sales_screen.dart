import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/sales/components/sales_table.dart';
import '../../../commons/smivox_page_title.dart';
import '../../inventory/view/inventory_screen.dart';
import '../components/dash_sales.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SmivoxPageTitle(pageTitle: "Sales"),

                const SizedBox(height: 16),
                SalesDash(),
              ],
            ),
          ),
          const SizedBox(height: 26),
          SalesTable(),
        ],
      ),
    );
  }
}
