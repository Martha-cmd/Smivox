// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smivox_inventory_software/src/commons/app_colors.dart';
// import 'package:smivox_inventory_software/src/commons/common_methods.dart';
//
//
// class SmivoxSearchBar extends StatelessWidget {
//   final String hintText;
//   final TextEditingController? controller;
//
//   const SmivoxSearchBar({super.key, required this.hintText, this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//        width: double.infinity,
//        height: 44,
//        decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//           border: Border.all(color: AppColors.inactiveInput, width: 0.2),
//           color: Color(0xFFBDBDBD).withOpacity(0.2),
//        ),
//       child: Row(
//         spacing: 5,
//          children: [
//             SvgPicture.asset('assets/svgs/search 02.svg'),
//             CommonMethods.appTexts(
//                 context,
//                 hintText,
//                 fontSize: 16,
//                 color: AppColors.inactiveGrey,
//             )
//          ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';

class SmivoxSearchBar extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;

  const SmivoxSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  State<SmivoxSearchBar> createState() => _SmivoxSearchBarState();
}

class _SmivoxSearchBarState extends State<SmivoxSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    // Only dispose if we created the controller/focus node internally
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.inactiveInput, width: 0.2),
        color: Color(0xFFBDBDBD).withOpacity(0.2),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/svgs/search 02.svg'),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: widget.autofocus,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.inactiveGrey,
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              textInputAction: TextInputAction.search,
            ),
          ),
        ],
      ),
    );
  }
}
