import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';


class CustomInAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showDrawerIcon;


  const CustomInAppBar({
    super.key,
    this.actions,
    this.showDrawerIcon = true,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 50,
              height: 40,
              child: Center(
                child: Icon(Icons.keyboard_arrow_left_rounded, weight: 0.4, size: 40,)
              ),
            ),
          ),
        ),
      ),
      title: title != null ? CommonMethods.appTexts(
        context,
        title!,
        fontWeight: FontWeight.w600,
        fontSize: 20
      ) : null,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.2,
      shadowColor: Color(0xFFFFFFFF),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
