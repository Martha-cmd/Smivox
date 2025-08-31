import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_footer_button.dart';

import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button_with_icon.dart';
import '../../../commons/smivox_page_title.dart';

class CompleteSaleDialog extends StatefulWidget {
  const CompleteSaleDialog({super.key});

  @override
  State<CompleteSaleDialog> createState() => _CompleteSaleDialogState();
}

class _CompleteSaleDialogState extends State<CompleteSaleDialog> {
  bool isSaleComplete = false;
  bool printReceipt = false;

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
             padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0, bottom: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SmivoxPageTitle(
                   pageTitle: "Complete Sale",
                   pageIcon: SvgPicture.asset("assets/svgs/remove.svg"),
                   iconAction: () => Navigator.pop(context),
                 ),
                 SizedBox(height: 32),
                 CommonMethods.appTexts(
                     context,
                     "Complete Sale",
                     fontWeight: FontWeight.w500,
                     fontSize: 16
                 ),
                 SizedBox(height: 8),
                 Row(
                   children: [
                     Expanded(
                         child: SmivoxButtonWithIcon(
                           text: "No",
                           textColor: !isSaleComplete ? AppColors.primary : AppColors.darkGrey,
                           bckgrndColor: !isSaleComplete ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                           borderWidth: 1,
                           borderColor: !isSaleComplete ? AppColors.primary : AppColors.inactiveInput,
                           widget: !isSaleComplete
                               ? Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Icon(Icons.check_circle, color: AppColors.primary),
                             ],
                           ) : null,
                           onTap: () {
                              setState(() {
                                 isSaleComplete = false;
                              });
                           },
                         )
                     ),
                     SizedBox(width: 19),
                     Expanded(
                         child: SmivoxButtonWithIcon(
                           text: "Yes",
                           textColor: isSaleComplete ? AppColors.primary : AppColors.darkGrey,
                           bckgrndColor: isSaleComplete ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                           borderWidth: 1,
                           borderColor: isSaleComplete ? AppColors.primary : AppColors.inactiveInput,
                           widget: isSaleComplete
                               ? Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Icon(Icons.check_circle, color: AppColors.primary),
                             ],
                           ) : null,
                           onTap: () {
                             setState(() {
                               isSaleComplete = true;
                             });
                           },
                         )
                     ),
                   ],
                 ),

                 SizedBox(height: 32),
                 CommonMethods.appTexts(
                     context,
                     "Print Receipt",
                     fontWeight: FontWeight.w500,
                     fontSize: 16
                 ),
                 SizedBox(height: 8),
                 Row(
                   children: [
                     Expanded(
                         child: SmivoxButtonWithIcon(
                           text: "No",
                           textColor: !printReceipt ? AppColors.primary : AppColors.darkGrey,
                           bckgrndColor: !printReceipt ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                           borderWidth: 1,
                           borderColor: !printReceipt ? AppColors.primary : AppColors.inactiveInput,
                           widget: !printReceipt
                               ? Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Icon(Icons.check_circle, color: AppColors.primary),
                             ],
                           ) : null,
                           onTap: () {
                             setState(() {
                               printReceipt = false;
                             });
                           },
                         )
                     ),
                     SizedBox(width: 19),
                     Expanded(
                         child: SmivoxButtonWithIcon(
                           text: "Yes",
                           textColor: printReceipt ? AppColors.primary : AppColors.darkGrey,
                           bckgrndColor: printReceipt ? AppColors.lightPrimary : Color(0xFFF7F7F7),
                           borderWidth: 1,
                           borderColor: printReceipt ? AppColors.primary : AppColors.inactiveInput,
                           widget: printReceipt
                               ? Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Icon(Icons.check_circle, color: AppColors.primary),
                             ],
                           ) : null,
                           onTap: () {
                             setState(() {
                               printReceipt = true;
                             });
                           },
                         )
                     ),
                   ],
                 ),
                ],
             ),
           ),
           SmivoxFooterButton(btnText: "Done", onTap: () => Navigator.pop(context),),
        ],
      ),
    );
  }
}
