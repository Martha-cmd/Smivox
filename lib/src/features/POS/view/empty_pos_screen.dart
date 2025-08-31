import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import '../../../commons/smivox_app_bar.dart';


class EmptyPosScreen extends StatefulWidget {
  const EmptyPosScreen({super.key});

  @override
  State<EmptyPosScreen> createState() => _EmptyPosScreen();
}

class _EmptyPosScreen extends State<EmptyPosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SmivoxPageTitle(pageTitle: "Point of Sales", pageIcon: Icon(Icons.keyboard_arrow_down)),


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

          ],
        ),
      ),
    );
  }
}




