import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/smivox_button.dart';
import '../../../commons/smivox_inapp_text_fields.dart';


class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
       child: Column(
           mainAxisSize: MainAxisSize.min,
             children: [
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0, bottom: 10),
                         child: SmivoxPageTitle(
                           pageTitle: "Create Category",
                           pageIcon: CupertinoIcons.clear_circled_solid,
                           pageIconColor: AppColors.inactiveGrey,
                           iconAction: () => Navigator.pop(context),
                         ),
                       ),
                       SmivoxInappTextFields(label: 'Name', controller: nameController,  isRequired: true),
                       SmivoxInappTextFields(label: 'Description', controller: descriptionController),
                     ],
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
                 child: SmivoxButton(text: "Save", onTap: () => Navigator.pop(context)),
               )
             ],
       ),
    );
  }
}
