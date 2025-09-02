import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commons/smivox_footer_button.dart';
import '../../../commons/smivox_inapp_text_fields.dart';
import '../../../commons/smivox_page_title.dart';


class SingleCustomerDialog extends StatefulWidget {
  const SingleCustomerDialog({super.key});

  @override
  State<SingleCustomerDialog> createState() => _SingleCustomerDialogState();
}

class _SingleCustomerDialogState extends State<SingleCustomerDialog> {
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
                        pageTitle: "AdaAmira #95A2F",
                        pageIcon: SvgPicture.asset("assets/svgs/remove.svg"),
                        iconAction: () => Navigator.pop(context),
                      ),
                    ),

                    SmivoxInappTextFields(label: "First Name", isRequired: true, controller: fNameController, hintText: "Ada", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Last Name", isRequired: true, controller: fNameController, hintText: "Amara", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Phone", isRequired: true, controller: fNameController, hintText: "+234 456 234 9870", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Email", controller: fNameController, hintText: "adaamira@gmail.com", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Gender", controller: fNameController, hintText: "Female", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Address", controller: fNameController, hintText: "No 3 Adelabu Lokoja", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "City", controller: fNameController, hintText: "Ikoyi", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Country", controller: fNameController, hintText: "Nigeria", hintColor: Colors.black),
                    SmivoxInappTextFields(label: "Date Created", controller: fNameController, hintText: "03-May-2015", hintColor: Colors.black),

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
