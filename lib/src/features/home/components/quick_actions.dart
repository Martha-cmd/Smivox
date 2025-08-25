import 'package:flutter/material.dart';
import '../../../commons/common_methods.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          spacing: 18,
          children: [
            Row(
              spacing: 16,
              children: [
                QuickActionsSingleContainer(color: Color(0xFFDCC7DB), image: 'assets/home/add-product.png', text: "Add Products"),
                QuickActionsSingleContainer(color: Color(0xFFD2F1C3), image: 'assets/home/check-inventory.png', text: "Check inventory"),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                QuickActionsSingleContainer(color: Color(0xFF7D7626).withOpacity(0.5), image: 'assets/home/sales.png', text: "Sales"),
                QuickActionsSingleContainer(color: Color(0xFFFFD3BD), image: 'assets/home/create-staff.png', text: "Create Staff"),
              ],
            ),
          ],
        )
    );
  }
}

class QuickActionsSingleContainer extends StatelessWidget {
  final Color color;
  final String image;
  final String text;

  const QuickActionsSingleContainer({super.key, required this.color, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        // height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color,
        ),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image),
            CommonMethods.appTexts(
              context,
              text,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
