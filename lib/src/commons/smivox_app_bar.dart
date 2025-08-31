import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final List<Widget>? actions;
  final bool showDrawerIcon;

  const CustomAppBar({
    super.key,
    this.scaffoldKey,
    this.actions,
    this.showDrawerIcon = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD3BD),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: CommonMethods.appTexts(
                context,
                "RS",
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () => scaffoldKey?.currentState?.openEndDrawer(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                 border: Border.all(
                   width: 0.8,
                   color: AppColors.inactiveInput,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset(
                "assets/svgs/menu.svg",
                fit: BoxFit.contain,
                color: Colors.black,
                width: 20,
              ),
            ),
          ),
        ),
      ],
      // backgroundColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      shadowColor: Colors.black.withOpacity(0.1),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
