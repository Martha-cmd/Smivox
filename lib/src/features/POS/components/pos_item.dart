import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';

class POSItem extends StatelessWidget {
  final Color? labelStatus;

  const POSItem({super.key, this.labelStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16,
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Image.asset("assets/images/crop-ethnic-person-recharging-device 1.png", width: 40, height: 50,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        CommonMethods.appTexts(
                            context,
                            "Aqua Sunscreen",
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: labelStatus ?? Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        RichText(
                          text: TextSpan(text: "Qty: ",
                            style: TextStyle(
                              color: AppColors.inactiveGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", color: AppColors.primary)),
                            ],
                          ),
                        ),
                        CommonMethods.appTexts(
                          context,
                          'NGN 30,000',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset("assets/pos/pos-add.svg", width: 35, height: 35),
                SvgPicture.asset("assets/pos/pos-remove.svg", width: 35, height: 35),
                SvgPicture.asset("assets/pos/pos-exit.svg", width: 35, height: 35,),
              ],
            )
          ],
        ),
        const Divider(color: Color(0xFFD9D9D9), thickness: 0.5,),
      ],
    );
  }
}
