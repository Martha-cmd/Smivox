import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';


class SmivoxSearchBar extends StatelessWidget {
  final String hintText;

  const SmivoxSearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
       width: double.infinity,
       height: 44,
       decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.inactiveInput, width: 0.2),
          color: Color(0xFFBDBDBD).withOpacity(0.2),
       ),
      child: Row(
        spacing: 5,
         children: [
            SvgPicture.asset('assets/svgs/search 02.svg'),
            CommonMethods.appTexts(
                context,
                hintText,
                fontSize: 16,
                color: AppColors.inactiveGrey,
            )
         ],
      ),
    );
  }
}
