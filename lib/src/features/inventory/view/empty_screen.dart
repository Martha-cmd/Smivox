import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/add_product_dialog.dart';


class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          SvgPicture.asset("assets/inventory/open-box.svg"),
          // const SizedBox(height: 10),
          CommonMethods.appTexts(
              context,
              "Your inventory is empty, let’s fill it securely",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              maxLines: 2,
              textAlign: TextAlign.center
          ),
          const SizedBox(height: 10),
          SmivoxButtonWithIcon(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddProductDialog(
                    onSubmit: (name, unitPrice, bulkPrice, description, quantity, category) {
                      print("Product Added: $name, $unitPrice");
                    },
                  );
                },
              );
            },
              text: "Add Products"
          ),
        ],
      ),
    );
  }
  
}
