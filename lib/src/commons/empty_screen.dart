// import 'package:flutter/material.dart';
// import 'package:smivox_inventory_software/src/commons/common_methods.dart';
// import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
//
//
// class EmptyScreen extends StatelessWidget {
//   final String image;
//   final String message;
//   final bool btn;
//   final String? action;
//
//   const EmptyScreen({super.key, required this.image, required this.message, required this.btn, this.action});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//              // Image.asset("assets/inventory/notes-edit 01.svg")
//              Image.asset(image),
//              CommonMethods.appTexts(context, message, fontWeight: FontWeight.w600),
//              if (btn)
//                SmivoxButtonWithIcon(text: action),
//         ],
//       ),
//     );
//   }
// }
