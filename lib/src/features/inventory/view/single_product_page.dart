import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_confirm_dialog.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_text_fields.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/smivox_button.dart';
import '../../../commons/smivox_page_title.dart';


class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController unitPriceController = TextEditingController();
    final TextEditingController bulkPriceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController brandController = TextEditingController();
    final TextEditingController manufacturerController = TextEditingController();


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
                pageTitle: "Hans Poundo Potato",
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
                    
                    SmivoxInappTextFields(label: "Name", controller: nameController, hintText: "Hans Poundo Potato",),
                    SmivoxInappTextFields(label: "Unit Price", controller: unitPriceController, hintText: "8000"),
                    SmivoxInappTextFields(label: "Bulk price", controller: bulkPriceController),
                    SmivoxInappTextFields(label: "Description", controller: descriptionController, hintText: "Irish potato poundo"),
                    SmivoxInappTextFields(label: "Quantity", controller: quantityController, hintText: "500"),
                    SmivoxInappTextFields(label: "Category", controller: categoryController, hintText: "Swallows"),
                    SmivoxInappTextFields(label: "Brand", controller: brandController, hintText: "Hans"),
                    SmivoxInappTextFields(label: "Manufacturer", controller: manufacturerController, hintText: "Pesco Foods"),
                    SmivoxInappTextFields(label: "ISBN", controller: nameController, hasQuestionMark: true, tooltip: 'A unique 13-digit (or 10-digit for older books) identifier assigned to books.',),
                    SmivoxInappTextFields(label: "Tax", controller: nameController, hasQuestionMark: true, tooltip: 'The applicable tax rate (e.g., VAT, GST, or sales tax) for the product',),
                    SmivoxInappTextFields(label: "Expiry Date", controller: nameController, hintText: "23/09/2026"),
                    _buildImageTextField("Image"),
                    SmivoxInappTextFields(label: "Label Status", controller: nameController, hintText: "Success"),
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
                spacing: 20,
                children: [
                  Expanded(
                    child: SmivoxButton(
                      text: "Delete",
                      textColor: AppColors.error,
                      color: Colors.transparent,
                      borderColor: AppColors.error,
                      onTap: () {
                        Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                 return SmivoxConfirmDialog(
                                   headText: 'Delete Hans Potato product? ',
                                   subText: 'Are you sure you want to delete this product?',
                                   btn1text: 'No, Cancel',
                                   btn2text: 'Yes, Delete',
                                   btn1Color: AppColors.inactiveInput,
                                   btn2Color: AppColors.error,
                                   btn1TextColor: Colors.black,
                                 );
                              }
                          );
                      },
                      // onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.inventoryScreen)
                    ),
                  ),
                  Expanded(
                    child: SmivoxButton(
                      text: "Submit",
                      onTap: () => Navigator.pop(context),
                      // onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.inventoryScreen)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
