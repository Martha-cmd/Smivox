import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_text_fields.dart';
import '../../../commons/smivox_footer_button.dart';
import '../../../commons/smivox_page_title.dart';

class CreateCustomerDialog extends StatefulWidget {
  const CreateCustomerDialog({super.key});
  @override
  State<CreateCustomerDialog> createState() => _CreateCustomerDialogState();
}

class _CreateCustomerDialogState extends State<CreateCustomerDialog> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController dateCreatedController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
             maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0, bottom: 10),
                      child: SmivoxPageTitle(
                        pageTitle: "Create Customer",
                        pageIcon: SvgPicture.asset("assets/svgs/remove.svg"),
                        iconAction: () => Navigator.pop(context),
                      ),
                    ),

                    SmivoxInappTextFields(label: "First Name", isRequired: true, controller: fNameController, hintText: "Enter customer first name",),
                    SmivoxInappTextFields(label: "Last Name", isRequired: true, controller: fNameController, hintText: "Enter customer last name"),
                    SmivoxInappTextFields(label: "Phone", isRequired: true, controller: fNameController, hintText: "Enter customer phone number"),
                    SmivoxInappTextFields(label: "Email", controller: fNameController, hintText: "Enter customer email"),
                    SmivoxInappTextFields(label: "Gender", controller: fNameController, hintText: "Select customer gender"),
                    SmivoxInappTextFields(label: "Address", controller: fNameController, hintText: "Enter customer address"),
                    SmivoxInappTextFields(label: "City", controller: fNameController, hintText: "Select customer city"),
                    SmivoxInappTextFields(label: "Country", controller: fNameController, hintText: "Select customer country"),
                    SmivoxInappTextFields(label: "Date Created", controller: fNameController, hintText: "Enter date created",),

                    SizedBox(height: 40),
              
              
                  ],
                ),
              ),
            ),
            SmivoxFooterButton(
              btnText: "Save",
              onTap: () {
                Navigator.pop(context);
                },
            )
          ],
        ),
      ),
    );
  }
}
