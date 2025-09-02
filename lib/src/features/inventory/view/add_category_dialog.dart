import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_footer_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_text_fields.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/smivox_button.dart';
import '../../../commons/smivox_page_title.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryNameController = TextEditingController();
    final TextEditingController unitPriceController = TextEditingController();
    final TextEditingController bulkPriceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();

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
                pageTitle: "Create Category",
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
                    SmivoxInappTextFields(label: "Name", isRequired: true, controller: categoryNameController),
                    SmivoxInappTextFields(label: "Description", controller: categoryNameController),
                    SmivoxInappTextFields(label: "Add products", controller: categoryNameController, hintText: "Start typing to search"),
                  ],
                ),
              ),
            ),
            SmivoxFooterButton(btnText: "Save", onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
