import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/add_category_dialog.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/smivox_page_title.dart';


class AddProductDialog extends StatelessWidget {
  final Function(String name, String unitPrice, String bulkPrice, String description, String quantity, String category) onSubmit;

  const AddProductDialog({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
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
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40.0, bottom: 10),
              child:
              SmivoxPageTitle(
                pageTitle: "Create Product",
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
                    _buildTextField('Name', nameController, isRequired: true),
                    _buildTextField('Unit Price', unitPriceController, isRequired: true, keyboardType: TextInputType.number),
                    _buildTextField('Bulk Price', bulkPriceController, keyboardType: TextInputType.number),
                    _buildTextField('Description', descriptionController),
                    _buildTextField('Quantity', quantityController, isRequired: true, keyboardType: TextInputType.number),
                      Row(
                       children: [
                         Expanded(
                           child: _buildTextField('Category', categoryController, hintText: "Start typing to search"),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0, right: 10),
                           child: GestureDetector(
                               onTap: () {
                                   showDialog(
                                       context: context,
                                       builder: (context) {
                                           return AddCategoryDialog();
                                       }
                                   );
                               },
                               child: Icon(Icons.add_circle_outline, color: AppColors.primary)),
                         )
                       ],
                    ),
                    _buildTextField('Brand', categoryController),
                    _buildTextField('Manufacturer', categoryController),
                    _buildTextField('ISBN', categoryController, hasQuestionMark: true, tooltip: 'A unique 13-digit (or 10-digit for older books) identifier assigned to books.',),
                    _buildTextField('Tax', categoryController, hasQuestionMark: true, tooltip: 'The applicable tax rate (e.g., VAT, GST, or sales tax) for the product',),
                    _buildTextField('Expiry Date', categoryController),
                    _buildImageTextField("Image"),
                    _buildTextField('Label type', categoryController, hintText: "Select label type"),
                    _buildScanLabelContainer('Scan label'),
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
               child: SmivoxButton(
                   text: "Add product",
                   onTap: () => Navigator.pop(context),
                   // onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.inventoryScreen)
               ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      // bool isRequired,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
        bool hasQuestionMark = false,
        String tooltip = '',
        String hintText = '',
        bool isRequired = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
      child: Column(
        spacing: 5,
        children: [
           Row(
             spacing: 3,
              children: [
                Text(label, style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "Poppins"
                )
                ),
                if (isRequired)
                Text(
                    "*", style: TextStyle(
                  color: AppColors.primary, fontSize: 20,
                  fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"
                  )
                ),
                if (hasQuestionMark)
                  Tooltip(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    showDuration: Duration(seconds: 30),
                    message: tooltip,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Icon(
                      CupertinoIcons.question_circle,
                      size: 18,
                      color: AppColors.darkGrey,
                    ),
                  ),
              ],
           ),
          SmivoxInputFields(
            controller: controller,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 14
            ),
            // keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }

  Widget _buildImageTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
      child: Column(
        spacing: 3,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "Poppins"
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.inactiveGrey.withOpacity(0.1),
            ),
            child: Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/inventory/image-add.svg"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      RichText(
                        textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Drag or ",
                            style: TextStyle(
                               color: AppColors.darkGrey,
                               fontFamily: "Poppins",
                            ),
                            children: <TextSpan>[
                                 TextSpan(
                                   text: 'Browse images',
                                   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent),
                                 ),
                            ]
                          ),
                      ),
                      Text(
                        "You can add up to 2 images here",
                        textAlign: TextAlign.center,
                         style: TextStyle(
                            color: AppColors.inactiveGrey,
                           fontFamily: "Poppins",
                           fontSize: 12,
                         ),
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildScanLabelContainer(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
      child: Column(
        spacing: 3,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "Poppins"
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.inactiveInput)
            ),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/inventory/barcode.svg"),
                Column(
                  children: [
                    Text(
                      "Scan label",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Scan with your mobile device",
                      style: TextStyle(
                        color: AppColors.inactiveGrey,
                        fontFamily: "Poppins",
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
