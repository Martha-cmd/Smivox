import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_footer_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';

class ReturnSales extends StatefulWidget {
  const ReturnSales({super.key});

  @override
  State<ReturnSales> createState() => _ReturnSalesState();
}

class _ReturnSalesState extends State<ReturnSales> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
           children: [
             Padding(
                 padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0, bottom: 30),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonMethods.appTexts(
                              context,
                              "Return Items || Sale 95A2FFC6",
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset("assets/svgs/remove.svg")),
                        ],
                     ),
                     SizedBox(height: 32),
                     SmivoxInputFields(
                         headText: "Items to return",
                         hintText: "Start typing to search",
                         suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.inactiveInput,)
                     ),
                     SizedBox(height: 175),
                   ],
                 ),
               ),
             SmivoxFooterButton(btnText: "Submit",
             onTap: () => Navigator.pop(context),
             )
           ],
        ),
      ),
    );
  }
}
