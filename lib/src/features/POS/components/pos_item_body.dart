import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/POS/components/pos_item.dart';
import '../../../commons/smivox_button_with_icon.dart';
import '../../../commons/smivox_search_bar.dart';


class POSItemBody extends StatelessWidget {
  const POSItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmivoxButtonWithIcon(
            widget: Icon(Icons.adf_scanner_outlined, color: Colors.white),
            text: "Scan item to add",
          ),

          const SizedBox(height: 10),
          SmivoxSearchBar(hintText: "Search product"),

          const SizedBox(height: 24),
          Column(
            spacing: 24,
            children: [
              POSItem(),
              POSItem(labelStatus: Colors.red),
              POSItem(),
              POSItem(),
            ],
          ),
        ],
      ),
    );
  }
}
