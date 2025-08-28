import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_text_fields.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import 'app_colors.dart';

class SmivoxFilter extends StatelessWidget {
  final Function(
    String category,
    String labelStatus,
    String price,
    String manufacturer,
    String brand,
    String date,
  )
  onSubmit;

  const SmivoxFilter({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController labelStatusController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController manufacturerController = TextEditingController();
    final TextEditingController brandController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    String hintText = "Start typing to search";

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 40.0,
                bottom: 10,
              ),
              child: SmivoxPageTitle(
                pageTitle: "Filter Products",
                pageIcon: CupertinoIcons.clear_circled_solid,
                pageIconColor: AppColors.inactiveGrey,
                iconAction: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SmivoxInappTextFields(label: 'Category', controller: categoryController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Label Status', controller: labelStatusController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Price', controller: priceController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Manufacturer', controller: categoryController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Brand', controller: categoryController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Quantity', controller: categoryController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Expiry Date', controller: categoryController, hintText: hintText),
                    SmivoxInappTextFields(label: 'Date', controller: categoryController, hintText: hintText),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SmivoxButtonWithIcon(
                       text: "Clear",
                       borderColor: AppColors.error,
                       bckgrndColor: Colors.transparent,
                       textColor: AppColors.error,
                       horPad: 50,
                     onTap: () => Navigator.pop(context),
                   ),
                   SmivoxButtonWithIcon(
                       text: "Apply",
                       horPad: 50,
                      onTap: () => Navigator.pop(context),
                   ),
                 ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
