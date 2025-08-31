import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/commons/smivox_footer_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/POS/view/complete_sale_dialog.dart';
import '../../../commons/smivox_page_title.dart';

class CreateSaleDialog extends StatefulWidget {
  const CreateSaleDialog({super.key});

  @override
  State<CreateSaleDialog> createState() => _CreateSaleDialogState();
}

class _CreateSaleDialogState extends State<CreateSaleDialog> {
  bool discount = false;
  bool percentage = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 5,
              children: [
                SmivoxPageTitle(
                  pageTitle: "Create Sale",
                  pageIcon: SvgPicture.asset("assets/svgs/remove.svg"),
                  iconAction: () => Navigator.pop(context),
                ),
                CommonMethods.appTexts(
                    context,
                    "Total Amount to pay: NGN 12O,439.00",
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
                SizedBox(height: 19),
                CommonMethods.appTexts(
                    context,
                    "Discount",
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                ),
                SizedBox(height: 4),
                Row(
                   children: [
                        Expanded(
                            child: SmivoxButtonWithIcon(
                                 text: "No",
                                 textColor: !discount ? AppColors.primary : AppColors.darkGrey,
                                 bckgrndColor: !discount ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                                 borderWidth: 1,
                                 borderColor: !discount ? AppColors.primary : AppColors.inactiveInput,
                                 widget: !discount
                                  ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.check_circle, color: AppColors.primary),
                                ],
                              )
                                  : null,
                              onTap: () {
                                    setState(() {
                                        discount = false;
                                    });
                              },
                            )
                        ),
                        SizedBox(width: 19),
                        Expanded(
                            child: SmivoxButtonWithIcon(
                                text: "Yes",
                                textColor: discount ? AppColors.primary : AppColors.darkGrey,
                                bckgrndColor: discount ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                              borderWidth: 1,
                              borderColor: discount ? AppColors.primary : AppColors.inactiveInput,
                              widget: discount
                                  ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.check_circle, color: AppColors.primary),
                                ],
                              ) : null,
                              onTap: () {
                                setState(() {
                                  discount = true;
                                });
                              },
                            )
                        ),
                   ],
                ),
                if (discount)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    margin: EdgeInsets.only(top: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFF3F3F3)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonMethods.appTexts(
                            context,
                            "Select Discount Type",
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                                child: SmivoxButtonWithIcon(
                                  text: "Amount",
                                  textColor: !percentage ? AppColors.primary : AppColors.darkGrey,
                                  bckgrndColor: !percentage ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                                  borderWidth: 1,
                                  borderColor: !percentage ? AppColors.primary : AppColors.inactiveInput,
                                  widget: !percentage
                                      ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.check_circle, color: AppColors.primary),
                                    ],
                                  )
                                      : null,
                                  onTap: () {
                                    setState(() {
                                      percentage = false;
                                    });
                                  },
                                )
                            ),
                            SizedBox(width: 14),
                            Expanded(
                                child: SmivoxButtonWithIcon(
                                  text: "Percentage",
                                  textColor: percentage ? AppColors.primary : AppColors.darkGrey,
                                  bckgrndColor: percentage ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                                  borderWidth: 1,
                                  borderColor: percentage ? AppColors.primary : AppColors.inactiveInput,
                                  widget: percentage
                                      ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.check_circle, color: AppColors.primary),
                                    ],
                                  ) : null,
                                  onTap: () {
                                    setState(() {
                                      percentage = true;
                                    });
                                  },
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 38),

                        CommonMethods.appTexts(
                            context,
                            !percentage ? "Discount Amount" : "Discount Percentage",
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                        SizedBox(height: 15),
                        SmivoxInputFields(hintText: !percentage ? "0" : "0%")
                      ],
                    ),

                  ),
                SizedBox(height: 24),
                CommonMethods.appTexts(
                    context,
                    "Checkout With",
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                ),
                SizedBox(height: 4),
                Row(
                  spacing: 16,
                   children: [
                        Expanded(
                         child: SmivoxButtonWithIcon(
                           text: "Cash",
                           textColor: AppColors.darkGrey,
                           bckgrndColor: Color(0xFFF7F7F7),
                           borderWidth: 1,
                           borderColor: AppColors.inactiveInput,
                           myFontWeight: FontWeight.normal,
                         )
                     ),
                        Expanded(
                            child: SmivoxButtonWithIcon(
                                text: "Card",
                                textColor: AppColors.darkGrey,
                                bckgrndColor: Color(0xFFF7F7F7),
                                borderWidth: 1,
                              borderColor: AppColors.inactiveInput,
                              myFontWeight: FontWeight.normal,
                            )
                        ),
                        Expanded(
                            child: SmivoxButtonWithIcon(
                                text: "Transfer",
                                textColor: AppColors.darkGrey,
                                bckgrndColor: Color(0xFFF7F7F7),
                                borderWidth: 1,
                              borderColor: AppColors.inactiveInput,
                              myFontWeight: FontWeight.normal,
                            )
                        ),
                   ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                       CommonMethods.appTexts(
                           context,
                           "Select payment method",
                           color: AppColors.error,
                           fontWeight: FontWeight.w500
                       ),
                   ],
                ),

              ],
            ),
          ),
          SmivoxFooterButton(
              btnText: "Continue",
            onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                           return CompleteSaleDialog();
                      }
                  );
            },
          )
        ],
      ),
    );
  }
}

