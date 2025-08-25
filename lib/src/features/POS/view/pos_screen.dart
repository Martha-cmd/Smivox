import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import '../components/pos_item_body.dart';


class POS extends StatefulWidget {
  const POS({super.key});

  @override
  State<POS> createState() => _POSState();
}

class _POSState extends State<POS> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SmivoxPageTitle(pageTitle: "Point of Sales", pageIcon: Icons.keyboard_arrow_down),
      
      
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                       color: Color(0xFFFFD3BD).withOpacity(0.5),
                       borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                           Container(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                              width: 169,
                              height: 50,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   CommonMethods.appTexts(
                                       context,
                                       "Guest",
                                     fontSize: 16,
                                     fontWeight: FontWeight.w500
                                   ),
                                   Icon(Icons.keyboard_arrow_down, size: 18)
                                ],
                             ),
                           ),
                           CommonMethods.appTexts(context, "Order id: -", fontSize: 16, fontWeight: FontWeight.w500)
                       ],
                    ),
                  ),
      
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        CommonMethods.appTexts(
                            context,
                            "Cashier: Paul Ayomide",
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                          fontSize: 16
                        ),
                       Row(
                         spacing: 20,
                          children: [
                            CommonMethods.appTexts(context, "Items: -", fontSize: 16, fontWeight: FontWeight.w500),
                            CommonMethods.appTexts(context, "Qty: -", fontSize: 16, fontWeight: FontWeight.w500)
                          ],
                       )
                     ],
                  ),
                ],
              ),
            ),
           const SizedBox(height: 24),
          POSItemBody(),
      
           const SizedBox(height: 24),
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,),
             child: Column(
               spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonMethods.appTexts(
                          context,
                          "Total Amount"
                      ),
                      CommonMethods.appTexts(
                          context,
                          "NGN 120,000.0",
                          fontSize: 24,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SmivoxButtonWithIcon(
                           widget: SvgPicture.asset("assets/pos/tick-double.svg"),
                           text: "Save Order",
                           horPad: 30,
                         verPad: 12,
                       ),
                       SmivoxButtonWithIcon(
                           widget: SvgPicture.asset("assets/pos/cart-check.svg"),
                           text: "Checkout",
                         horPad: 30,
                         verPad: 12,
                       ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SmivoxButtonWithIcon(
                           widget: SvgPicture.asset("assets/pos/trash.svg"),
                           text: "Clear Cart",
                           bckgrndColor: Colors.transparent,
                           borderColor: AppColors.error,
                           textColor: AppColors.error,
                           horPad: 30,
                         verPad: 12,
                       ),
                       SmivoxButtonWithIcon(
                           widget: SvgPicture.asset("assets/pos/file-download 01.svg"),
                           text: "Print Invoice",
                           horPad: 20,
                           verPad: 12,
                       ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
             )
           )
         ],
      ),
    );
  }
}




