import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_confirm_dialog.dart';

import '../../../commons/app_colors.dart';
import '../../../commons/smivox_footer_button.dart';
import '../../../commons/smivox_inapp_text_fields.dart';
import '../../../commons/smivox_page_title.dart';


class SingleCategoryDialog extends StatefulWidget {
  const SingleCategoryDialog({super.key});

  @override
  State<SingleCategoryDialog> createState() => _SingleCategoryDialogState();
}

class _SingleCategoryDialogState extends State<SingleCategoryDialog> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController bulkPriceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40.0, bottom: 10),
              child:
              SmivoxPageTitle(
                pageTitle: "A list products",
                pageIcon: SvgPicture.asset("assets/svgs/remove.svg"),
                pageIconColor: AppColors.inactiveGrey,
                iconAction: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SmivoxInappTextFields(label: "Name", isRequired: true, controller: categoryNameController, hintText: "A list products", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Description", controller: categoryNameController),
                    SmivoxInappTextFields(label: "Add products", controller: categoryNameController, hintText: "Start typing to search", suffixIcon: Icon(Icons.keyboard_arrow_down)),
                  ],
                ),
              ),
            ),
            SmivoxFooterButton(widget:
            Row(
              spacing: 16,
                children: [
                    Expanded(child: SmivoxButton(text: "Delete", textColor: AppColors.error, color: Colors.transparent, borderColor: AppColors.error,
                      onTap: () {
                       Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                  return SmivoxConfirmDialog(
                                      btn1text: "No, Cancel",
                                      btn2text: "Yes, Delete",
                                      headText: "Delete A list category? ",
                                      subText: "Are you sure you want to delete this category?",
                                      btn1Color: Colors.grey,
                                    btn2Color: AppColors.error,
                                  );
                              }
                          );
                      },
                    )
                    ),
                    Expanded(child: SmivoxButton(text: "Save")),
                ],
            ),),
          ],
        ),
      ),
    );
  }
}
